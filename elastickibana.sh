docker network create elastic
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.17.23
docker run --name es01-test --net elastic -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" -v $(PWD):/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch:7.17.23


docker pull docker.elastic.co/kibana/kibana:7.17.23
docker run --name kib01-test --net elastic -p 127.0.0.1:5601:5601 -e "ELASTICSEARCH_HOSTS=http://es01-test:9200"  -v $(PWD):/usr/share/kibana/data docker.elastic.co/kibana/kibana:7.17.23


