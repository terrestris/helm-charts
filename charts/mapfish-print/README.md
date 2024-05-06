# Helm chart for mapfish-print

Helm chart that uses the [`mapfish/mapfish-print`](https://github.com/mapfish/mapfish-print) docker image for Kubernetes cluster deployments. The mapfish-print version can be defined in the `Chart.yaml` file by setting `appVersion`.

The following parameters can be configured in (custom) `values.yaml`:

* `storage.printConfigDir`: Where to mount the print app dir.
* `storage.printAppsUrl`: (Optional) External link to a compressed print apps archive (.tar.gz). The data will be extracted during startup.
    * Credentials can be provided by setting `PRINTCONFIG_USER` and `PRINTCONFIG_PASSWORD` via `extraInitEnv` or `extraInitEnvFrom`
* `extraEnv`: Map of additional environment variables passed to mapfish print.
* `extraEnvFrom`: Pass additional environment variables from secrets, configmaps etc.
* `extraInitEnv`: Map of additional environment variables passed to the init container.
* `extraInitEnvFrom`: Pass additional environment variables from secrets, configmaps etc. to the init container.
