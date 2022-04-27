{{/*
app fullname
*/}}
{{- define "tns.appFullname" -}}
{{ include "tns.fullname" . }}-app
{{- end }}

{{/*
app common labels
*/}}
{{- define "tns.appLabels" -}}
{{ include "tns.labels" . }}
app.kubernetes.io/component: app
{{- end }}

{{/*
app selector labels
*/}}
{{- define "tns.appSelectorLabels" -}}
{{ include "tns.selectorLabels" . }}
app.kubernetes.io/component: app
{{- end }}
