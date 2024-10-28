# NFC Connect

Application de transfert de fichiers via NFC avec interface React, déploiement AWS et monitoring Datadog.

## 🚀 Quick Start

1. **Installation**
```bash
./scripts/setup.sh
```

2. **Déploiement**
```bash
./scripts/deploy.sh
```

## 📁 Structure
- `src/` - Code source React
- `infrastructure/` - Configuration Terraform et Ansible
- `monitoring/` - Configuration Datadog
- `scripts/` - Scripts utilitaires
- `docs/` - Documentation

## 📊 Monitoring

### Configuration Datadog
1. L'agent Datadog est configuré pour surveiller :
   - Performances application
   - Métriques système
   - Logs applicatifs
   - Real User Monitoring (RUM)

### Métriques surveillées
- Temps de réponse API
- Transferts NFC
- Utilisation ressources
- Expérience utilisateur

### Configuration requise
```bash
# Variables d'environnement nécessaires
DD_APPLICATION_ID=your_app_id
DD_CLIENT_TOKEN=your_client_token
DATADOG_API_KEY=your_api_key
```
