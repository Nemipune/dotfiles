#! /usr/bin/bash
nohup protonmail-bridge --noninteractive > /home/nemipune/documents/logs/bridge_log.txt 2>&1 &
disown
