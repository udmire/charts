
{{/*
ruler fullname
*/}}
{{- define "mimir.rulerFullname" -}}
{{ include "mimir.fullname" . }}-ruler
{{- end }}

{{/*
ruler common labels
*/}}
{{- define "mimir.rulerLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: ruler
{{- end }}

{{/*
ruler selector labels
*/}}
{{- define "mimir.rulerSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: ruler
{{- end }}
