# 🔄 Bucle de Retroalimentación y Mejoras para el Repositorio Plantilla

Este directorio implementa el mecanismo de **Capitalización de Conocimiento (*Knowledge Compounding*)** entre las aplicaciones hijas y el repositorio plantilla maestro (`agentic-software-factory`).

---

## 🎯 Propósito

Cuando desarrollas una nueva aplicación a partir de esta plantilla, es natural encontrar:
1. **Fricciones de arnés**: Git hooks locales o de CI/CD que se comportan de forma rígida o inesperada.
2. **Vacíos constitucionales**: Principios que resultan ambiguos o reglas faltantes para ciertos stacks.
3. **Mejoras en habilidades (*Skills*)**: Comandos de Spec-Kit que podrían ser más rápidos, claros o tolerantes a fallos.
4. **Dependencias y herramientas**: Nuevas utilidades que ahorran tiempo y deberían venir preinstaladas en la plantilla.

En lugar de que esas lecciones se pierdan en proyectos aislados, este canal las captura sistemáticamente para evolucionar la plantilla maestra.

---

## 📂 Archivos en este Directorio

* [`TEMPLATE_IMPROVEMENTS.md`](TEMPLATE_IMPROVEMENTS.md): Bitácora estructurada de inconsistencias, fricciones y propuestas de mejora detectadas durante el desarrollo.

---

## 💬 Cómo Registrar una Mejora desde el Chat del Agente

Durante cualquier sesión de desarrollo en una app hija, solo debes decirle al agente:

```bash
$speckit-feedback "Descripción del bug, fricción o mejora que debería aplicarse a la plantilla maestra"
```

El agente ejecutará la habilidad `.agents/skills/speckit-feedback/SKILL.md` y registrará automáticamente:
- Fecha y contexto del proyecto.
- Categoría (*Git Hooks*, *CI/CD*, *Constitución*, *Skills*, *Templates*).
- Causa raíz de la fricción observada.
- Propuesta de parche o solución para el repositorio plantilla.
- Estado (*Pendiente de Portar* / *Aplicado en Master*).

---

## 🚀 Cómo Portar las Mejoras al Repositorio Maestro

Cuando acumules mejoras en `TEMPLATE_IMPROVEMENTS.md`:

1. **Vía GitHub Issue (automático con `gh`):**
   ```bash
   gh issue create --repo Zer0x25/agentic-software-factory \
     --title "Mejora desde proyecto: <breve descripción>" \
     --body-file feedback/TEMPLATE_IMPROVEMENTS.md
   ```
2. **Vía Pull Request:**
   Creas una rama en el repositorio maestro `Zer0x25/agentic-software-factory` y aplicas el parche correspondiente.
