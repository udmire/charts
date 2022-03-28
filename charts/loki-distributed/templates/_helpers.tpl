{{/*
Expand the name of the chart.
*/}}
{{- define "loki.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "loki.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "loki.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account
*/}}
{{- define "loki.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "loki.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "loki.labels" -}}
helm.sh/chart: {{ include "loki.chart" . }}
{{ include "loki.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "loki.selectorLabels" -}}
app.kubernetes.io/name: {{ include "loki.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create configuration parameters for memcached configuration
*/}}
{{- define "loki.memcached" -}}
{{- if index .Values "memcached-index-queries" "enabled" }}
- "-store.index-cache-read.memcached.expiration=5m"
- "-store.index-cache-read.memcached.addresses=dns+{{ .Release.Name }}-memcached-index-queries.{{ .Release.Namespace }}.svc.{{ .Values.global.clusterDomain }}:11211"
{{- end -}}
{{- if index .Values "memcached-chunks" "enabled" }}
- "-store.chunks-cache.cache-stubs=true"
- "-store.chunks-cache.memcached.addresses=dns+{{ .Release.Name }}-memcached-chunks.{{ .Release.Namespace }}.svc.{{ .Values.global.clusterDomain }}:11211"
{{- end -}}
{{- if index .Values "memcached-index-writes" "enabled" }}
- "-store.index-cache-write.memcached.addresses=dns+{{ .Release.Name }}-memcached-index-writes.{{ .Release.Namespace }}.svc.{{ .Values.global.clusterDomain }}:11211"
{{- end -}}
{{- end -}}

{{/*
Create configuration for frontend memcached configuration
*/}}
{{- define "loki.frontend-memcached" -}}
{{- if index .Values "memcached-frontend" "enabled" }}
- "-frontend.memcached.addresses=dns+{{ template "loki.fullname" . }}-memcached-frontend.{{ .Release.Namespace }}.svc.{{ .Values.global.clusterDomain }}:11211"
{{- end -}}
{{- end -}}

{{/*
Determine the policy api version
*/}}
{{- define "loki.pdbVersion" -}}
{{- if or (.Capabilities.APIVersions.Has "policy/v1/PodDisruptionBudget") (semverCompare ">=1.21" .Capabilities.KubeVersion.Version) -}}
policy/v1
{{- else -}}
policy/v1beta1
{{- end -}}
{{- end -}}

{{/*
Get checksum of config secret or configMap
*/}}
{{- define "loki.configChecksum" -}}
{{- include (print $.Template.BasePath "/loki-configmap.yaml") . | sha256sum -}}
{{- end -}}

{{/*
Get volume of config secret of configMap
*/}}
{{- define "loki.configVolume" -}}
- name: config
  configMap:
    name: {{ template "loki.fullname" . }}-config
{{- end -}}
