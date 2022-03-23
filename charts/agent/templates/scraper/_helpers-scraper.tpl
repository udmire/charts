
{{/*
scraper fullname
*/}}
{{- define "agent.scraperFullname" -}}
{{ include "agent.fullname" . }}-scraper
{{- end }}

{{/*
scraper common labels
*/}}
{{- define "agent.scraperLabels" -}}
{{ include "agent.labels" . }}
app.kubernetes.io/component: scraper
{{- end }}

{{/*
scraper selector labels
*/}}
{{- define "agent.scraperSelectorLabels" -}}
{{ include "agent.selectorLabels" . }}
app.kubernetes.io/component: scraper
{{- end }}

{{/*
Get checksum of config secret or configMap
*/}}
{{- define "agent.scraperConfigChecksum" -}}
{{- include (print $.Template.BasePath "/scraper/scraper-configmap.yaml") . | sha256sum -}}
{{- end -}}

{{/*
Get volume of config secret of configMap
*/}}
{{- define "agent.scraperConfigVolume" -}}
- name: {{ template "agent.scraperFullname" . }}-config
  configMap:
    name: {{ template "agent.scraperFullname" . }}-config
{{- end -}}