FROM mysql/mysql-server:5.7

#将任务脚本复制进容器,需要注意不能放到/var/lib/mysql目录下,该目录随mysql初始化会被清空造成原文件丢失
COPY cron-shell/ /cron-shell/
#将int-shell中的脚本都复制到初始化文件夹中
COPY init/ /docker-entrypoint-initdb.d/
RUN yum -y install crontabs
RUN yum -y install dos2unix
RUN yum -y install sudo
#修正时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >/etc/timezone \
	&& echo '%mysql ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
	&& rm -rf /var/lib/apt/lists/*  \	  
	&& chmod a+x -R /docker-entrypoint-initdb.d