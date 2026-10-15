# Prompt History Records (PHRs)

Este directorio conserva la pista de auditoría forense e inmutable de las interacciones, transiciones de etapa y ejecuciones de agentes autónomos.

## Estructura de Registro por Etapa
Cada archivo `PHR-###-stage.prompt.md` documenta:
- Metadatos YAML (ID, etapa, modelo de IA, fecha ISO, rama, comando invocado).
- Prompt exacto del usuario.
- Instantánea de la respuesta del agente.
- Archivos leídos y modificados.
- Pruebas y aserciones añadidas.
- Reflexiones o decisiones tomadas para capitalización de conocimiento (*Knowledge Compounding*).
