
{{/*
query-frontend fullname
*/}}
{{- define "mimir.queryFrontendFullname" -}}
{{ include "mimir.fullname" . }}-query-frontend
{{- end }}

{{/*
query-frontend common labels
*/}}
{{- define "mimir.queryFrontendLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
query-frontend selector labels
*/}}
{{- define "mimir.queryFrontendSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}
