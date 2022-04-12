
{{/*
imageRender fullname
*/}}
{{- define "grafana.imageRenderFullname" -}}
{{ include "grafana.fullname" . }}-image-render
{{- end }}

{{/*
imageRender common labels
*/}}
{{- define "grafana.imageRenderLabels" -}}
{{ include "grafana.labels" . }}
app.kubernetes.io/component: image-render
{{- end }}

{{/*
imageRender selector labels
*/}}
{{- define "grafana.imageRenderSelectorLabels" -}}
{{ include "grafana.selectorLabels" . }}
app.kubernetes.io/component: image-render
{{- end }}
