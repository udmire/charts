
{{/*
instance fullname
*/}}
{{- define "tempo.instanceFullname" -}}
{{ include "tempo.fullname" . }}-instance
{{- end }}

{{/*
instance common labels
*/}}
{{- define "tempo.instanceLabels" -}}
{{ include "tempo.labels" . }}
app.kubernetes.io/component: instance
{{- end }}

{{/*
instance selector labels
*/}}
{{- define "tempo.instanceSelectorLabels" -}}
{{ include "tempo.selectorLabels" . }}
app.kubernetes.io/component: instance
{{- end }}
