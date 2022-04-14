
{{/*
query-scheduler fullname
*/}}
{{- define "mimir.querySchedulerFullname" -}}
{{ include "mimir.fullname" . }}-query-scheduler
{{- end }}

{{/*
query-scheduler common labels
*/}}
{{- define "mimir.querySchedulerLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: query-scheduler
{{- end }}

{{/*
query-scheduler selector labels
*/}}
{{- define "mimir.querySchedulerSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: query-scheduler
{{- end }}
