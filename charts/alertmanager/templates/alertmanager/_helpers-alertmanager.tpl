
{{/*
alertmanager fullname
*/}}
{{- define "alertmanager.alertmanagerFullname" -}}
{{ include "alertmanager.fullname" . }}-alertmanager
{{- end }}

{{/*
alertmanager common labels
*/}}
{{- define "alertmanager.alertmanagerLabels" -}}
{{ include "alertmanager.labels" . }}
app.kubernetes.io/component: alertmanager
{{- end }}

{{/*
alertmanager selector labels
*/}}
{{- define "alertmanager.alertmanagerSelectorLabels" -}}
{{ include "alertmanager.selectorLabels" . }}
app.kubernetes.io/component: alertmanager
{{- end }}
