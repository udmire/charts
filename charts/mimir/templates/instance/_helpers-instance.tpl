
{{/*
instance fullname
*/}}
{{- define "mimir.instanceFullname" -}}
{{ include "mimir.fullname" . }}-instance
{{- end }}

{{/*
instance common labels
*/}}
{{- define "mimir.instanceLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: instance
{{- end }}

{{/*
instance selector labels
*/}}
{{- define "mimir.instanceSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: instance
{{- end }}
