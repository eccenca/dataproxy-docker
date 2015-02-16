FROM google/cloud-sdk
ENV DEBIAN_FRONTEND noninteractive
ADD dataproxy /data
EXPOSE 8080
EXPOSE 8000
WORKDIR /data
CMD dev_appserver.py --host 0.0.0.0 --admin_host 0.0.0.0 dataproxy/
