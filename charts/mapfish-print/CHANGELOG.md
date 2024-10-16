# 3.0.0 (2024-10-11)

### BREAKING CHANGES

* The value `ingress.annotations.spec.ingressClassName` has been replaced by the new value `ingress.className`
    * You have to adjust your project/deployment specific `values.yaml` if you were overwriting `ingress.annotations.spec.ingressClassName` there before. In that case you have to set the value in the new field `ingress.className` now.
* The `ingress.hosts.paths` (string) array is now an array of objects with the properties `path` and `pathType`.
    * In case you have to adjust this in your `values.yaml`, here is an example:
        * Before: `paths: [ "/mypath" ]`
        * New:
        ```
        paths:
          - path: /mypath
            pathType: ImplementationSpecific
        ```


See [here](https://github.com/terrestris/helm-charts/commit/908b4d6e28fb0cfd0c9336f916af687e5814202b).