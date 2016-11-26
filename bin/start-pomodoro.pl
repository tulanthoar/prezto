#!/bin/env perl
use Modern::Perl('2015');
use IO::All;

my $iofile = io->file('/tmp/pomodoro-status')->assert->touch;
my $iotie = $iofile->tie;
my $bar = io->pipe(q/pymodoro -p '>' -b '_' -e '|' -l 40 -ltr -i 5/);
while($iofile->is_writable){
    io->file($ENV{HOME}.'/.pomodoro_session')->touch;
    $iotie->[0] = $bar->getline;
    my $pid = fork();
    if(not $pid){
        system("xmessage","pomodoro started", "-timeout", "5");
        exit;
    }
    until($bar->getline =~ /B/){
        $iotie->[0] = $bar->getline;
    }
    $pid = fork();
    if(not $pid){
        system("xmessage","pomodoro break", "-timeout", "300");
        exit;
    }
    until($bar->getline =~ /B [0-9]{2}:[0-9]{2}/){
        $iotie->[0] = $bar->getline;
    }
}
