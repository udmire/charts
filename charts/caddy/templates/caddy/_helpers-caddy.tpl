{{/*
caddy fullname
*/}}
{{- define "caddy.caddyFullname" -}}
{{ include "caddy.fullname" . }}-caddy
{{- end }}

{{/*
caddy common labels
*/}}
{{- define "caddy.caddyLabels" -}}
{{ include "caddy.labels" . }}
app.kubernetes.io/component: caddy
{{- end }}

{{/*
caddy selector labels
*/}}
{{- define "caddy.caddySelectorLabels" -}}
{{ include "caddy.selectorLabels" . }}
app.kubernetes.io/component: caddy
{{- end }}
