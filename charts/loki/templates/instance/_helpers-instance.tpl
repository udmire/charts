
{{/*
instance fullname
*/}}
{{- define "loki.instanceFullname" -}}
{{ include "loki.fullname" . }}-instance
{{- end }}

{{/*
instance common labels
*/}}
{{- define "loki.instanceLabels" -}}
{{ include "loki.labels" . }}
app.kubernetes.io/component: instance
{{- end }}

{{/*
instance selector labels
*/}}
{{- define "loki.instanceSelectorLabels" -}}
{{ include "loki.selectorLabels" . }}
app.kubernetes.io/component: instance
{{- end }}
