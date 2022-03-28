{{- define "cortex.minio" -}}
{{- include "DependencyFullname" (dict "chartName" "minio" "chartValues" (index .Values "minio") "context" $) -}}
{{- end -}}