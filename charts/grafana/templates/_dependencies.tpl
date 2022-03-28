{{- define "cortex.redis" -}}
{{- include "DependencyFullname" (dict "chartName" "redis" "chartValues" (index .Values "redis") "context" $) -}}
{{- end -}}