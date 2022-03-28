
{{/*
read fullname
*/}}
{{- define "cortex.readFullname" -}}
{{ include "cortex.fullname" . }}-read
{{- end }}

{{/*
read common labels
*/}}
{{- define "cortex.readLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: read
{{- end }}

{{/*
read selector labels
*/}}
{{- define "cortex.readSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: read
{{- end }}
