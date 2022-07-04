
{{/*
querier fullname
*/}}
{{- define "tempo.querierFullname" -}}
{{ include "tempo.fullname" . }}-querier
{{- end }}

{{/*
querier common labels
*/}}
{{- define "tempo.querierLabels" -}}
{{ include "tempo.labels" . }}
app.kubernetes.io/component: querier
{{- end }}

{{/*
querier selector labels
*/}}
{{- define "tempo.querierSelectorLabels" -}}
{{ include "tempo.selectorLabels" . }}
app.kubernetes.io/component: querier
{{- end }}
