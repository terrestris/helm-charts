# Helm chart for PostGIS

Helm chart that uses the [`docker.terrestris.de/postgis/postgis`](https://docker.terrestris.de/postgis/postgis) docker image for Kubernetes cluster deployments. The PostGIS version can be defined in the `Chart.yaml` file by setting `appVersion`.

The following parameters can be configured in `values.yaml`:

## Data import

These options allow to set up an initial database:

1. `postgres.customInit`: Will use `init.sql` as a custom init script. This creates the specified role and database.
2. `dataImport`: Extracts the archive available at `dataImport.initDataUrl` and copies all contained SQL files to `/docker-entrypoint-initdb.d`
    * Credentials can be provided by setting `DL_USER` and `DL_PASSWORD` via `extraInitEnv` or `extraInitEnvFrom`
    * Required roles and databases must be created in these sql files.

Both options cannot be enabled together!

## Additional configuration

* `extraEnv`: Map of additional environment variables passed to PostGIS.
* `extraEnvFrom`: Pass additional environment variables from secrets, configmaps etc.
* `extraInitEnv`: Map of additional environment variables passed to the init container.
* `extraInitEnvFrom`: Pass additional environment variables from secrets, configmaps etc. to the init container.
* `persistence.enabled`: Enable persistance (otherwise empty-dir is used)
* `persistence.useExisting`: Use existing persistent volume claim (pvc); default: `false`
* `persistence.existingPvcName`: The name of the existing persistent volume claim (pvc) to use
* `persistence.size`: The size to allocate (default: `8Gi`)
* `persistence.accessMode`: The access mode (default: `ReadWriteOnce`)
* `persistence.storageClassName`: The name of the storage class (empty by default => will use default configured in your cluster)
