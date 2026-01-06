#!/bin/bash
# ELECTRIC STORM INSTALLER v6.0
CYAN='\033[0;36m'; GREEN='\033[0;32m'; NC='\033[0m'
clear
echo -e "${CYAN}⚡ ELECTRIC STORM (THEO)${NC}"
echo "------------------------------------------------"

# 1. DEPENDENCY CHECK
if [ -f /etc/alpine-release ]; then OS="alpine"; PKG="apk add --no-cache";
elif [ -f /etc/debian_version ]; then OS="debian"; PKG="apt-get install -y";
else OS="unknown"; fi

echo -e "   Detected OS: ${GREEN}$OS${NC}"

# 2. MODE SELECTION
echo -e "\nSelect Deployment Mode:"
echo "1) SANDBOX (Docker Container) - Safest"
echo "2) RESIDENT (User Level) - Balanced"
echo "3) GOD MODE (Root Access) - Maximum Power"
read -p "Select [1-3]: " LEVEL

# 3. AI SETUP
echo -e "\n🤖 AI Brain Setup:"
echo "1) Cloud Key (Google/Anthropic/OpenAI)"
echo "2) Local AI (Ollama)"
read -p "Select: " AI_CHOICE

# 4. CONFIGURE
mkdir -p /opt/electric-storm
cp -r . /opt/electric-storm/
CFG="/opt/electric-storm/config.yaml"

# Write .env if Cloud
if [ "$AI_CHOICE" == "1" ]; then
    read -p "Enter API Key: " KEY
    echo "export GEMINI_API_KEY=$KEY" > /opt/electric-storm/.env
    echo "export ANTHROPIC_API_KEY=$KEY" >> /opt/electric-storm/.env
    echo "export OPENAI_API_KEY=$KEY" >> /opt/electric-storm/.env
fi

# Configure YAML
if [ "$AI_CHOICE" == "2" ]; then
    sed -i 's/default_provider: "google"/default_provider: "custom"/' $CFG
    sed -i 's/ollama: { enabled: false/ollama: { enabled: true/' $CFG
fi

if [ "$LEVEL" == "3" ]; then
    sed -i 's/mode: "user"/mode: "god"/' $CFG
elif [ "$LEVEL" == "2" ]; then
    sed -i 's/mode: "user"/mode: "sandbox"/' $CFG
fi

echo -e "\n${GREEN}✅ Installation Complete. Type 'theo' to start.${NC}"
