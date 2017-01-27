#!/usr/bin/env perl
#===============================================================================
#
#         FILE: loop.pl
#
#        USAGE: ./loop.pl
#
#  DESCRIPTION: run pymodoro using event loop
#
#      OPTIONS:
# REQUIREMENTS:
#         BUGS:
#        NOTES:
#       AUTHOR: Nathan Yonkee (Nate), tulanthoar@gmail.com
# ORGANIZATION: N/A
#      VERSION: 1.0
#      CREATED: 12/12/2016 10:22:16 AM
#     REVISION:
#===============================================================================

use perl5i::2;
use IO::All;
use Smart::Comments q@###@;
use DateTime::Tiny;
use Time::HiRes qw@gettimeofday tv_interval@;
use EV;
use AnyEvent;
use AnyEvent::Subprocess;
use AnyEvent::Strict;

my $dt = DateTime::Tiny->now;
my $t0 = [gettimeofday];
### --------------------------------
### Running start-pomodoro.pl
### From directory: io->curdir->absolute.q{}
### Date: $dt->ymdhms
### ________________________________

my $msg    = q@--text=@;
my $notify = q@zenity --@;
my $h      = q@--height=@;
my $w      = q@--width=@;
my $popts  = q@--no-cancel --auto-close@;
my $iotie  = io->file(q@/tmp/pomodoro-status@)->tie->touch->assert;
io->file(qq@$ENV{HOME}/.pomodoro_session@)->touch->assert;
### number of arguments is: scalar @ARGV
my $nameargs = ( scalar @ARGV ) . q{};
### as a string: $nameargs
croak q@either 0 or 2 [work minutes:break minutes] arguments required@
    unless ( $nameargs =~ /[02]/ );
my $pomtime   = 20;
my $breaktime = 7;
( $pomtime, $breaktime ) = @ARGV if $nameargs =~ /2/;
### run time is: $pomtime
### break ime is: $breaktime
my $job = AnyEvent::Subprocess->new(
    delegates => [q@StandardHandles@],
    code =>
        qq@pymodoro -p '>' -b '_' -e '!' -l 20 -ltr -i 2 $pomtime $breaktime@
);
my $run = $job->run;

my $unpause = AnyEvent::Subprocess::Job::Delegate::Callback->new(
    name             => q@unpause@,
    child_setup_hook => method( $runner, @args )
    {
        sleep(10);
        $run->kill(18);
    },
);

my $progress = AnyEvent::Subprocess->new(
    delegates => [ $unpause, q@StandardHandles@ ],
    code => qq@${notify}progress ${msg}'break time' $popts ${w}900 ${h}100@
);
my $progressrun = $progress->run;
$progressrun->delegate(q@stdin@)->handle->push_write(qq@100\n@);

my $cbdel = AnyEvent::Subprocess::Job::Delegate::Callback->new(
    name             => q@callback@,
    child_setup_hook => method( $runner, @args )
    {
        $run->kill(19);
    },
    completion_hook => method( $runner, @args )
    {
        $run->kill(18);
        io->file(qq@$ENV{HOME}/.pomodoro_session@)->touch->assert;
    }
);

my $msgjob = AnyEvent::Subprocess->new(
    delegates => [$cbdel],
    code      => qq@${notify}info ${msg}'start a new timer?' ${w}500 ${h}500@
);

sub elap_percen {
    my ( $minutes, $seconds ) = @_;
    ### remaining time percent : ($minutes * 60 + $seconds)*100/ (60*$breaktime)
    my $remain = ( $minutes * 60 + $seconds ) * 100 / ( 60 * $breaktime );
    return int( 100 - $remain );
}

sub w_l {
    my ( $self, $line ) = @_;
    my $elapsed = 0;
    ### pymodoro line: $line
    $iotie->[0] = $line;
    if ( $line =~ /^P \h [>!]+ \h 00:0[0-9]$/x ) {
        $run->kill(19);
        $progressrun = $progress->run;
    }
    if ( $line =~ /^B \h [_!]+ \h 0([0-9]):([0-9]{2})$/x ) {
        ### Matched second regexp: $&
        ### Matched minutes, seconds captured: $1.q{ }.$2.q{ }
        $elapsed = elap_percen( $1, $2 );
        ### elapsed is: $elapsed
        $progressrun->delegate(q@stdin@)->handle->push_write(qq@$elapsed\n@)
            if $elapsed < 100;
    }
    elsif ( $line =~ /^B \h [0-9]{2}:[0-9]{2} \h \w/x ) {
        ### Matched fourth regexp: $&
        $progressrun->kill(9);
        $msgjob->run;
    }
}

$run->delegate(q@stdout@)->handle->on_read(
    method()
    {
        $self->push_read( line => \&w_l );
    }
);
EV::loop();    # you can use any AnyEvent-compatible event loop, including POE
### Elapsed Time: tv_interval ($t0)
