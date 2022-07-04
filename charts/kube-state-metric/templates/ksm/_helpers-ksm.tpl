
{{/*
ksm fullname
*/}}
{{- define "ksm.ksmFullname" -}}
{{ include "ksm.fullname" . }}-kube-state-metric
{{- end }}

{{/*
ksm common labels
*/}}
{{- define "ksm.ksmLabels" -}}
{{ include "ksm.labels" . }}
app.kubernetes.io/component: kube-state-metric
{{- end }}

{{/*
ksm selector labels
*/}}
{{- define "ksm.ksmSelectorLabels" -}}
{{ include "ksm.selectorLabels" . }}
app.kubernetes.io/component: kube-state-metric
{{- end }}
