
{{/*
read fullname
*/}}
{{- define "mimir.readFullname" -}}
{{ include "mimir.fullname" . }}-read
{{- end }}

{{/*
read common labels
*/}}
{{- define "mimir.readLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: read
{{- end }}

{{/*
read selector labels
*/}}
{{- define "mimir.readSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: read
{{- end }}
