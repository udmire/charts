
{{/*
write fullname
*/}}
{{- define "loki.writeFullname" -}}
{{ include "loki.fullname" . }}-write
{{- end }}

{{/*
write common labels
*/}}
{{- define "loki.writeLabels" -}}
{{ include "loki.labels" . }}
app.kubernetes.io/component: write
{{- end }}

{{/*
write selector labels
*/}}
{{- define "loki.writeSelectorLabels" -}}
{{ include "loki.selectorLabels" . }}
app.kubernetes.io/component: write
{{- end }}
