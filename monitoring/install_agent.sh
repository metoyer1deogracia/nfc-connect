#!/bin/bash
set -e

# Définir la clé API Datadog
export DD_API_KEY="f2258479216558e6660d0c601da4a6c8"
export DD_SITE="datadoghq.eu"

# Installation de l'agent Datadog (version 7)
curl -s https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh | bash

# Configuration de l'agent
sudo mkdir -p /etc/datadog-agent/
sudo cp monitoring/datadog.yaml /etc/datadog-agent/datadog.yaml
sudo chown dd-agent:dd-agent /etc/datadog-agent/datadog.yaml
sudo chmod 640 /etc/datadog-agent/datadog.yaml

# Redémarrage de l'agent
sudo systemctl restart datadog-agent

# Vérification du statut
sudo datadog-agent status
