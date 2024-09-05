#!/bin/bash
echo "192.168.1.1 - - [01/Jul/2023:10:00:01 +0000] \"GET /index.html HTTP/1.1\" 200 2326" > access.log
echo "192.168.1.2 - - [01/Jul/2023:10:00:02 +0000] \"POST /login HTTP/1.1\" 302 0" >> access.log
echo "192.168.1.1 - - [01/Jul/2023:10:00:03 +0000] \"GET /about.html HTTP/1.1\" 200 1234" >> access.log
