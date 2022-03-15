
{{/*
query-scheduler fullname
*/}}
{{- define "loki.querySchedulerFullname" -}}
{{ include "loki.fullname" . }}-query-scheduler
{{- end }}

{{/*
query-scheduler common labels
*/}}
{{- define "loki.querySchedulerLabels" -}}
{{ include "loki.labels" . }}
app.kubernetes.io/component: query-scheduler
{{- end }}

{{/*
query-scheduler selector labels
*/}}
{{- define "loki.querySchedulerSelectorLabels" -}}
{{ include "loki.selectorLabels" . }}
app.kubernetes.io/component: query-scheduler
{{- end }}
