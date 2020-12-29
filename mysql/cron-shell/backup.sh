#!/bin/bash
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init3-1@insert_base_data(admin).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init3-2@insert_base_data(auth).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init3-3-1@insert_base_data(mall).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init3-3-2@insert_region_data(mall).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init4-1@insert_test_data(admin).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init4-2@insert_test_data(auth).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init4-3@insert_test_data(mall).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init4-4@insert_test_data(order).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init4-5@insert_test_data(seller).sql
mysql -root -psoubao@2015 < /docker-entrypoint-initdb.d/init4-6@insert_test_data(user).sql
