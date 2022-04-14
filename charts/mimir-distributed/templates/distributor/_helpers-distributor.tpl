
{{/*
distributor fullname
*/}}
{{- define "mimir.distributorFullname" -}}
{{ include "mimir.fullname" . }}-distributor
{{- end }}

{{/*
distributor common labels
*/}}
{{- define "mimir.distributorLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: distributor
{{- end }}

{{/*
distributor selector labels
*/}}
{{- define "mimir.distributorSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: distributor
{{- end }}
