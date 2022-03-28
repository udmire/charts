{{/*
Return the image name
*/}}
{{- define "Image" -}}
{{- $registryName := .registry -}}
{{- $repositoryName := .repository -}}
{{- $tag := .tag | toString -}}
{{- $pullPolicy := .pullPolicy -}}
{{- if $registryName }}
image: '{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}'
imagePullPolicy: '{{- printf "%s" $pullPolicy -}}'
{{- else -}}
image: '{{- printf "%s:%s" $repositoryName $tag -}}'
imagePullPolicy: '{{- printf "%s" $pullPolicy -}}'
{{- end -}}
{{- end -}}

{{/*
Renders a value that contains template.
{{ include "ContentRender" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "ContentRender" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}

{{/*
Create a default fully qualified dependency name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
Usage:
{{ include "dependencyFullname" (dict "chartName" "dependency-chart-name" "chartValues" .Values.dependency-chart "context" $) }}
*/}}
{{- define "DependencyFullname" -}}
{{- if .chartValues.fullnameOverride -}}
{{- .chartValues.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .chartName .chartValues.nameOverride -}}
{{- if contains $name .context.Release.Name -}}
{{- .context.Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .context.Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}