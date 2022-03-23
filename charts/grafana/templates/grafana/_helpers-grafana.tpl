
{{/*
grafana fullname
*/}}
{{- define "grafana.grafanaFullname" -}}
{{ include "grafana.fullname" . }}-grafana
{{- end }}

{{/*
grafana common labels
*/}}
{{- define "grafana.grafanaLabels" -}}
{{ include "grafana.labels" . }}
app.kubernetes.io/component: grafana
{{- end }}

{{/*
grafana selector labels
*/}}
{{- define "grafana.grafanaSelectorLabels" -}}
{{ include "grafana.selectorLabels" . }}
app.kubernetes.io/component: grafana
{{- end }}
