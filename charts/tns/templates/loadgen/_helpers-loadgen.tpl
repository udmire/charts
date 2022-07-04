{{/*
loadgen fullname
*/}}
{{- define "tns.loadgenFullname" -}}
{{ include "tns.fullname" . }}-loadgen
{{- end }}

{{/*
loadgen common labels
*/}}
{{- define "tns.loadgenLabels" -}}
{{ include "tns.labels" . }}
app.kubernetes.io/component: loadgen
{{- end }}

{{/*
loadgen selector labels
*/}}
{{- define "tns.loadgenSelectorLabels" -}}
{{ include "tns.selectorLabels" . }}
app.kubernetes.io/component: loadgen
{{- end }}
