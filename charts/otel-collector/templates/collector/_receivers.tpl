{{- define "otel-collector.collectorContainerListenPort" -}}
{{- if .Values.config.receivers.jaeger.thriftGrpc }}
- name: jaeger-grpc
  containerPort: 14250
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.jaeger.thriftCompact }}
- name: jaeger-compact
  containerPort: 6831
  protocol: UDP
{{- end }}
{{- if .Values.config.receivers.jaeger.thriftHttp }}
- name: jaeger-thrift
  containerPort: 14268
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.otlp.grpc }}
- name: otlp
  containerPort: 4317
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.otlp.http }}
- name: otlp-http
  containerPort: 4318
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.zipkin }}
- name: zipkin
  containerPort: 9411
  protocol: TCP
{{- end }}
{{- end -}}

{{- define "otel-collector.collectorServiceListenPort" -}}
{{- if .Values.config.receivers.jaeger.thriftGrpc }}
- name: jaeger-grpc
  port: 14250
  targetPort: jaeger-grpc
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.jaeger.thriftCompact }}
- name: jaeger-compact
  port: 6831
  targetPort: jaeger-compact
  protocol: UDP
{{- end }}
{{- if .Values.config.receivers.jaeger.thriftHttp }}
- name: jaeger-thrift
  port: 14268
  targetPort: jaeger-thrift
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.otlp.grpc }}
- name: otlp
  port: 4317
  targetPort: otlp
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.otlp.http }}
- name: otlp-http
  port: 4318
  targetPort: otlp-http
  protocol: TCP
{{- end }}
{{- if .Values.config.receivers.zipkin }}
- name: zipkin
  port: 9411
  targetPort: zipkin
  protocol: TCP
{{- end }}
{{- end -}}