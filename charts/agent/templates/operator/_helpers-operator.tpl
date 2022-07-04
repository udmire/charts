
{{/*
operator fullname
*/}}
{{- define "agent.operatorFullname" -}}
{{ include "agent.fullname" . }}-operator
{{- end }}

{{/*
operator common labels
*/}}
{{- define "agent.operatorLabels" -}}
{{ include "agent.labels" . }}
app.kubernetes.io/component: operator
{{- end }}

{{/*
operator selector labels
*/}}
{{- define "agent.operatorSelectorLabels" -}}
{{ include "agent.selectorLabels" . }}
app.kubernetes.io/component: operator
{{- end }}
