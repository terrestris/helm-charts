# Helm chart for SHOGun-Admin-Client

Helm chart that uses the `docker-public.terrestris.de/terrestris/shogun-admin` docker image for Kubernetes cluster deployments. The SHOGun-Admin-Client version can be defined in the `Chart.yaml` file by setting `appVersion`.

## Parameter overview

The following table gives an overview about the application specific parameters that might be adjusted in (a custom) `values.yaml` for a given environment:

| Key | Description | Default                             |
|-----|-------------|-------------------------------------|
| `keycloak.host` | The (external) host of the Keycloak server. | `keycloak.example.com`              |
| `keycloak.realm` | The Keycloak realm the application should check all authorizations against. This realm needs to contain the given `keycloak.clientId`, all users and their respective role associations. | `shogun`                            |
| `keycloak.clientId` | The ID of the client inside the given realm. The client is usually specific for this application and holds the required roles (currently `admin`). Since actual user login takes place the client is usually of access-type `public`. | `shogun-admin`                      |
| `keycloak.authorizedAdminRole` | The role which has access to the shogun admin. | `admin`                             |
| `shogun.appPrefix` | The base path of the SHOGun-Backend (on `shogun.base`). Typically this doesn't need to be updated. | `""`                                |
| `shogun.base` | The (external) base URL of the SHOGun-Backend. | `https://shogun-boot.example.com`   |
| `client.base` | The (external) base URL of the SHOGun-GIS-Client. | `https://shogun-client.example.com` |
| `geoserver.url` | The (external) base URL of the [GeoServer](https://github.com/geoserver/geoserver). | `https://geoserver.example.com`     |

## Secrets overview

No secrets required.
