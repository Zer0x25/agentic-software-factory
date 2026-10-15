# 🏭 Agentic Software Factory

[![Spec-Kit](https://img.shields.io/badge/Spec--Kit-v1.2-blue.svg)](https://github.com/github/spec-kit)
[![Methodology](https://img.shields.io/badge/Methodology-Spec--Driven%20Development%20(SDD)-success.svg)](https://github.com/github/spec-kit)
[![Architecture](https://img.shields.io/badge/Architecture-Harness%20Engineering-orange.svg)]()
[![DoD](https://img.shields.io/badge/DoD-Deterministic%20Verification-purple.svg)]()
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)]()

Repositorio plantilla y arnés de gobernanza para una **Fábrica de Software Agéntica** basada en **Spec-Driven Development (SDD)** con **GitHub Spec-Kit (`specify-cli`)** e **Ingeniería de Arneses (*Harness Engineering*)**.

---

## 🏛️ Principios de Arquitectura

La fábrica erradica la generación de código no estructurada (*vibe coding*) separando estrictamente la intención humana de la ejecución autónoma:

$$\text{Agente Autónomo} = \text{Modelo Fundacional} + \text{Harness (Arnés)}$$

1. **Gobernanza Constitucional**: Ningún agente escribe código sin una especificación previa validada en `.specify/memory/constitution.md`.
2. **Entrevista de Intención**: El esfuerzo humano se concentra al inicio mediante `/speckit.clarify` (máximo 5 preguntas de opción múltiple).
3. **Memoria Arquitectónica Inmutable**: Las decisiones técnicas se documentan como ADRs bajo `history/adr/` (formato MADR).
4. **TDD Estricto Red/Green**: Aislamiento de contexto entre el agente que redacta pruebas y el que implementa código. Cobertura obligatoria $\ge 85\%$.
5. **Convergencia Autónoma**: `/speckit.converge` audita en modo *append-only* sobre `tasks.md` hasta que el código satisface la especificación.
6. **Definition of Done (DoD) Determinista**: Sensores que no negocian (Git hooks locales con Husky y GitHub Actions CI) bloquean regresiones y vulnerabilidades antes de la fusión a `main`.

---

## 📂 Estructura del Repositorio

```text
├── .agents/skills/              # Skills de Spec-Kit instaladas para agentes de codificación
│   ├── speckit-specify/         # Generación de especificación funcional (spec.md)
│   ├── speckit-clarify/         # Entrevista estructurada de reducción de ambigüedad
│   ├── speckit-plan/            # Plan técnico, contratos y modelo de datos
│   ├── speckit-checklist/       # Checklists de calidad de requisitos
│   ├── speckit-tasks/           # Desglose en tareas dependientes
│   ├── speckit-analyze/         # Auditoría cruzada en solo lectura
│   ├── speckit-implement/       # Construcción TDD por etapas acotadas
│   └── speckit-converge/        # Bucle de convergencia append-only
├── .github/workflows/           # Tuberías CI/CD de verificación de DoD y StepSecurity
├── .specify/                    # Motor de Spec-Kit
│   ├── memory/                  # Constitución inmutable (constitution.md)
│   ├── templates/               # Moldes personalizables de especificaciones y planes
│   └── scripts/                 # Automatizaciones locales en Bash
├── history/
│   ├── adr/                     # Registros de Decisiones de Arquitectura (MADR)
│   └── prompts/                 # Pista de auditoría forense de prompts (PHRs)
├── specs/                       # Ramas de funcionalidades (ej. specs/001-feature/)
├── AGENTS.md                    # Reglas de contexto raíz para agentes autónomos
└── GEMINI.md                    # Directivas para Google Gemini / Antigravity
```

---

## 🚀 Flujo Operativo en 4 Fases

```text
[Humano: Intención] 
        │
        ▼
1. /speckit.specify  ──► Crea rama 'specs/001-feature/spec.md'
        │
        ▼
2. /speckit.clarify  ──► Entrevista interactiva (≤ 5 preguntas de opción múltiple)
        │
        ▼
3. /speckit.plan     ──► Genera 'plan.md', contratos y ADRs en 'history/adr/'
        │
        ▼
4. /speckit.analyze  ──► Auditoría de consistencia en SOLO LECTURA (bloquea si hay fallos)
        │
        ▼
[0% Humano: Construcción Autónoma]
        │
        ├─► Agente TDD Red: Redacta pruebas que fallan obligatoriamente
        ├─► /speckit.implement: Codifica en Verde en fases acotadas
        └─► /speckit.converge: Auditoría append-only hasta dictamen ✅ Converged
        │
        ▼
5. Verificación E2E  ──► Validación en navegador real (Playwright MCP / Shiplight)
        │
        ▼
[1 Clic Humano: Veto y Aprobación]
        │
        ▼
6. GitHub PR         ──► CI ejecuta el DoD determinista ──► Merge a 'main'
```

---

## 🛠️ Requisitos e Instalación

### Requisitos Locales
- **Linux / macOS / Windows (WSL)**
- [uv](https://github.com/astral-sh/uv) (Gestor de herramientas y Python)
- [GitHub Spec-Kit (`specify-cli`)](https://github.com/github/spec-kit)
- Git & [GitHub CLI (`gh`)](https://cli.github.com/)

```bash
# Instalar uv y specify-cli
curl -LsSf https://astral.sh/uv/install.sh | sh
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# Inicializar un nuevo proyecto con Spec-Kit
specify init mi-proyecto --integration codex --extension git
```

---

## 📄 Licencia

Distribuido bajo la licencia [Apache 2.0](LICENSE).
