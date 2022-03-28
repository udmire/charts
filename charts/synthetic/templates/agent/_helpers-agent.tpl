{{/*
agent fullname
*/}}
{{- define "synthetic.agentFullname" -}}
{{ include "synthetic.fullname" . }}-agent
{{- end }}

{{/*
agent common labels
*/}}
{{- define "synthetic.agentLabels" -}}
{{ include "synthetic.labels" . }}
app.kubernetes.io/component: agent
{{- end }}

{{/*
agent selector labels
*/}}
{{- define "synthetic.agentSelectorLabels" -}}
{{ include "synthetic.selectorLabels" . }}
app.kubernetes.io/component: agent
{{- end }}
