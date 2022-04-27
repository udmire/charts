
{{/*
query-frontend fullname
*/}}
{{- define "tempo.queryFrontendFullname" -}}
{{ include "tempo.fullname" . }}-query-frontend
{{- end }}

{{/*
query-frontend common labels
*/}}
{{- define "tempo.queryFrontendLabels" -}}
{{ include "tempo.labels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
query-frontend selector labels
*/}}
{{- define "tempo.queryFrontendSelectorLabels" -}}
{{ include "tempo.selectorLabels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}
