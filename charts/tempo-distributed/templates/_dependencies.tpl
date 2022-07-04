{{- define "tempo.memcached" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached" "chartValues" (index .Values "memcached") "context" $) -}}
{{- end -}}
{{- define "tempo.minio" -}}
{{- include "DependencyFullname" (dict "chartName" "minio" "chartValues" (index .Values "minio") "context" $) -}}
{{- end -}}