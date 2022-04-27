
{{/*
distributor fullname
*/}}
{{- define "tempo.distributorFullname" -}}
{{ include "tempo.fullname" . }}-distributor
{{- end }}

{{/*
distributor common labels
*/}}
{{- define "tempo.distributorLabels" -}}
{{ include "tempo.labels" . }}
app.kubernetes.io/component: distributor
{{- end }}

{{/*
distributor selector labels
*/}}
{{- define "tempo.distributorSelectorLabels" -}}
{{ include "tempo.selectorLabels" . }}
app.kubernetes.io/component: distributor
{{- end }}
