# Helm chart for github.com/geoserver/docker

Helm chart that uses the official [GeoServer](https://github.com/geoserver/docker/) docker image for Kubernetes cluster deployments.
The geoserver version can be defined in the `Chart.yaml` file by setting `appVersion`.

The following parameters can be configured in (a custom) `values.yaml`:

* `environment.stableExtensions`: Comma-seperated list of stable geoserver extensions (`STABLE_EXTENSIONS` environment variable).
* `environment.javaOptions`: Custom java options (`EXTRA_JAVA_OPTS` environment variable). Replace `example.com` with your geoserver host name.
* `extraEnv`: Map of additional environment variables passed to geoserver.
* `extraEnvFrom`: Pass additional environment variables from secrets, configmaps etc.
* `storage.dataDir`: Where to mount the geoserver data dir.
* `storage.initDataUrl`: (Optional) External link to an compressed geoserver data dir (.tgz). The data will be extracted during startup.
* `persistence.enabled`: A default pvc (persistent volume claim) is used for persistent geoserver data
* `persistence.size`: Size of pvc (persistent volume claim)
* `persistence.useExisting`: Should an existing pvc (persistent volume claim) be used, default: `false`
* `persistence.existingPvcName`: The name of an existing pvc (persistent volume claim) that should be used to store geoserver data
* `geofence.enableInitScript`: A flag to control whether a init script for geofence should run or not. default: `false`.
* `geofence.dataSourceUrl`: This will only be used if `geofence.enableInitScript` is `true`. Have a look at the `values.yaml` for an example value.
* `geofence.env`: This will only be used if `geofence.enableInitScript` is `true`. Have a look at the `values.yaml` for an example value.
* `monitoring.enableInitScript`: A flag to control whether a init script for the gs monitoring extension should run or not. default: `false`.
* `monitoring.filterProperties`: The file content of the [filter.properties](https://docs.geoserver.org/stable/en/user/extensions/monitoring/configuration.html) used by the monitoring extension. This will only be used if `monitoring.enableInitScript` is `true`. default: see `values.yaml`
* `monitoring.monitorProperties`: The file content of the [monitor.properties](https://docs.geoserver.org/stable/en/user/extensions/monitoring/configuration.html) used by the monitoring extension. This will only be used if `monitoring.enableInitScript` is `true`. default: see `values.yaml`
