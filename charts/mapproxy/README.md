# Helm chart for mapproxy

Helm chart that uses [`terrestris/mapproxy`](https://github.com/terrestris/docker-mapproxy/) docker image for Kubernetes cluster deployments. Beside a running instance of `terrestris/mapproxy`, a nginx is deployed to handle mapproxy's UWSGI requests. The used version of `mapproxy` can be defined in `Chart.yaml`, in particular in property `appVersion`. By default the deployed mapproxy in cluster will provide a preconfigured cache of [OWS-terrestris](https://www.terrestris.de/de/openstreetmap-wms/). 

The following mapproxy specific parameters can be configured in (custom) `values.yaml`:
* `mapproxy.uwsgiProcesses`: The number of uwsgi processes (default: 2)
* `mapproxy.uwsgiThreads`: The number of uwsgi threads (default: 20)
* `persistence.enabled`: A default pvc (persistant volume claim) is used for persistent mapproxy data
* `persistence.size`: Size of pvc (persistant volume claim)
* `persistence.useExisting`: Should an existing pvc (persistant volume claim) be used, default: `false`
* `persistence.existingPvcName`: The name of an existing pvc (persistant volume claim) that should be used to store mapproxy data in
* `extraEnv`: Map of additional environment variables passed to mapproxy.
* `extraEnvFrom`: Pass additional environment variables from secrets, configmaps etc.

An existing `mapproxy.yaml` can easily be provided via a further config map. In this case add / modify (custom) `values.yaml` as follows:
```yaml
...
customMapproxyConfig:
  enabled: true
  configMapName: your-config-map
```
The config map itself could be created using kubectl via `kubectl create configmap your-config-map --from-file mapproxy.yaml`.

Please note that cache paths (only if configured) have to match the ones configured in `volume` block (e.g base cache path: `/srv/mapproxy/cache_data`)
