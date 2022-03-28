{{- define "cortex.memcachedFrontend" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-frontend" "chartValues" (index .Values "memcached-frontend") "context" $) -}}
{{- end -}}
{{- define "cortex.memcachedIndex" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-blocks-index" "chartValues" (index .Values "memcached-blocks-index") "context" $) -}}
{{- end -}}
{{- define "cortex.memcachedChunk" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-blocks-chunk" "chartValues" (index .Values "memcached-blocks-chunk") "context" $) -}}
{{- end -}}
{{- define "cortex.memcachedMetadata" -}}
{{- include "DependencyFullname" (dict "chartName" "memcached-blocks-metadata" "chartValues" (index .Values "memcached-blocks-metadata") "context" $) -}}
{{- end -}}
{{- define "cortex.minio" -}}
{{- include "DependencyFullname" (dict "chartName" "minio" "chartValues" (index .Values "minio") "context" $) -}}
{{- end -}}