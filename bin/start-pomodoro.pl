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

# prepare the job
my $job = AnyEvent::Subprocess->new(
    delegates     => [q@StandardHandles@],
    on_completion => method()
    {
        croak q@bad exit status@ unless $self->is_success;
    },
    code => q@pymodoro -p '>' -b '_' -e '!' -l 20 -ltr -i 10@
);
my $run = $job->run;

my $cbdel = AnyEvent::Subprocess::Job::Delegate::Callback->new(
    name             => q@callback@,
    child_setup_hook => method( $runner, @args )
    {
        $run->kill(19)
    },
    completion_hook => method( $runner, @args )
    {
        $run->kill(18)
    }
);

my $progress = AnyEvent::Subprocess->new(
    delegates     => [qw@StandardHandles@],
    on_completion => method()
    {
        croak q@bad exit status@ unless $self->is_success;
    },
    code => qq@${notify}progress ${msg}'break time' $popts ${w}500@
);
my $progressrun = $progress->run;
$progressrun->delegate(q@stdin@)->handle->on_error(
    sub {
        my ( $hdl, $fatal, $m ) = @_;
        say qq@fatal: ${fatal}; error: $m@;
        $progressrun = $progress->run;
        $hdl->push_write($iotie->[0]);
    }
);

my $msgjob = AnyEvent::Subprocess->new(
    delegates     => [$cbdel],
    on_completion => method()
    {
        croak q@bad exit status@ unless $self->is_success;
        io->file(qq@$ENV{HOME}/.pomodoro_session@)->touch->assert;
    },
    code => qq@${notify}info ${msg}'start anew?' ${w}100 ${h}100@
);

sub elap_percen {
    my ( $minutes, $seconds ) = @_;
    ### time percent : ($minutes * 60 + $seconds)*100/300
    return ($minutes * 60 + $seconds)*100/300;
}

sub w_l {
    my ( $self, $line ) = @_;
    my $elapsed = 0;
    ### pymodoro line: $line
    $iotie->[0] = $line;
    if ( $line =~ /^B \h _{0,1}!+ \h 04:5([0-9])$/x ) {
        ### Matched first regexp: $&
        ### seconds captured: $1
        $progressrun = $progress->run;
        $elapsed = elap_percen( 4, 50 + $1 );
### elapsed is: $elapsed
        $progressrun->delegate(q@stdin@)->handle->push_write(qq@$elapsed\n@);
    }
    if ( $line =~ /^B \h [_!]+ \h 0([0-4]):([0-9]{2})$/x ) {
### Matched second regexp: $&
        ### Matched minutes, seconds captured: $1.q{ }.$2.q{ }
        $elapsed = elap_percen( $1, $2 );
        ### elapsed is: $elapsed
        $progressrun->delegate(q@stdin@)->handle->push_write(qq@$elapsed\n@);
    }
    elsif ( $line =~ /^B \h 05:0[0-9] \h min/x ) {
        ### Matched third regexp: $&
        $progressrun->delegate(q@stdin@)->handle->push_write(qq@100\n@);
        $msgjob->run;
    }
    elsif ( $line =~ /^B \h [0-9]{2}:[0-9]{2} \h \w/x ) {
        ### Matched fourth regexp: $&
        $msgjob->run;
    }
    return $line;
}

$run->delegate(q@stdout@)->handle->on_read(
    method()
    {
        $self->push_read( line => \&w_l );
    }
);
$progressrun->delegate(q@stdin@)->handle->push_write(qq@100\n@);
EV::loop();    # you can use any AnyEvent-compatible event loop, including POE
### Elapsed Time: tv_interval ($t0)
