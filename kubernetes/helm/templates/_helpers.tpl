{{/* Return the full image path */}}
{{- define "microservice.image" -}}
{{ printf "%s%s:%s" .Values.global.imageRegistry .image.repository .image.tag }}
{{- end }}

{{/* Create names */}}
{{- define "microservice.fullname" -}}
{{ printf "%s" .name }}
{{- end }}
