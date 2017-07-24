# docker-php53
php 5.3 bundled with apache and stuff for legacy


* ubuntu 14.04 with degraded repos
* apache2 on port 80
* php 5.3
* bcompiler
* error log to stdout

## usage ##


```
#!bash

docker run --rm -i -v /files:/var/www  icukeng/php53
```
