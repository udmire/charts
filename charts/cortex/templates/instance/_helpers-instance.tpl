
{{/*
instance fullname
*/}}
{{- define "cortex.instanceFullname" -}}
{{ include "cortex.fullname" . }}-instance
{{- end }}

{{/*
instance common labels
*/}}
{{- define "cortex.instanceLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: instance
{{- end }}

{{/*
instance selector labels
*/}}
{{- define "cortex.instanceSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: instance
{{- end }}
