
{{/*
write fullname
*/}}
{{- define "cortex.writeFullname" -}}
{{ include "cortex.fullname" . }}-write
{{- end }}

{{/*
write common labels
*/}}
{{- define "cortex.writeLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: write
{{- end }}

{{/*
write selector labels
*/}}
{{- define "cortex.writeSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: write
{{- end }}
