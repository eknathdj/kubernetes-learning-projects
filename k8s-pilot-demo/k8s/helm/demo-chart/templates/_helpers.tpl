{{- define "demo-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "demo-chart.fullname" -}}
{{- printf "%s-%s" (include "demo-chart.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
