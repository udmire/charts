
{{/*
otel-collector agent fullname
*/}}
{{- define "otel-collector.agentFullname" -}}
{{ include "otel-collector.fullname" . }}-agent
{{- end }}

{{/*
otel-collector agent common labels
*/}}
{{- define "otel-collector.agentLabels" -}}
{{ include "otel-collector.labels" . }}
app.kubernetes.io/component: agent
{{- end }}

{{/*
otel-collector agent selector labels
*/}}
{{- define "otel-collector.agentSelectorLabels" -}}
{{ include "otel-collector.selectorLabels" . }}
app.kubernetes.io/component: agent
{{- end }}

{{/*
Get checksum of otel-collector agent configMap
*/}}
{{- define "otel-collector.agentConfigChecksum" -}}
{{- include (print $.Template.BasePath "/agent/agent-configmap.yaml") . | sha256sum -}}
{{- end -}}

{{/*
Get volume of otel-collector agent configMap
*/}}
{{- define "otel-collector.agentConfigVolume" -}}
- name: {{ template "otel-collector.agentFullname" . }}-config
  configMap:
    name: {{ template "otel-collector.agentFullname" . }}-config
{{- end -}}