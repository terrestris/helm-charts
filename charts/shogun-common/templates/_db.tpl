{{/*
Create the name of the database host to use
*/}}
{{- define "shogun-common.database.host" -}}
{{- if .Values.postgres.host }}
{{- .Values.postgres.host }}
{{- else }}
{{- printf "%s-postgis" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "shogun-common.database.shogun.credentialsSecret" -}}
{{- $name := default "postgis-shogun-credentials" .Values.postgres.credentialsSecret }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "shogun-common.database.shogun.credentialsSecretKeyPassword" -}}
{{- $name := default "shogun-password" .Values.postgres.credentialsSecretKeyPassword }}
{{- printf "%s" $name }}
{{- end }}
