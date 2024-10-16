# 6.0.0 (2024-10-15)

### Features

* if `geofence.enableInitScript` is true, the `init-geofence` initContainer will also care about the existence of the geofence database (configured in `geofence.databaseName`), so the database will be created, if it does not yet exist. This is helpful for initial/vanilla deployments.

### BREAKING CHANGES

* The field `geofence.dataSourceUrl` has been removed and is replaced by 3 new value fields:
    * `geofence.databaseHost`
    * `geofence.databasePort`
    * `geofence.databaseName`

You only have to adjust your project/deployment specific `values.yaml` if you were overwriting `geofence.dataSourceUrl` there before. In that case you have to migrate the info that was contained in `geofence.dataSourceUrl` to the 3 new fields.

See [here](https://github.com/terrestris/helm-charts/commit/a4f3168d9d74f5e4638bd2220f81c25c6be6f172).


# 5.0.0 (2024-10-11)

### Features

* default GeoServer version is now 2.26.0 (if not overwritten in the `image.repository` and/or `image.tag` values)

### BREAKING CHANGES

* The value `ingress.annotations.spec.ingressClassName` has been replaced by the new value `ingress.className`
    * You have to adjust your project/deployment specific `values.yaml` if you were overwriting `ingress.annotations.spec.ingressClassName` there before.   In that case you have to set the value in the new field `ingress.className` now.
* The `ingress.hosts.paths` (string) array is now an array of objects with the properties `path` and `pathType`.
    * In case you have to adjust this in your `values.yaml`, here is an example:
        * Before: `paths: [ "/mypath" ]`
        * New:
        ```
        paths:
          - path: /mypath
            pathType: ImplementationSpecific
        ```


See [here](https://github.com/terrestris/helm-charts/commit/c12cfb7a70e1f29e693abc4a880bb2422cbf1876).