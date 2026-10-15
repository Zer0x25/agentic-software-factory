---
name: "speckit-init"
description: "Initialize and onboard a new project from the template: installs local Git hooks, conducts the discovery interview to tailor constitution.md to the specific application, and prepares the first $speckit-specify feature."
compatibility: "Requires spec-kit project structure with .specify/ directory"
metadata:
  author: "agentic-software-factory"
  version: "1.0.0"
---

# Skill: Inicialización y Onboarding de Nueva Aplicación ($speckit-init)

Esta habilidad es el **punto de entrada conversacional** obligatorio para cualquier nuevo proyecto o aplicación instanciada a partir de la plantilla.

Su objetivo es asegurar la inversión de tiempo y alineación inicial entre el **humano y el agente** antes de generar cualquier código:
1. Instalar de forma determinista las compuertas locales (`.git/hooks/pre-push`).
2. Conducir una entrevista interactiva de descubrimiento para comprender qué es la aplicación.
3. Adaptar y ratificar la Constitución (`.specify/memory/constitution.md`) con las restricciones y stack técnico específicos de este proyecto.
4. Generar el primer registro de decisión técnica (`history/adr/ADR-001-*.md`).
5. Redactar y lanzar el primer requerimiento funcional mediante `$speckit-specify`.

---

## Flujo de Ejecución del Agente

### Paso 1: Blindaje Local Determinista (Hooks)
El agente DEBE verificar e instalar el hook local de Git ejecutando en consola:
```bash
if [ -f "setup.sh" ]; then
  bash setup.sh --non-interactive || true
fi
```
Asegurar que `.git/hooks/pre-push` exista y tenga permisos de ejecución (`chmod +x`).

---

### Paso 2: Entrevista de Descubrimiento de Proyecto (Inversión Humano-Agente)
Dado que el agente aún no conoce la aplicación, el agente **DEBE formular 4 preguntas estructuradas** de opción múltiple (con una recomendación fundamentada) para definir los límites del proyecto:

1. **Propósito y Dominio del Software**:
   - ¿Qué problema resuelve esta aplicación y quién es el usuario final?
   - Opciones: API Backend / Microservicio | Web App Fullstack (SaaS) | CLI / Herramienta de Sistema | Mobile / Frontend.

2. **Stack Tecnológico Obligatorio**:
   - ¿Cuál es el lenguaje, framework y base de datos requeridos?
   - Opciones:
     - (Recomendada) Python 3.12 + FastAPI + Pydantic v2 + PostgreSQL (SQLAlchemy/Alembic).
     - TypeScript + Node.js/Next.js 15 (App Router) + Tailwind + PostgreSQL (Prisma/Drizzle).
     - Go / Rust para alta concurrencia y baja latencia.
     - Definición libre del usuario.

3. **Arquitectura y Estándares de Calidad (DoD)**:
   - ¿Qué reglas de arquitectura y pruebas aplicarán?
   - Opciones:
     - (Recomendada) Library-First & Hexagonal, TDD Red/Green estricto con cobertura >= 85%.
     - TDD con cobertura >= 90% para sistemas financieros/críticos.
     - Pruebas de integración obligatorias con Testcontainers / mocks de red.

4. **Requisitos No Funcionales y Seguridad**:
   - ¿Cuáles son las restricciones de latencia, autenticación o cumplimiento?
   - Opciones:
     - JWT + RBAC, esquemas de entrada validados, latencia p95 < 200ms.
     - OAuth2 / Supabase Auth / Clerk, cifrado en reposo, cumplimiento GDPR.
     - API pública con rate-limiting y métricas Prometheus.

---

### Paso 3: Sastrería Constitucional y Memoria Arquitectónica
Una vez respondidas las preguntas:
1. **Actualizar `.specify/memory/constitution.md`**:
   - Reemplazar las reglas genéricas con los principios concretos decididos para ESTE proyecto (stack exacto, herramientas de test, umbrales de rendimiento y estilo).
   - Fijar la fecha de ratificación actual y versión `1.0.0`.
2. **Actualizar `AGENTS.md` y `GEMINI.md`**:
   - Describir en el encabezado el nombre y propósito de esta aplicación.
3. **Crear o actualizar `history/adr/ADR-001-stack-architecture.md`**:
   - Registrar la decisión técnica formal: Contexto, Decisión del Stack, Consecuencias y Alternativas descartadas.

---

### Paso 4: Preparación del Primer Ciclo Funcional ($speckit-specify)
El agente sintetiza la primera funcionalidad nuclear (*Core Feature*) del proyecto y presenta al usuario la propuesta para lanzar:
```bash
$speckit-specify <Descripción del núcleo funcional de la aplicación>
```
El agente solicita la confirmación humana para iniciar el ciclo formal de especificación.
