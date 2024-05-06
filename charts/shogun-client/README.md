# Helm chart for SHOGun-GIS-Client

Helm chart that uses the `docker-public.terrestris.de/terrestris/shogun-gis-client` docker image for Kubernetes cluster deployments. The SHOGun-GIS-Client version can be defined in the `Chart.yaml` file by setting `appVersion`.

## Parameter overview

The following table gives an overview about the application specific parameters that might be adjusted in (a custom) `values.yaml` for a given environment:

| Key | Description | Default                             |
|-----|-------------|-------------------------------------|
| `keycloak.host` | The (external) host of the Keycloak server. | `keycloak.example.com`              |
| `keycloak.realm` | The Keycloak realm the application should check all authorizations against. This realm needs to contain the given `keycloak.clientId`, all users and their respective role associations. | `shogun`                            |
| `keycloak.clientId` | The ID of the client inside the given realm. The client is usually specific for this application and holds the required roles (currently `admin`, `user`, `viewer`). Since actual user login takes place the client is usually of access-type `public`. | `shogun-client`                     |
| `keycloak.onLoadAction` | See [here](https://www.keycloak.org/docs/latest/securing_apps/#_javascript_adapter) for details. | `login-required`                    |
| `shogun.base` | The (external) base URL of the SHOGun-Backend | `https://shogun-boot.example.com`   |
| `print.base` | The (external) base URL of the [MapFish Print](https://mapfish.github.io/mapfish-print-doc/) application. | `https://mapfish-print.example.com` |

## Secrets overview

No secrets required.
