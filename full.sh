#!/bin/bash
echo "time range":
cat access.log | awk '{print $4}' | head -n 1 &&  date | awk '{print $2,$3,$4,$6}' &&

echo "top 5 requested ips"
cat access.log | awk '{print $7}' | sort | uniq -c | sort -rn | head -n 5 > 1.1.txt && cat 1.1.txt &&

echo "top 5 client ips"
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 5 > 2.2.txt && tail -n 5 2.2.txt &&

echo "http codes"
cat access.log | awk '{print $9}'| grep -v "-" | sort | uniq -c | sort -rn > 3.3.txt && cat 3.3.txt && 

echo "status codes 4xx/5xx"
cat access.log | awk '{print $9}' | grep ^4 > 4.4.txt && cat access.log | awk '{print $9}'  | grep ^5 >> 4.4.txt && cat 4.4.txt | uniq -d -c | sort -rn > 4.5.txt && cat 4.5.txt &&

rm -f 1.1.txt 2.2.txt 3.3.txt 4.4.txt 4.5.txt
