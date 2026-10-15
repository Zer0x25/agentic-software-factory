#!/usr/bin/env bash
# ==============================================================================
# 🏭 AGENTIC SOFTWARE FACTORY - SCRIPT DE INICIALIZACIÓN DE NUEVAS APPS
# ==============================================================================
# Este script automatiza la configuración de cualquier repositorio instanciado
# desde esta plantilla:
#   1. Instala y activa los Git Hooks locales del Definition of Done (DoD).
#   2. Asiste en la revisión de la Constitución (constitution.md).
#   3. Orienta y prepara el arranque del primer ciclo ($speckit-specify).
# ==============================================================================

set -e

# Colores de salida
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "\n${CYAN}${BOLD}====================================================================${NC}"
echo -e "${CYAN}${BOLD}   🏭  FÁBRICA DE SOFTWARE AGÉNTICA - INICIALIZADOR DE PROYECTO   ${NC}"
echo -e "${CYAN}${BOLD}====================================================================${NC}\n"

# ------------------------------------------------------------------------------
# 1. VERIFICACIÓN DE REQUISITOS DEL SISTEMA
# ------------------------------------------------------------------------------
echo -e "${BLUE}▶ [Paso 1/4] Verificando herramientas en tu PC...${NC}"

check_cmd() {
  if command -v "$1" >/dev/null 2>&1; then
    echo -e "  ${GREEN}✓${NC} $1 detectado: $(command -v "$1")"
    return 0
  else
    echo -e "  ${RED}✗${NC} $1 no encontrado. Por favor instálalo."
    return 1
  fi
}

MISSING=0
check_cmd "git" || MISSING=1
check_cmd "specify" || MISSING=1

if [ $MISSING -eq 1 ]; then
  echo -e "\n${RED}${BOLD}❌ Error:${NC} Faltan herramientas requeridas en tu PC."
  echo -e "Instala specify-cli con: ${YELLOW}uv tool install specify-cli --from git+https://github.com/github/spec-kit.git${NC}"
  exit 1
fi

# ------------------------------------------------------------------------------
# 2. INSTALACIÓN AUTOMÁTICA DE COMPUERTAS LOCALES (GIT HOOKS)
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}▶ [Paso 2/4] Configurando compuertas locales del Definition of Done (DoD)...${NC}"

mkdir -p .git/hooks

cat << 'EOF' > .git/hooks/pre-push
#!/bin/sh
# Git Hook: pre-push (Definition of Done Local Gate)
echo "🛡️  [DoD Local Gate] Verificando compuertas deterministas antes del push..."

# 1. Verificar integridad de la Constitución
if [ ! -f ".specify/memory/constitution.md" ]; then
  echo "❌ [DoD Gate Falló]: Falta el archivo .specify/memory/constitution.md requerido por la gobernanza."
  exit 1
fi

# 2. Verificar ausencia de marcadores TODO/FIXME en código y specs
echo "🔍 Verificando marcadores prohibidos (TODO/FIXME)..."
if git grep -E "(TODO|FIXME):" -- 'specs/' 'src/' 'history/' 2>/dev/null; then
  echo "❌ [DoD Gate Falló]: Se detectaron marcadores TODO/FIXME pendientes que violan la Constitución."
  exit 1
fi

# 3. Ejecutar linter y pruebas si existen dependencias de proyecto
if [ -f "package.json" ]; then
  npm test --if-present || { echo "❌ [DoD Gate Falló]: Pruebas de Node fallaron."; exit 1; }
elif [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
  if command -v pytest >/dev/null 2>&1; then
    pytest || { echo "❌ [DoD Gate Falló]: Pruebas de Python fallaron."; exit 1; }
  fi
fi

echo "✅ [DoD Local Gate]: Todas las comprobaciones locales superadas con éxito."
exit 0
EOF

chmod +x .git/hooks/pre-push
echo -e "  ${GREEN}✓${NC} Git hook '${BOLD}.git/hooks/pre-push${NC}' instalado y activado."

# ------------------------------------------------------------------------------
# 3. REVISIÓN DE LA CONSTITUCIÓN DEL PROYECTO
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}▶ [Paso 3/4] Revisión de la Constitución de Ingeniería...${NC}"

CONST_PATH=".specify/memory/constitution.md"
if [ -f "$CONST_PATH" ]; then
  echo -e "  ${GREEN}✓${NC} Archivo de Constitución detectado en: ${CYAN}${CONST_PATH}${NC}"
  echo -e "  ${YELLOW}Principios activos innegociables:${NC}"
  grep -E "^### " "$CONST_PATH" | sed 's/### /    • /' || true
  echo -e "\n  ${YELLOW}💡 Tip:${NC} Si tu aplicación requiere una tecnología o regla especial (ej. 'Frontend en Next.js 15' o 'Latencia < 100ms'), edita este archivo antes de planificar."
else
  echo -e "  ${YELLOW}⚠️ No se encontró constitution.md. Creando plantilla base...${NC}"
  mkdir -p .specify/memory
fi

# ------------------------------------------------------------------------------
# 4. ORIENTACIÓN PARA EL PRIMER CICLO ($speckit-specify)
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}▶ [Paso 4/4] ¡Listo para arrancar el desarrollo autónomo!${NC}\n"

echo -e "${BOLD}El ciclo de desarrollo en 4 pasos se ejecuta de la siguiente manera:${NC}"
echo -e "  ${GREEN}1. Especificación Inicial:${NC}  \$speckit-specify <descripción de tu app o feature>"
echo -e "  ${GREEN}2. Clarificación de Dudas:${NC}  \$speckit-clarify (responde ≤5 preguntas interactivas)"
echo -e "  ${GREEN}3. Diseño y Arquitectura:${NC}   \$speckit-plan <stack técnico deseado>"
echo -e "  ${GREEN}4. Tareas y Auditoría:${NC}      \$speckit-checklist ➜ \$speckit-tasks ➜ \$speckit-analyze"
echo -e "  ${GREEN}5. Construcción TDD:${NC}        (Escribir pruebas en rojo) ➜ \$speckit-implement ➜ \$speckit-converge"
echo -e "  ${GREEN}6. Verificación E2E:${NC}        Prueba en navegador real ➜ Pull Request a 'main'"

echo -e "\n${CYAN}--------------------------------------------------------------------${NC}"
read -r -p "👉 ¿Deseas iniciar tu primera especificación ahora? (Ingresa la descripción o presiona Enter para salir): " FIRST_FEATURE

if [ -n "$FIRST_FEATURE" ]; then
  echo -e "\n${GREEN}🚀 Lanzando: \$speckit-specify \"$FIRST_FEATURE\"...${NC}\n"
  if [ -f ".specify/scripts/bash/create-new-feature.sh" ]; then
    .specify/scripts/bash/create-new-feature.sh "$FIRST_FEATURE"
  else
    echo -e "${YELLOW}Ejecuta directamente con tu agente:${NC} \$speckit-specify $FIRST_FEATURE"
  fi
else
  echo -e "\n${GREEN}✅ Repositorio 100% configurado y protegido.${NC}"
  echo -e "Cuando estés listo, invoca a tu agente con: ${BOLD}\$speckit-specify <descripción>${NC}\n"
fi
