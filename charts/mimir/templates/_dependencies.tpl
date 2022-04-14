{{- define "mimir.memcachedFrontend" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-frontend" "chartValues" (index .Values "memcached-frontend") "context" $) -}}
{{- end -}}
{{- define "mimir.memcachedIndex" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-blocks-index" "chartValues" (index .Values "memcached-blocks-index") "context" $) -}}
{{- end -}}
{{- define "mimir.memcachedChunk" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-blocks-chunk" "chartValues" (index .Values "memcached-blocks-chunk") "context" $) -}}
{{- end -}}
{{- define "mimir.memcachedMetadata" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-blocks-metadata" "chartValues" (index .Values "memcached-blocks-metadata") "context" $) -}}
{{- end -}}
{{- define "mimir.minio" -}}
{{- include "DependencyFullname" (dict "chartName" "minio" "chartValues" (index .Values "minio") "context" $) -}}
{{- end -}}