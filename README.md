## Build Image

```console
foo@cli:~$ docker build -t deploy-terraform-aws .
```

## Run

```console
foo@cli:~$ docker run --rm -it -v <Project-folder>:/cli/src deploy-terraform-aws -k <aws_access_key> -s <aws_secret_key> -r <aws_default_region>
```
