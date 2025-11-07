{{/* Return the full image path */}}
{{- define "microservice.image" -}}
{{ printf "%s%s:%s" .Values.global.imageRegistry (trimPrefix "/" .image.repository) .image.tag }}
{{- end }}

{{/* Create full name */}}
{{- define "microservice.fullname" -}}
{{ printf "%s" .name }}
{{- end }}
