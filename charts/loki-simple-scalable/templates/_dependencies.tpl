{{- define "loki.memcachedFrontend" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-frontend" "chartValues" (index .Values "memcached-frontend") "context" $) -}}
{{- end -}}
{{- define "loki.memcachedChunks" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-chunks" "chartValues" (index .Values "memcached-chunks") "context" $) -}}
{{- end -}}
{{- define "loki.memcachedIndexQueries" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-index-queries" "chartValues" (index .Values "memcached-index-queries") "context" $) -}}
{{- end -}}
{{- define "loki.memcachedIndexWrites" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-index-writes" "chartValues" (index .Values "memcached-index-writes") "context" $) -}}
{{- end -}}
{{- define "loki.minio" -}}
{{- include "DependencyFullname" (dict "chartName" "minio" "chartValues" (index .Values "minio") "context" $) -}}
{{- end -}}