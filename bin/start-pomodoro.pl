#!/bin/env perl
use Modern::Perl('2015');
use IO::All;
use Proc::Background;

my $iofile = io->file('/tmp/pomodoro-status')->assert->touch;
my $iotie = $iofile->tie;
my $bar = io->pipe(q/pymodoro -p '>' -b '_' -e '|' -l 40 -ltr -i 5/);
while($iofile->is_writable){
    io->file($ENV{HOME}.'/.pomodoro_session')->touch;
    $iotie->[0] = $bar->getline;
    my $p1 = Proc::Background->new("xmessage","pomodoro started", "-timeout", "5");
    until($bar->getline =~ /B/){
        $iotie->[0] = $bar->getline;
    }
    my $p2 = Proc::Background->new("xmessage","break time", "-timeout", "300");
    until($bar->getline =~ /B [0-9]{2}:[0-9]{2}/){
        $iotie->[0] = $bar->getline;
    }
    $p1->die;
    $p2->die;
}
