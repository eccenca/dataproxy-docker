# get the image
$ docker pull eccenca/dataproxy-docker

# run

```
$ docker run -d --name dataproxy -p 8080:8080 -p 8000:8000 eccenca/dataproxy-docker
```


# run with config

## auth & save the credentials in gcloud-config volumes
```
$ docker run -ti --name dataproxy-docker-config eccenca/dataproxy-docker gcloud auth login
Go to the following link in your browser: ...
Enter verification code: ...
You are now logged in as [...]
Your current project is [None]. You can change this setting by running:
   $ gcloud config set project <project>
gcloud config set project ...
```

## run dataproxy (with config)
```
$ docker run -d --name dataproxy -p 8080:8080 -p 8000:8000 --volumes_from dataproxy-docker-config eccenca/dataproxy-docker
```
