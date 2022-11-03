# Helm chart for github.com/terrestris/docker-geoserver

Helm chart that uses [`terrestris/docker-geoserver`](https://github.com/terrestris/docker-geoserver/) docker image for Kubernetes cluster deployments. The geoserver version can be defined in `Chart.yaml` by setting property `appVersion`.

The following geoserver specific parameters can be configured in (custom) `values.yaml`:

* `environment.stableExtensions`: Comma-seperated list of stable geoserver extensions (`STABLE_EXTENSIONS` environment variable).
* `environment.javaOptions`: Custom java options (`EXTRA_JAVA_OPTS` environment variable). Replace `example.com` with your geoserver host name.
* `extraEnv`: Map of additional environment variables passed to geoserver.
* `extraEnvFrom`: Pass additional environment variables from secrets, configmaps etc.
* `storage.datadir`: Where to mount the geoserver data dir.
* `storage.initDataUrl`: (Optional) External link to an compressed geoserver data dir (.tgz). The data will be extracted during startup.
* `persistence.enabled`: A default pvc (persistent volume claim) is used for persistent geoserver data
* `persistence.size`: Size of pvc (persistent volume claim)
* `persistence.useExisting`: Should an existing pvc (persistent volume claim) be used, default: `false`
* `persistence.existingPvcName`: The name of an existing pvc (persistent volume claim) that should be used to store geoserver data
