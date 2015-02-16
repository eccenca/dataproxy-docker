build: build-image

build-image:
	docker build -t eccenca/dataproxy-docker .

run-config:
	docker run -ti --name dataproxy-docker-config eccenca/dataproxy-docker gcloud auth login

run:
	docker run -d --name dataproxy -p 8080:8080 -p 8000:8000 --volumes-from dataproxy-docker-config eccenca/dataproxy-docker	
