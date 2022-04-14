
{{/*
eventhandler fullname
*/}}
{{- define "agent.eventhandlerFullname" -}}
{{ include "agent.fullname" . }}-eventhandler
{{- end }}

{{/*
eventhandler common labels
*/}}
{{- define "agent.eventhandlerLabels" -}}
{{ include "agent.labels" . }}
app.kubernetes.io/component: eventhandler
{{- end }}

{{/*
eventhandler selector labels
*/}}
{{- define "agent.eventhandlerSelectorLabels" -}}
{{ include "agent.selectorLabels" . }}
app.kubernetes.io/component: eventhandler
{{- end }}

{{/*
Get checksum of config secret or configMap
*/}}
{{- define "agent.eventhandlerConfigChecksum" -}}
{{- include (print $.Template.BasePath "/eventhandler/eventhandler-configmap.yaml") . | sha256sum -}}
{{- end -}}

{{/*
Get volume of config secret of configMap
*/}}
{{- define "agent.eventhandlerConfigVolume" -}}
- name: {{ template "agent.eventhandlerFullname" . }}-config
  configMap:
    name: {{ template "agent.eventhandlerFullname" . }}-config
{{- end -}}