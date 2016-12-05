#!/bin/env perl
use Modern::Perl('2015');
use IO::All;
use Proc::Background;

my $h = "--height=500";
my $w = "--width=500";
my $t = "--timeout=";
my $msg = "--text=";
my $iofile = io->file('/tmp/pomodoro-status')->assert->touch;
my $iotie = $iofile->tie;
while($iofile->is_writable){
    my $bar = io->pipe(q/pymodoro -p '>' -b '_' -e '|' -l 40 -ltr -i 5/);
    io->file($ENV{HOME}.'/.pomodoro_session')->touch;
    $iotie->[0] = $bar->getline;
    my $p1 = Proc::Background->new("zenity", "--question",$msg."pomodoro started" , $t."5", $w, $h);
    until($bar->getline =~ /B/){
        $iotie->[0] = $bar->getline;
    }
    my $p2 = Proc::Background->new("zenity","--question", $msg."break time", $t."300", $w, $h);
    until($bar->getline =~ /B [0-9]{2}:[0-9]{2}/){
        $iotie->[0] = $bar->getline;
    }
    $p1->die;
    $p2->die;
    my $ret = system("zenity","--question", $msg."break over: start new timer", $w, $h);
}
