{{/*
db fullname
*/}}
{{- define "tns.dbFullname" -}}
{{ include "tns.fullname" . }}-db
{{- end }}

{{/*
db common labels
*/}}
{{- define "tns.dbLabels" -}}
{{ include "tns.labels" . }}
app.kubernetes.io/component: db
{{- end }}

{{/*
db selector labels
*/}}
{{- define "tns.dbSelectorLabels" -}}
{{ include "tns.selectorLabels" . }}
app.kubernetes.io/component: db
{{- end }}
