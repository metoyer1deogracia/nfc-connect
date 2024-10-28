#!/bin/bash
set -e

echo "🚀 Déploiement de NFC Connect..."

# Vérification des variables d'environnement
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "❌ Erreur: AWS credentials non configurées"
    exit 1
fi

# Construction de l'application
echo "📦 Construction de l'application React..."
npm run build

# Déploiement infrastructure
echo "🏗️ Déploiement de l'infrastructure..."
cd infrastructure/terraform
terraform init
terraform apply -auto-approve

# Récupération de l'IP du serveur
export SERVER_IP=$(terraform output -raw server_ip)

# Déploiement application
echo "📤 Déploiement de l'application..."
cd ../ansible
ansible-playbook -i inventory.yml deploy.yml

echo "✅ Déploiement terminé!"
echo "🌐 Application accessible sur: http://$SERVER_IP"

# Installation et configuration Datadog
echo '📊 Configuration du monitoring Datadog...'
./monitoring/install_agent.sh
