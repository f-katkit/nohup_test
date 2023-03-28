# nohup_test

- `nohup command &` しつつ標準出力にログを吐いたりするテスト
- Mac だとタイミングがシビアで動かないっぽい

## ログファイルに吐き出してそのまま tail -f で読みこむ

- シンプル
- 標準出力(tail -f)を消しても count_up.sh は止まらない

```
(nohup ./count_up.sh > nohup.out 2>&1&) && tail -f nohup.out
```

## ログファイルに吐き出し、tail -f で読み込みつつ出てきたログを順次消す

- ファイルサイズ対策
- 一度 tail をやめた後はそれ以降ログ見たりできないので使い所は注意
- sed で中身を消してるだけなので 0 サイズのファイルは残り続ける
- 標準出力(tail -f)を消しても count_up.sh は止まらない

```
(nohup ./count_up.sh > nohup.out 2>&1&) && tail -n 0 -f nohup.out | while read line; do echo $line; sed -i '1d' nohup.out; done
```
