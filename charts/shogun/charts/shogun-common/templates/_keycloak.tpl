{{- define "shogun-common.keycloak.credentialsSecret" -}}
{{- $name := default "keycloak" .Values.keycloak.passwordSecret }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "shogun-common.keycloak.credentialsSecretKeyPassword" -}}
{{- $name := default "admin-password" .Values.keycloak.secretKeyPassword }}
{{- printf "%s" $name }}
{{- end }}

{{- define "shogun-common.keycloak.postgis.credentialsSecret" -}}
{{- $name := default "postgis-keycloak-credentials" .Values.keycloak.externalDatabase.existingSecret }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "shogun-common.keycloak.postgis.credentialsSecretKeyPassword" -}}
{{- $name := default "custom-user-password" .Values.keycloak.externalDatabase.existingSecretPasswordKey }}
{{- printf "%s" $name }}
{{- end }}
