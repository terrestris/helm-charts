1. variable to disable postgis, admin, client, keycloak, geoserver ✅
2. secrets should be used on both sides (future: sealed secret?)
   1. remove all password from config files ✅
3. shogun-cloud -> shogun ✅
4. geoserver ✅
5. update templates and values with newer version (already updated: _helpers, ingress, service) ✅
    - [x] deployment
    - [x] hpa
    - [x] _helpers.tpl
    - [x] ingress
    - [x] service
    - [x] serviceaccount
5. ingress: ✅
   1. /shogun-client/ -> shogun-client
   2. /shogun-admin/ -> shogun-admin
   3. /shogun-boot/ -> shogun-boot
   4. /keycloak/ -> keycloak
   5. /geoserver/ -> geoserver
6. update ingress config in subcharts ✅
7. provide default values in values.yaml of subcharts ✅
8. provide default values in values.yaml of main chart
9. add comments to values.yml in subcharts and main chart
10. remove test folder ✅
11. squash all commits in merge

ingress locally:
    0. enable ingress
    1. choose hostname
    2. resolve hostname via /etc/hosts
    3. check if tls works
