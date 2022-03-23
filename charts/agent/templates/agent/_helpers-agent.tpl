
{{/*
agent fullname
*/}}
{{- define "agent.agentFullname" -}}
{{ include "agent.fullname" . }}-agent
{{- end }}

{{/*
agent common labels
*/}}
{{- define "agent.agentLabels" -}}
{{ include "agent.labels" . }}
app.kubernetes.io/component: agent
{{- end }}

{{/*
agent selector labels
*/}}
{{- define "agent.agentSelectorLabels" -}}
{{ include "agent.selectorLabels" . }}
app.kubernetes.io/component: agent
{{- end }}

{{/*
Get checksum of config secret or configMap
*/}}
{{- define "agent.agentConfigChecksum" -}}
{{- include (print $.Template.BasePath "/agent/agent-configmap.yaml") . | sha256sum -}}
{{- end -}}

{{/*
Get volume of config secret of configMap
*/}}
{{- define "agent.agentConfigVolume" -}}
- name: {{ template "agent.agentFullname" . }}-config
  configMap:
    name: {{ template "agent.agentFullname" . }}-config
{{- end -}}