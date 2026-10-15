#!/usr/bin/env bash
# ==============================================================================
# 🏭 AGENTIC SOFTWARE FACTORY - SCRIPT DE INICIALIZACIÓN DE NUEVAS APPS
# ==============================================================================
# Este script automatiza la configuración de cualquier repositorio instanciado
# desde esta plantilla:
#   1. Instala y activa los Git Hooks locales del Definition of Done (DoD).
#   2. Asiste en la revisión de la Constitución (constitution.md).
#   3. Orienta al usuario a usar el comando agéntico $speckit-init en el chat.
# ==============================================================================

set -e

# Modo no interactivo flag
NON_INTERACTIVE=false
for arg in "$@"; do
  if [ "$arg" == "--non-interactive" ] || [ "$arg" == "-y" ]; then
    NON_INTERACTIVE=true
  fi
done

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
# 3. ALERTA DE CONSTITUCIÓN Y TIEMPO AGENTE-HUMANO
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}▶ [Paso 3/4] Estado de la Constitución de Ingeniería...${NC}"

CONST_PATH=".specify/memory/constitution.md"
if [ -f "$CONST_PATH" ]; then
  echo -e "  ${YELLOW}⚠️  ATENCIÓN:${NC} La Constitución actual en ${CYAN}${CONST_PATH}${NC} es una plantilla genérica."
  echo -e "  ${BOLD}El agente aún no sabe qué aplicación vas a construir.${NC}"
  echo -e "  En esta fase es ${BOLD}crítico invertir tiempo entre el humano y el agente${NC} para definir:"
  echo -e "    1. El propósito y dominio real de tu software."
  echo -e "    2. El stack tecnológico exacto (FastAPI, Next.js, Go, etc.)."
  echo -e "    3. Los estándares no negociables de latencia, seguridad y cobertura."
fi

# ------------------------------------------------------------------------------
# 4. PUNTO DE ENTRADA CONVERSACIONAL EN EL CHAT ($speckit-init)
# ------------------------------------------------------------------------------
echo -e "\n${BLUE}▶ [Paso 4/4] Cómo arrancar desde el chat de tu Agente de IA...${NC}\n"

echo -e "💬 ${BOLD}Para realizar la entrevista de descubrimiento y adaptar la Constitución a tu app:${NC}"
echo -e "   Escribe en el chat de tu agente: ${GREEN}${BOLD}\$speckit-init${NC}\n"

echo -e "El agente ejecutará la habilidad ${CYAN}.agents/skills/speckit-init/SKILL.md${NC}:"
echo -e "  • Te formulará 4 preguntas estratégicas sobre tu proyecto."
echo -e "  • Personalizará ${BOLD}constitution.md${NC} con tus reglas y stack específicos."
echo -e "  • Creará tu primer ${BOLD}ADR-001${NC} documentando la decisión técnica."
echo -e "  • Te dejará listo para lanzar ${BOLD}\$speckit-specify${NC} con tu primera funcionalidad."

if [ "$NON_INTERACTIVE" = true ]; then
  echo -e "\n${GREEN}✅ Configuración no interactiva finalizada.${NC}\n"
  exit 0
fi

echo -e "\n${CYAN}--------------------------------------------------------------------${NC}"
echo -e "${GREEN}✅ Compuertas locales listas.${NC} Pasa al chat de tu agente y escribe: ${BOLD}\$speckit-init${NC}\n"
