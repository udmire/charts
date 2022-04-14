
{{/*
write fullname
*/}}
{{- define "mimir.writeFullname" -}}
{{ include "mimir.fullname" . }}-write
{{- end }}

{{/*
write common labels
*/}}
{{- define "mimir.writeLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: write
{{- end }}

{{/*
write selector labels
*/}}
{{- define "mimir.writeSelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: write
{{- end }}
