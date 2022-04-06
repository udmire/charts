{{- define "agent.agentContainerListenPort" -}}
{{- if .Values.config.receivers.jaeger.thriftGrpc }}
- name: jaeger-grpc
  containerPort: 14250
  protocol: TCP
  hostPort: 14250
{{- end }}
{{- if .Values.config.receivers.jaeger.thriftCompact }}
- name: jaeger-compact
  containerPort: 6831
  protocol: UDP
  hostPort: 6831
{{- end }}
{{- if .Values.config.receivers.jaeger.thriftHttp }}
- name: jaeger-thrift
  containerPort: 14268
  protocol: TCP
  hostPort: 14268
{{- end }}
{{- if .Values.config.receivers.otlp.grpc }}
- name: otlp
  containerPort: 4317
  protocol: TCP
  hostPort: 4317
{{- end }}
{{- if .Values.config.receivers.otlp.http }}
- name: otlp-http
  containerPort: 4318
  protocol: TCP
  hostPort: 4318
{{- end }}
{{- if .Values.config.receivers.zipkin }}
- name: zipkin
  containerPort: 9411
  protocol: TCP
  hostPort: 9411
{{- end }}
{{- end -}}