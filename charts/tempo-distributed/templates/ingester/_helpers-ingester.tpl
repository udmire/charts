
{{/*
ingester fullname
*/}}
{{- define "tempo.ingesterFullname" -}}
{{ include "tempo.fullname" . }}-ingester
{{- end }}

{{/*
ingester common labels
*/}}
{{- define "tempo.ingesterLabels" -}}
{{ include "tempo.labels" . }}
app.kubernetes.io/component: ingester
{{- end }}

{{/*
ingester selector labels
*/}}
{{- define "tempo.ingesterSelectorLabels" -}}
{{ include "tempo.selectorLabels" . }}
app.kubernetes.io/component: ingester
{{- end }}
