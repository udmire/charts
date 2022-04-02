{{/*
collector fullname
*/}}
{{- define "otel-collector.collectorFullname" -}}
{{ include "otel-collector.fullname" . }}-collector
{{- end }}

{{/*
collector common labels
*/}}
{{- define "otel-collector.collectorLabels" -}}
{{ include "otel-collector.labels" . }}
app.kubernetes.io/component: collector
{{- end }}

{{/*
collector selector labels
*/}}
{{- define "otel-collector.collectorSelectorLabels" -}}
{{ include "otel-collector.selectorLabels" . }}
app.kubernetes.io/component: collector
{{- end }}

{{/*
Get checksum of otel-collector agent configMap
*/}}
{{- define "otel-collector.collectorConfigChecksum" -}}
{{- include (print $.Template.BasePath "/collector/collector-configmap.yaml") . | sha256sum -}}
{{- end -}}

{{/*
Get volume of otel-collector agent configMap
*/}}
{{- define "otel-collector.collectorConfigVolume" -}}
- name: {{ template "otel-collector.collectorFullname" . }}-config
  configMap:
    name: {{ template "otel-collector.collectorFullname" . }}-config
{{- end -}}