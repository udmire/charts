{{- define "otel-collector.containerLogsConfig" -}}
{{- if .Values.agent.containerLogs.enabled }}
filelog:
  include: [ /var/log/pods/*/*/*.log ]
  # Exclude collector container's logs. The file format is /var/log/pods/<namespace_name>_<pod_name>_<pod_uid>/<container_name>/<run_id>.log
  exclude: [ /var/log/pods/{{ .Release.Namespace }}_{{ include "opentelemetry-collector.fullname" . }}*_*/{{ .Chart.Name }}/*.log ]
  start_at: beginning
  include_file_path: true
  include_file_name: false
  operators:
      # Find out which format is used by kubernetes
      - type: router
        id: get-format
        routes:
          - output: parser-docker
            expr: '$$body matches "^\\{"'
          - output: parser-crio
            expr: '$$body matches "^[^ Z]+ "'
          - output: parser-containerd
            expr: '$$body matches "^[^ Z]+Z"'
      # Parse CRI-O format
      - type: regex_parser
        id: parser-crio
        regex: '^(?P<time>[^ Z]+) (?P<stream>stdout|stderr) (?P<logtag>[^ ]*) (?P<log>.*)$'
        output: extract_metadata_from_filepath
        timestamp:
          parse_from: time
          layout_type: gotime
          layout: '2006-01-02T15:04:05.000000000-07:00'
      # Parse CRI-Containerd format
      - type: regex_parser
        id: parser-containerd
        regex: '^(?P<time>[^ ^Z]+Z) (?P<stream>stdout|stderr) (?P<logtag>[^ ]*) (?P<log>.*)$'
        output: extract_metadata_from_filepath
        timestamp:
          parse_from: time
          layout: '%Y-%m-%dT%H:%M:%S.%LZ'
      # Parse Docker format
      - type: json_parser
        id: parser-docker
        output: extract_metadata_from_filepath
        timestamp:
          parse_from: time
          layout: '%Y-%m-%dT%H:%M:%S.%LZ'
      # Extract metadata from file path
      - type: regex_parser
        id: extract_metadata_from_filepath
        regex: '^.*\/(?P<namespace>[^_]+)_(?P<pod_name>[^_]+)_(?P<uid>[a-f0-9\-]+)\/(?P<container_name>[^\._]+)\/(?P<run_id>\d+)\.log$'
        parse_from: $$attributes["file.path"]
      # Move out attributes to Attributes
      - type: metadata
        attributes:
          stream: 'EXPR($.stream)'
          k8s.container.name: 'EXPR($.container_name)'
          k8s.namespace.name: 'EXPR($.namespace)'
          k8s.pod.name: 'EXPR($.pod_name)'
          run_id: 'EXPR($.run_id)'
          k8s.pod.uid: 'EXPR($.uid)'
      # Clean up log body
      - type: restructure
        id: clean-up-log-body
        ops:
          - move:
              from: log
              to: $
{{- end }}
{{- end }}