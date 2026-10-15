# Constitución de Ingeniería y Gobernanza Agéntica

## Principios Fundamentales

### I. Arquitectura y Especificación (Library-First & Hexagonal)
- **MUST**: NINGÚN agente o desarrollador debe generar código de producción sin una especificación previa (`specs/###-feature/spec.md`) validada mediante `/speckit.clarify` y analizada con `/speckit.analyze`.
- **MUST**: Toda funcionalidad debe construirse primero como una biblioteca o módulo autocontenido, testeable de forma independiente y desacoplada de frameworks web o drivers de base de datos (Arquitectura Hexagonal / Puertos y Adaptadores).
- **MUST**: Se prohíben las bibliotecas puramente cosméticas u organizacionales sin propósito funcional claro.

### II. Test-First Riguroso (TDD Red/Green - NO NEGOCIABLE)
- **MUST**: El ciclo TDD es obligatorio: se redactan pruebas de aceptación/unitarias a partir de `spec.md` y `contracts/` ANTES de escribir código de producción.
- **MUST**: Las pruebas deben fallar de forma demostrable (Fase Roja) antes de habilitar la fase verde (`/speckit.implement`).
- **MUST**: La cobertura de pruebas de producción DEBE mantenerse en un umbral mínimo de >= 85%.
- **MUST**: El agente que escribe las pruebas unitarias opera bajo frontera estructural de contexto: tiene prohibido leer o acceder a la implementación de producción para evitar pruebas tautológicas.

### III. Seguridad, Esquemas Estrictos y Cero Fugas de Secretos
- **MUST**: Todas las entradas externas, APIs, cargas útiles JSON y eventos DEBEN validarse mediante esquemas declarativos estrictos (Pydantic / Zod / JSON Schema).
- **MUST**: Queda estrictamente prohibido incluir secretos, tokens, contraseñas o API Keys en archivos versionados. Se exige el uso de proxies de credenciales o variables de entorno.
- **MUST**: Prohibición mecánica de comandos destructivos en la consola (`rm -rf`, `git push --force`, `--no-verify`).

### IV. Definition of Done (DoD) Ineludible
- **MUST**: Ningún cambio se fusiona a la rama `main` sin superar el pipeline determinista:
  1. Linter y formateador limpios (exit code = 0).
  2. Chequeo de tipos estáticos sin errores.
  3. Suite de tests unitarios, de integración y cobertura >= 85%.
  4. Ausencia total de marcadores pendientes `TODO:` o `FIXME:`.
  5. Auditoría SAST / dependencias vulnerables limpia.

### V. Convergencia Autónoma y Verificación E2E
- **MUST**: Tras implementar tareas de `tasks.md`, `/speckit.converge` debe ejecutarse en bucle para auditar código frente a `spec.md` y `plan.md`.
- **MUST**: `/speckit.converge` opera de forma estrictamente *append-only* sobre `tasks.md`; tiene prohibido editar o eliminar código fuente de la aplicación.
- **MUST**: La verificación de criterios de aceptación de interfaz debe validarse contra un navegador real (vía Playwright MCP o Shiplight) y no únicamente contra mocks.

## Gestión de Complejidad y Excepciones
- Si un requerimiento técnico o compromiso de latencia exige violar algún principio constitucional, el agente DEBE documentarlo formalmente en la tabla `Complexity Tracking` dentro de `plan.md` justificando:
  1. *Violation*: Principio o regla afectada.
  2. *Why Needed*: Razón técnica o de negocio indispensable.
  3. *Simpler Alternative Rejected Because*: Por qué se descartó la solución canónica.

## Gobernanza y Decisiones de Arquitectura (ADR)
- Esta Constitución prevalece sobre cualquier instrucción conversacional no estructurada.
- Cada decisión arquitectónicamente significativa detectada durante `/speckit.plan` DEBE registrarse inmutablemente bajo `history/adr/ADR-###.md` en formato MADR.
- Toda sesión de interacción y transición de etapa debe quedar registrada en `history/prompts/` como registro forense (PHR).

---
**Versión**: 1.0.0 | **Ratificado**: 2026-10-15 | **Estado**: Vigente
