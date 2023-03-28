
#!/bin/bash

# nohupで実行しつつログはnohup.outに出力、tail -n 0 -f でnohup.outのログをパイプで渡し表示しつつ一行目を消す
# 本スクリプトを強制終了してもnohupで実行したcount_up.shは実行され続ける
(nohup ./count_up.sh > nohup.out 2>&1&) && tail -n 0 -f nohup.out | while read line; do echo $line; sed -i '1d' nohup.out; done
