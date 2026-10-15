# Instrucciones del Repositorio para Agentes de IA (AGENTS.md)

Este repositorio opera bajo el estándar **Spec-Driven Development (SDD)** con **GitHub Spec-Kit (specify-cli)** y **Harness Engineering**.

## 1. Regla Inquebrantable de Gobernanza
- **NUNCA** generes código de producción sin una especificación formal previa aprobada en `specs/###-feature/spec.md`.
- Consulta y respeta estrictamente `.specify/memory/constitution.md` en cada acción.
- Toda decisión técnica relevante debe registrarse como ADR en `history/adr/`.

## 2. Flujo Operativo Obligatorio
0. **Inicialización y Onboarding (Nuevas Apps)**: Invocación de `$speckit-init` para realizar la entrevista de descubrimiento entre humano y agente, activar los hooks locales y adaptar la Constitución a la nueva aplicación.
1. **Concepción**: Invocación de `$speckit-specify` para crear la rama y la especificación funcional.
2. **Entrevista de Clarificación**: Invocación de `$speckit-clarify` (máximo 5 preguntas de opción múltiple antes de planificar).
3. **Diseño y Arquitectura**: Invocación de `$speckit-plan`, verificación de `Constitution Check` y justificación en `Complexity Tracking` si hay excepciones.
4. **Auditoría Pre-Código**: Generación de `$speckit-checklist`, desglose en `$speckit-tasks` y auditoría de solo lectura con `$speckit-analyze`.
5. **Construcción TDD**: Redactar primero pruebas que fallen (Red), implementar código con `$speckit-implement` (Green) y ejecutar `$speckit-converge` (append-only) hasta la convergencia.
6. **Verificación**: Validación de criterios observables en navegador real y apertura de Pull Request.

## 3. Comandos de Verificación Local (Definition of Done)
- Pruebas y Cobertura: Debe mantenerse >= 85%.
- Linters y Tipos: Exit code 0 en todos los chequeos.
- Comandos destructivos prohibidos: `rm -rf`, `git push --force`, `--no-verify`.
