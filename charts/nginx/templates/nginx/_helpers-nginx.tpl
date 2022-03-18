{{/*
nginx fullname
*/}}
{{- define "nginx.nginxFullname" -}}
{{ include "nginx.fullname" . }}-nginx
{{- end }}

{{/*
nginx common labels
*/}}
{{- define "nginx.nginxLabels" -}}
{{ include "nginx.labels" . }}
app.kubernetes.io/component: nginx
{{- end }}

{{/*
nginx selector labels
*/}}
{{- define "nginx.nginxSelectorLabels" -}}
{{ include "nginx.selectorLabels" . }}
app.kubernetes.io/component: nginx
{{- end }}
