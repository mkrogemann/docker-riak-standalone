FROM centos:7

# installation part
RUN \
  # install epel
  yum install -y epel-release; \
  # update packages
  yum -y update; \
  # install some more required packages
  yum -y install java-1.8.0-openjdk; \
  # install some more useful packages
  yum -y install net-tools telnet less; \
  # install Riak
  yum -y install https://packages.erlang-solutions.com/erlang/riak/FLAVOUR_1_main/riak_2.2.5-1~centos~7_amd64.rpm; \
  # yum cleanup
  yum clean all; \
  # configure Riak (use leveldb, enable search, allow network access from outside container)
  sed -i "s/storage_backend = bitcask/storage_backend = leveldb/" /etc/riak/riak.conf; \
  sed -i "s/search = off/search = on/" /etc/riak/riak.conf; \
  sed -i "s/search\.solr\.start_timeout = 30s/search\.solr\.start_timeout = 60s/" /etc/riak/riak.conf; \
  sed -i "s/listener\.http\.internal = 127\.0\.0\.1:8098/listener\.http\.internal = 0\.0\.0\.0:8098/" /etc/riak/riak.conf; \
  sed -i "s/listener\.protobuf\.internal = 127\.0\.0\.1:8087/listener\.protobuf\.internal = 0\.0\.0\.0:8087/" /etc/riak/riak.conf

COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 8098 8087

ENTRYPOINT ["/entrypoint.sh"]
