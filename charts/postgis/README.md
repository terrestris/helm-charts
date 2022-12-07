# Helm chart for PostGIS

Helm chart that uses the [`docker.terrestris.de/postgis/postgis`](https://docker.terrestris.de/postgis/postgis) docker image for Kubernetes cluster deployments. The PostGIS version can be defined in the `Chart.yaml` file by setting `appVersion`.

The following parameters can be configured in `values.yaml`:

* `postgres.customInit`: Will use `init.sql` as a custom init script. This creates the specified role and database.
* `dataImport`: Extracts and uses the data available at `dataImport.initDataUrl` as the default data directory. CAUTION! This will overwrite existing data.
  * Credentials can be provided by setting `DL_USER` and `DL_PASSWORD` via `extraInitEnv` or `extraInitEnvFrom`
* `extraEnv`: Map of additional environment variables passed to PostGIS.
* `extraEnvFrom`: Pass additional environment variables from secrets, configmaps etc.
* `extraInitEnv`: Map of additional environment variables passed to the init container.
* `extraInitEnvFrom`: Pass additional environment variables from secrets, configmaps etc. to the init container.
