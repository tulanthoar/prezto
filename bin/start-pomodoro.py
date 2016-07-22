#!/bin/env python

from subprocess import Popen
from time import sleep
import os

my_home = os.environ["HOME"]
Popen(["touch", my_home + "/.pomodoro_session"])
Popen(["xmessage", "-buttons", "ok", "-default", "ok", "-timeout", "5", "Pomodoro started"])
sleep(1500)
Popen(["xmessage", "-buttons", "ok", "-default", "ok", "-timeout", "300", "break time"])
