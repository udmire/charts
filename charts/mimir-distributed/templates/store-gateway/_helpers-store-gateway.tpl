
{{/*
store-gateway fullname
*/}}
{{- define "mimir.storeGatewayFullname" -}}
{{ include "mimir.fullname" . }}-store-gateway
{{- end }}

{{/*
store-gateway common labels
*/}}
{{- define "mimir.storeGatewayLabels" -}}
{{ include "mimir.labels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
store-gateway selector labels
*/}}
{{- define "mimir.storeGatewaySelectorLabels" -}}
{{ include "mimir.selectorLabels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}
