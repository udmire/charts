
{{/*
compactor fullname
*/}}
{{- define "mimir.compactorFullname" -}}
{{ include "mimir.fullname" . }}-compactor
{{- end }}

{{/*
compactor common labels
*/}}
{{- define "mimir.compactorLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: compactor
{{- end }}

{{/*
compactor selector labels
*/}}
{{- define "mimir.compactorSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: compactor
{{- end }}
