# Helm chart for github.com/geoserver/geoserver-cloud

Helm chart based on [this chart](https://github.com/camptocamp/helm-geoserver-cloud) to deploy a geoserver-cloud setup in Kubernetes.

As geoserver-cloud is a young project and we use the "parent" chart mentioned above, some conditions need to be fulfilled:

* Provide a NFS (Network file share for GeoServer Datadir and/or GWC and/or raster-/geodata)
* Provide a PostGIS Database (for geodata and/or GeoServer jdbcconfig)

## Example usage in a local cluster

This chart can be tested in a local kubernetes cluster by using [this local cluster setup](https://github.com/terrestris/kind-dev-cluster).

### Setup NFS and Database

The following steps are required for the local setup to work out of the box.
Credits go to the [examples of the parent chart](https://github.com/camptocamp/helm-geoserver-cloud/blob/master/examples/README.md).

#### Setup NFS server on the host

Execute the following commands to setup a NFS server on the host that will be used in your local kubernetes cluster:

```shell
sudo apt install -y nfs-kernel-server nfs-common
sudo mkdir -p /nfs/{raster,datadir,tiles}
sudo chown nobody:nogroup /nfs/{raster,datadir,tiles}
sudo chmod 777 /nfs/{raster,datadir,tiles}
```

Add this to your `/etc/exports` file:

```
/nfs/datadir *(rw,sync,no_subtree_check)
/nfs/tiles *(rw,sync,no_subtree_check)
/nfs/raster *(rw,sync,no_subtree_check)
```

Finally apply the changes:

```
sudo exportfs -a
```

#### Start a Postgis database on the host

Create a directory on your host machine (adjust to your needs): `mkdir -p /your/local/pg_cloud_data`

Startup a PostGIS database (adjust the volume definition to the directory you just created):

```shell
docker run --rm --name=local_gs_cloud_db \
--env=POSTGRES_PASSWORD=password \
--env=POSTGRES_USER=postgres \
--env=POSTGRES_DB=postgres \
--detach --volume /your/local/pg_cloud_data:/var/lib/postgresql/data \
--publish=5432:5432 postgis/postgis:16-3.4-alpine
```

Setup database: `PGPASSWORD=password psql -h localhost -p 5432 -U postgres`

Then:

```sql
CREATE DATABASE ogscloud;
CREATE ROLE username WITH LOGIN PASSWORD 'password';
ALTER DATABASE ogscloud OWNER TO username ;
```

Connect to the database: `\c ogscloud`

Finish the setup:

```sql
CREATE EXTENSION postgis;
CREATE SCHEMA data;
CREATE SCHEMA config;
```

### Example Usage

Startup your local cluster as described [here](https://github.com/terrestris/kind-dev-cluster).

Add `127.0.0.1       gscloud.local` to your `/etc/hosts`.

Add helm repos (only needed once):

* `helm repo add geoserver-cloud https://camptocamp.github.io/helm-geoserver-cloud`
* `helm repo add bitnami https://charts.bitnami.com/bitnami`

In the directory of this chart:

* `helm repo index .` (once)
* Update chart dependencies with `helm dependency update`.
* Execute `helm upgrade --namespace=geoserver --create-namespace --install geoserver .`

Helpful commands:

* If you want to search for new versions, use this: `helm search repo geoserver-cloud/geoservercloud --versions`
* Uninstall: `helm uninstall --namespace geoserver geoserver`

Call http://gscloud.local/geoserver-cloud/web/ to login with the default credentials (admin/geoserver).
