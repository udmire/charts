
{{/*
querier fullname
*/}}
{{- define "mimir.querierFullname" -}}
{{ include "mimir.fullname" . }}-querier
{{- end }}

{{/*
querier common labels
*/}}
{{- define "mimir.querierLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: querier
{{- end }}

{{/*
querier selector labels
*/}}
{{- define "mimir.querierSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: querier
{{- end }}
