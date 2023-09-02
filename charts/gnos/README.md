# Helm Chart for Geonetwork OpenSource

## Prerequisites

1. Install custom resource definitions for elasticsearch

```shell
kubectl create -f https://download.elastic.co/downloads/eck/2.9.0/crds.yaml
```

2. Install the elasticsearch operator with its RBAC rules:

```shell
kubectl apply -f https://download.elastic.co/downloads/eck/2.9.0/operator.yaml
```

see here https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-eck.html#k8s-deploy-eck

## Configuration

This directory contains a helm chart using the official [Geonetwork OpenSource (GNOS)](https://github.com/geonetwork/docker-geonetwork) docker image for Kubernetes cluster deployments.
Since GNOS requires a running instance of ElasticSearch (and Kibana) this is included using custom resources and corresponding configuration files.
The GNOS version can be defined in the `Chart.yaml` file by setting `appVersion`.

The following parameters can be configured in (a custom) `values.yaml`, including the version of ElasticSearch (currently only successfully tested with version 7.1.1):

* `elk.version`: The version of the ELK-stack (currently 7.1.1)
* `elk.name`: The base name of the elk-services - default: `gnos-elk`
* `javaHeapSizeDefinition`: The Java heap size definitions - default `-Xms512M -Xss512M -Xmx2G`; Other environment variables can be placed here as well 
* `persistence.enabled`: A default pvc (persistent volume claim) is used for persistent geoserver data
* `persistence.size`: Size of pvc (persistent volume claim)
* `persistence.useExisting`: Should an existing pvc (persistent volume claim) be used, default: `false`
* `persistence.existingPvcName`: The name of an existing pvc (persistent volume claim) that should be used to store geoserver data
* `persistence.storageClassName`: The name of the storage class to use. Leave empty if the cluster default should be used

By default, it is assumed that a PostgreSQL database (name: `gnos`) exists and can be accessed by the cluster. It can be configured in `values.yaml` by:
```yaml
db:
  name: gnos
  username: postgres
  password: postgres
  host: postgres
  port: 5432
```
