#!/usr/bin/env perl
#===============================================================================
#
#         FILE: loop.pl
#
#        USAGE: ./loop.pl
#
#  DESCRIPTION: run pymodoro using event loop
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Nathan Yonkee (Nate), tulanthoar@gmail.com
# ORGANIZATION: N/A
#      VERSION: 1.0
#      CREATED: 12/12/2016 10:22:16 AM
#     REVISION: ---
#===============================================================================

use Modern::Perl q#2015#;

use AnyEvent::Subprocess;
use IO::All;
use Proc::Background;
use Carp qw#croak#;

my $t      = "--timeout=";
my $msg    = "--text=";
my $iofile = io->file('/tmp/pomodoro-status')->touch->assert;
my $iotie  = $iofile->tie;

# prepare the job
my $job = AnyEvent::Subprocess->new(
    delegates     => ['StandardHandles'],
    on_completion => sub { croak 'bad exit status' unless $_[0]->is_success; },
    code          => q#pymodoro -p '>' -b '_' -e '|' -l 20 -ltr -i 10#
);
my $run = $job->run;

my $msgjob = AnyEvent::Subprocess->new(
    delegates     => ['StandardHandles'],
    on_completion => sub {
        io->file( $ENV{HOME} . '/.pomodoro_session' )->touch;
        $run->kill(18);
    },
    code => sub {
        $run->kill(19);
        my $ret = system( "zenity", "--info", $msg . "start anew",
            "--width=100", "--height=100" );
        exit $ret;
    }
);

$run->delegate(q#stdout#)->handle->on_read(
    sub {
        my ($hand) = @_;
        $hand->push_read(
            line => sub {
                my ( $h, $line ) = @_;
                if ( $line =~ /B .* 0[0-4]:[0-9]{2}/ ) {
                    Proc::Background->new( "zenity", "--info",
                        $msg . "break time " . $line,
                        $t . "9", "--width=700", "--height=700" );
                }
                elsif ( $line =~ /B [0-9]{2}:[0-9]{2}/ ) {
                    $msgjob->run;
                }
                else { $iotie->[0] = $line; }
            }
        );
    }
);

EV::loop();    # you can use any AnyEvent-compatible event loop, including POE
