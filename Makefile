VERSION=$(shell git describe --always --dirty)
NAME=eccenca/dataproxy-docker
TAG=${NAME}:${VERSION}

build: build-image

build-image:
	docker build -t $(TAG) .

do-config:
	docker run -ti --name dataproxy-docker-config $(TAG) gcloud auth login

run-with-config:
	docker run -d --name dataproxy -p 8080:8080 -p 8000:8000 --volumes-from dataproxy-docker-config $(TAG)

run:
	docker run -d --name dataproxy -p 8000:8000 $(TAG)

shell:
	docker run -t --name dataproxy -p 8000:8000 $(TAG) bash

stop:
	docker stop dataproxy

rm:
	docker rm dataproxy
