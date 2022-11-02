# Helm chart for github.com/terrestris/docker-geoserver

Helm chart that uses [`errestris/docker-geoserver`](https://github.com/terrestris/docker-geoserver/) docker image for Kubernetes cluster deployments. The geoserver version can be defined in `Chart.yaml` by setting property `appVersion`.

The following geoserver specific parameters can be configured in (custom) `values.yaml`:
* `environment.stableExtensions`: Comma-seperated list of stable geoserver extensions.
* `environment.javaOptions`: Custom java options. Replace `example.com` with your geoserver host name.
* `storage.datadir`: Where to mount the geoserver data dir.
* `storage.initDataUrl`: External link to an compressed geoserver data dir. The data will be extracted during startup.
* `persistence.enabled`: A default pvc (persistent volume claim) is used for persistent mapproxy data
* `persistence.size`: Size of pvc (persistent volume claim)
* `persistence.useExisting`: Should an existing pvc (persistent volume claim) be used, default: `false`
* `persistence.existingPvcName`: The name of an existing pvc (persistent volume claim) that should be used to store mapproxy data in
