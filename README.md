# `ubuntu-gcloud`

This is a Docker container based off the latest `ubuntu` container, with the latest `gcloud` tools installed.

You can run it in a variety of ways.

## Use as a gcloud replacement

If you want to use it instead of having `gcloud` installed locally you can just run it:

```
% docker run --rm ubuntu-gcloud
```

You can then pass any arguments directly to `gcloud` like you would if it were installed locally:

```
% docker run -it  --rm ubuntu-gcloud version
Google Cloud SDK 281.0.0
alpha 2020.02.14
beta 2020.02.14
bq 2.0.53
core 2020.02.14
gsutil 4.47
kubectl 2020.02.14
```

## Get a shell

If you want a shell in the container simply pass `bash` as the command:

```
% docker run -it  --rm ubuntu-gcloud bash
root@b7516906eeed:/# 
```

## Run and block

If you want to run it and have it block for you to later exec into it you can also do that:

```
% docker run -it -e BLOCK=yes  --rm ubuntu-gcloud
blocking
```

This might sound strange but is useful in Kubernetes because you can run this container in a Pod or a Deployment or similar and have it block waiting for you to `kubectl exec` in later.

See the [`k8s-deployment.yaml`](k8s-deployment.yaml) file for an example.


## Known issues

Running the container locally in blocking mode prevents `CTRL-C` from being able to kill the container, however `docker kill <container id>` works as expected.