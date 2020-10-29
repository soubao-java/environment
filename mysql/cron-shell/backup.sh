#!/bin/bash
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init2.sql
