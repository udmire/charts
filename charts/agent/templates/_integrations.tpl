{{/* Grafana Agent Integrations */}}
{{- define "agent.integrationConfigs" -}}
{{- if .Values.config.integrations.nodeExporter -}}
{{ include "agent.integrationNodeExporter" . }}
{{- end }}
{{- end }}

{{- define "agent.integrationVolumes" -}}
{{- if .Values.config.integrations.nodeExporter -}}
{{ include "agent.integrationNodeExporterHostVolumes" . }}
{{- end }}
{{- end }}

{{- define "agent.integrationVolumeMounts" -}}
{{- if .Values.config.integrations.nodeExporter -}}
{{ include "agent.integrationNodeExporterVolumeMounts" . }}
{{- end }}
{{- end }}

{{/* Grafana Agent Integrations */}}
{{- define "agent.integrationNodeExporterVolumeMounts" -}}
- name: proc
  mountPath: /host/proc
- name: root
  mountPath: /host/root
- name: sys
  mountPath: /host/sys
{{- end }}

{{/* Grafana Agent Integrations */}}
{{- define "agent.integrationNodeExporterHostVolumes" -}}
- name: proc
  hostPath:
    path: /proc
- name: root
  hostPath:
    path: /
- name: sys
  hostPath:
    path: /sys
{{- end }}

{{/* Grafana Agent Integrations */}}
{{- define "agent.integrationNodeExporter" -}}
node_exporter:
  enabled: true
  rootfs_path: /host/root
  sysfs_path: /host/sys
  procfs_path: /host/proc
  netdev_device_exclude: "^veth.+$"
  relabel_configs:
    - replacement: node_exporter
      target_label: job
{{- end }}