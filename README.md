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

## Setting up shogun cluster with kind-dev-cluster
```bash
# first we need to build a container containing the default realm settings
docker build -t keycloak-data:1.0 data/keycloak/
kind load docker-image --name kind-dev-cluster keycloak-data:1.0 docker.terrestris.de/postgis/postgis:15-3.3-alpine docker-public.terrestris.de/terrestris/shogun-admin:11.4.0 docker-public.terrestris.de/shogun/shogun-boot:18.0.0 docker-public.terrestris.de/terrestris/shogun-gis-client:6.9.0
cd charts/shogun
helm dependency build
helm install shogun ./ --values ./values.yaml

kubectl port-forward service/shogun-keycloak 1234:https
kubectl port-forward service/shogun-shogun-boot 1235:http
kubectl port-forward service/shogun-shogun-client 1236:http
kubectl port-forward service/shogun-shogun-admin 1237:http
# TODO: use ingress and map services to different folders instead of using port-forwardings
```
