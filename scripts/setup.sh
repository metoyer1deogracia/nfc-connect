#!/bin/bash
set -e

echo "🛠️ Configuration de l'environnement NFC Connect..."

# Installation des dépendances
echo "📦 Installation des dépendances..."
npm install

# Configuration AWS CLI
echo "⚙️ Configuration AWS CLI..."
if [ ! -f ~/.aws/credentials ]; then
    echo "Configuration AWS requise..."
    aws configure
fi

# Installation Terraform
if ! command -v terraform &> /dev/null; then
    echo "🔧 Installation de Terraform..."
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install terraform
fi

# Installation Ansible
if ! command -v ansible &> /dev/null; then
    echo "🔧 Installation d'Ansible..."
    sudo apt-get update
    sudo apt-get install -y ansible
fi

echo "✅ Configuration terminée!"
