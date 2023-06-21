# Helm chart for mapproxy

Helm chart that uses the official [`mapproxy` docker image](https://github.com/mapproxy/mapproxy/pkgs/container/mapproxy%2Fmapproxy) for Kubernetes cluster deployments.
The used version of `mapproxy` can be defined in `Chart.yaml`, in particular in property `appVersion`.
By default, the deployed mapproxy in cluster will provide a preconfigured cache of [OWS-terrestris](https://www.terrestris.de/de/openstreetmap-wms/). 

The following mapproxy specific parameters can be configured in (custom) `values.yaml`:
* `persistence.enabled`: A default pvc (persistent volume claim) is used for persistent mapproxy data
* `persistence.size`: Size of pvc (persistent volume claim)
* `persistence.useExisting`: Should an existing pvc (persistent volume claim) be used, default: `false`
* `persistence.existingPvcName`: The name of an existing pvc (persistent volume claim) that should be used to store mapproxy data in

An existing `mapproxy.yaml` can easily be provided via a further config map. In this case add / modify (custom) `values.yaml` as follows:
```yaml
...
customMapproxyConfig:
  enabled: true
  configMapName: your-config-map
```
The config map itself could be created using kubectl via `kubectl create configmap your-config-map --from-file mapproxy.yaml`.

Similarly, for the `seed.yaml` the configuration can be loaded from a configmap (e.g. `your-seed-config-map`) as well:
```yaml
...
customSeedConfig:
  enabled: true
  configMapName: your-seed-config-map
```

Please note that cache paths (only if configured) have to match the ones configured in `volume` block (e.g. base cache path: `/mapproxy/config/cache_data`)
