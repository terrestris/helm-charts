# terrestris Helm Charts

The helm charts of terrestris. The repository can be found [here](https://terrestris.github.io/helm-charts/).

## Prerequisites
* Helm (package manager for Kubernetes), see also [here](https://helm.sh/)

## Lint charts
In order to lint charts locally, simply run:
```shell
helm lint charts/*
```
or using `helm/chart-testing`:
```shell
docker run -it --network host --workdir=/data --volume ~/.kube/config:/root/.kube/config:ro --volume $(pwd):/data quay.io/helmpack/chart-testing:v3.7.1 ct lint --chart-dirs . --all --validate-maintainers=false
```
Please note: changes in `README.md` are ignored.
