ab.exe -n 1000 -c 100 http://%2:%1/time

ab.exe -n 100000 -c 100 http://%2:%1/time > time.txt
ab.exe -n 1 http://%2:%1/delete_all
ab.exe -n 100000 -c 100 http://%2:%1/write > write.txt
ab.exe -n 100000 -c 100 http://%2:%1/read > read.txt


