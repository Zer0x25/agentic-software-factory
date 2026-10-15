# ADR-001: Adopción de Fábrica de Software Agéntica con Spec-Kit y Harness Engineering

* **Estado**: Aceptado
* **Fecha**: 2026-10-15
* **Decisores**: Arquitecto de Plataforma & Equipo de Ingeniería

## Contexto y Declaración del Problema
La generación no estructurada de código (*vibe coding*) introduce inconsistencias arquitectónicas, pérdida de rumbo en tareas extensas y deuda técnica no gobernada. Se requiere un modelo operativo donde la intención de negocio se traduzca de forma determinista en especificaciones comprobables con compuertas de calidad inquebrantables.

## Decisión
Se adopta formalmente la metodología **Spec-Driven Development (SDD)** utilizando **GitHub Spec-Kit (specify-cli)** junto con un **Arnés Agnóstico Multi-Agente (Harness Engineering)**:
1. Ninguna tarea se implementa sin un ciclo previo `/speckit.specify` -> `/speckit.clarify` (≤ 5 preguntas) -> `/speckit.plan` -> `/speckit.analyze`.
2. Los contratos de gobernanza residen en `.specify/memory/constitution.md` y son inmutables para el código de producción.
3. El Definition of Done (DoD) se automatiza mediante sensores deterministas en Git hooks locales (Husky) y GitHub Actions.
4. Las decisiones arquitectónicas se registran como ADRs inmutables bajo `history/adr/`.

## Consecuencias
* **Positivas**: 
  - Erradicación de la deriva de especificaciones (*Spec Drift*).
  - Trazabilidad total entre requerimiento de producto, plan técnico y pruebas.
  - Intervención humana concentrada al inicio (entrevista) y reducida a un único clic de veto/merge al cierre.
* **Negativas / Compromisos**:
  - Mayor rigor en la fase de concepción antes de ver la primera línea de código.
  - Requisito de mantener actualizados los contratos de estado en el repositorio.
