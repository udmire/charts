
{{/*
ingester fullname
*/}}
{{- define "mimir.ingesterFullname" -}}
{{ include "mimir.fullname" . }}-ingester
{{- end }}

{{/*
ingester common labels
*/}}
{{- define "mimir.ingesterLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: ingester
{{- end }}

{{/*
ingester selector labels
*/}}
{{- define "mimir.ingesterSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: ingester
{{- end }}
