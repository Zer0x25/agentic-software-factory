---
name: "speckit-feedback"
description: "Record friction points, template bugs, or architectural improvements into feedback/TEMPLATE_IMPROVEMENTS.md so they can be backported to the agentic-software-factory template repository."
compatibility: "Requires feedback/TEMPLATE_IMPROVEMENTS.md in project root"
metadata:
  author: "agentic-software-factory"
  version: "1.0.0"
---

# Skill: Registro de Mejoras para el Repositorio Plantilla ($speckit-feedback)

Esta habilidad permite al desarrollador o al agente registrar fricciones, inconsistencias, bugs menores u oportunidades de optimización observadas en el arnés de la plantilla durante el desarrollo de una aplicación real.

Su meta es **capitalizar el conocimiento (*Knowledge Compounding*)** para que el repositorio plantilla maestro (`agentic-software-factory`) evolucione continuamente.

---

## Entrada del Usuario
```text
$ARGUMENTS
```

---

## Flujo de Ejecución del Agente

### 1. Diagnóstico y Clasificación
El agente analiza la entrada del usuario o la fricción observada en la sesión y la clasifica en una de las siguientes categorías:
* **`Git Hooks / Sensores`**: Fallos de permisos, falsos positivos o problemas de ejecución en `.git/hooks/pre-push`.
* **`CI/CD & GitHub Actions`**: Fallos o lentitudes en `.github/workflows/agentic-factory-dod.yml`.
* **`Constitución & Gobernanza`**: Reglas ambiguas, límites irrealistas o excepciones frecuentes en `constitution.md`.
* **`Skills de Agentes`**: Mejoras en los prompts o pasos de `$speckit-init`, `$speckit-specify`, `$speckit-clarify`, `$speckit-plan`, `$speckit-implement`, `$speckit-converge`.
* **`Templates & Scaffolding`**: Deficiencias en los moldes de `.specify/templates/` o en `setup.sh`.

### 2. Generación del Registro en `feedback/TEMPLATE_IMPROVEMENTS.md`
El agente:
1. Lee `feedback/TEMPLATE_IMPROVEMENTS.md`.
2. Calcula el siguiente identificador incremental: `IMP-001`, `IMP-002`, etc.
3. Actualiza la tabla de **Resumen de Estado** al inicio del archivo.
4. Agrega una nueva sección detallada bajo `## 📝 Registro Detallado de Hallazgos` con la estructura:

```markdown
### [IMP-XXX] <Título descriptivo del problema o mejora>
- **Fecha**: <Fecha actual AAAA-MM-DD>
- **Categoría**: <Categoría detectada>
- **Severidad de Fricción**: <Baja / Media / Alta>
- **Descripción del Problema**:
  <Explicación clara de lo que falló o generó resistencia en el proyecto actual>
- **Solución Aplicada Localmente**:
  <Cómo se resolvió o mitigó en esta app>
- **Parche Recomendado para `agentic-software-factory`**:
  <Instrucciones exactas de qué archivo modificar en el repositorio plantilla maestro para evitar este problema en futuros proyectos>
- **Estado**: Pendiente de Portar
```

### 3. Confirmación y Próximas Acciones
El agente confirma al usuario que la mejora ha sido registrada en `feedback/TEMPLATE_IMPROVEMENTS.md` y ofrece dos opciones:
1. Dejarlo guardado para revisarlo al finalizar el hito actual de la app.
2. Abrir automáticamente un Issue en el repositorio maestro de GitHub mediante:
   ```bash
   gh issue create --repo Zer0x25/agentic-software-factory \
     --title "Mejora Template: [IMP-XXX] <Título>" \
     --body "<Descripción y parche recomendado>"
   ```
