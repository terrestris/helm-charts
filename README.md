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

## Hints for developing helm charts
* You can use https://github.com/terrestris/kind-dev-cluster for deploying a local kubernetes cluster on your machine
* If you want to load an image into your kind cluster, use `kind load docker-image <image>:<tag>` (you maybe need to use `docker pull <image>:<tag>` before)
* Install a helm chart initially with `helm install postgis charts/postgis/ --values charts/postgis/values.yaml`
* Upgrade an existing helm chart with `helm upgrade postgis charts/postgis --values charts/postgis/values.yaml`
* Check `kubectl get pods` to see status
* Check `kubectl describe pod <podname>` to see errors in deployment
* Check `kubectl logs -f <podname>` for container logs
* !Pods do normally not restart if the image has not changed!
  * Use `kubectl delete pod <podname>` to explicitly restart a container
  * TODO: Check if pullStrategy: Always helps. We probably need this anyways if we want to change appVersions in the values files
