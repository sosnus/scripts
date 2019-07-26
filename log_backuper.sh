#!/bin/bash
ls -l $HOME/log
printf "mv..."
mv $HOME/log/log.txt $HOME/log/$(date +'log_backup_%Y-%m-%d_%H:%M:%S.txt')
ls -l $HOME/log
