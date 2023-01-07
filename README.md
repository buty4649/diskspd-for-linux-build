# diskspd-for-linux-build
buildkit for diskspd
https://github.com/microsoft/diskspd-for-linux

## Tips: Run with Crystal Disk Mark compatible options

```
TARGET_DIR=/data

diskspd -c1G -Zr -b1M -d5 -o8 -t1 -W0 -Sd -w0 -L $TARGET_DIR/diskspd-testfile | tee seq-read-1m-q8-t1.log
diskspd -Zr -b1M -d5 -o8 -t1 -W0 -Sd -w100 -L $TARGET_DIR/diskspd-testfile | tee seq-write-1m-q8-t1.log
diskspd -Zr -b1M -d5 -o1 -t1 -W0 -Sd -w0 -L $TARGET_DIR/diskspd-testfile | tee seq-read-1m-q1-t1.log
diskspd -Zr -b1M -d5 -o1 -t1 -W0 -Sd -w100 -L $TARGET_DIR/diskspd-testfile | tee seq-write-1m-q1-t1.log
diskspd -Zr -b4K -d5 -o32 -t1 -W0 -Sd -w0 -L -r $TARGET_DIR/diskspd-testfile | tee random-read-4k-q32-t1.log
diskspd -Zr -b4K -d5 -o32 -t1 -W0 -Sd -w100 -L -r $TARGET_DIR/diskspd-testfile | tee random-write-4k-q32-t1.log
diskspd -Zr -b4K -d5 -o1 -t1 -W0 -Sd -w0 -L -r $TARGET_DIR/diskspd-testfile | tee random-read-4k-q1-t1.log
diskspd -Zr -b4K -d5 -o1 -t1 -W0 -Sd -w100 -L -r $TARGET_DIR/diskspd-testfile | tee write-read-4k-q1-t1.log
```

reference:
* [Crystal Disk Mark](https://crystalmark.info/ja/software/crystaldiskmark/)
* [【diskspd】ストレージのベンチマーク方法（Linux版CrystalDiskMarkを作ってみた） – Hacker's High](https://hackers-high.com/linux/storage-benchmark-like-crystaldiskmark/) 

