#!/bin/bash
set -e

# Installation de l'agent Datadog
DD_API_KEY=${DATADOG_API_KEY} DD_SITE="datadoghq.eu" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

# Configuration de l'agent
sudo cp monitoring/datadog.yaml /etc/datadog-agent/datadog.yaml
sudo chown dd-agent:dd-agent /etc/datadog-agent/datadog.yaml
sudo chmod 640 /etc/datadog-agent/datadog.yaml

# Redémarrage de l'agent
sudo systemctl restart datadog-agent

# Vérification du statut
sudo datadog-agent status
