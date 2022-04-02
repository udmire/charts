{{- define "otel-collector.receiverConfig" -}}
{{- if  or (.Values.config.receivers.jaeger.thriftCompact) (.Values.config.receivers.jaeger.thriftHttp) (.Values.config.receivers.jaeger.thriftGrpc) -}}
jaeger:
  protocols:
    {{- if .Values.config.receivers.jaeger.thriftGrpc }}
    grpc:
      endpoint: 0.0.0.0:14250
    {{- end }}
    {{- if .Values.config.receivers.jaeger.thriftCompact }}
    thrift_compact:
      endpoint: 0.0.0.0:6831
    {{- end }}
    {{- if .Values.config.receivers.jaeger.thriftHttp }}
    thrift_http:
      endpoint: 0.0.0.0:14268
    {{- end }}
{{- end }}
{{- if or (.Values.config.receivers.otlp.http) (.Values.config.receivers.otlp.grpc) }}
otlp:
  protocols:
    {{- if .Values.config.receivers.otlp.grpc }}
    grpc:
      endpoint: 0.0.0.0:4317
    {{- end }}
    {{- if .Values.config.receivers.otlp.http }}
    http:
      endpoint: 0.0.0.0:4318
    {{- end }}
{{- end }}
{{- if .Values.config.receivers.zipkin }}
zipkin:
  endpoint: 0.0.0.0:9411
{{- end }}
{{- end -}}