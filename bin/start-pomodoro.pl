#!/bin/env perl
use Modern::Perl('2015');
use utf8;
use IO::All;

my $tmpfile = io '/tmp/pomodoro-status';
my $bar = io->pipe(q/pymodoro -p '>' -b '_' -e '|' -l 40 -ltr -i 5/);
while($tmpfile->is_writable){
    io->file($ENV{HOME}.'/.pomodoro_session')->touch;
    $tmpfile->[0] = $bar->getline;
    my $pid = fork();
    if(not $pid){
        system("xmessage","pomodoro started", "-timeout", "5");
        exit;
    }
    until($bar->getline =~ /B/){
        $tmpfile->[0] = $bar->getline;
    }
    $pid = fork();
    if(not $pid){
        system("xmessage","pomodoro break", "-timeout", "300");
        exit;
    }
    until($bar->getline =~ /B [0-9]{2}:[0-9]{2}/){
        $tmpfile->[0] = $bar->getline;
    }
}
