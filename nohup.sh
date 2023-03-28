#!/bin/bash

# nohupで実行しつつログはnohup.outに出力、tail -fでnohup.outのログを標準出力に流す
# 本スクリプトを強制終了してもnohupで実行したcount_up.shは実行され続ける
(nohup ./count_up.sh > nohup.out 2>&1&) && tail -f nohup.out