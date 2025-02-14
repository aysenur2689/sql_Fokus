# 🚀 Système de Gestion de Projets Fokus

![Fokus IT](https://img.shields.io/badge/Fokus%20IT-Gestion%20Projets-blue)
![SQL](https://img.shields.io/badge/SQL-Database-orange)
![Version](https://img.shields.io/badge/version-1.0.0-green)

## 📋 Description

Ce projet est une démonstration d'une base de données SQL pour la gestion de projets chez Fokus IT. Il permet de gérer les clients, les projets et leurs relations de manière efficace et professionnelle.

## 🎯 Fonctionnalités

- ✨ Gestion complète des clients
- 📊 Suivi des projets
- 💰 Gestion des budgets
- 📈 Analyses et rapports
- 🔄 Statuts de projet dynamiques

## 🗄️ Structure de la Base de Données

### Table `clients`
| Champ | Type | Description |
|-------|------|-------------|
| client_id | INT | Identifiant unique du client |
| nom_entreprise | VARCHAR(100) | Nom de l'entreprise cliente |
| nom_contact | VARCHAR(100) | Nom du contact principal |
| email | VARCHAR(100) | Adresse email du contact |
| telephone | VARCHAR(20) | Numéro de téléphone |
| date_creation | TIMESTAMP | Date d'ajout du client |

### Table `projets`
| Champ | Type | Description |
|-------|------|-------------|
| projet_id | INT | Identifiant unique du projet |
| nom_projet | VARCHAR(100) | Nom du projet |
| client_id | INT | Référence au client |
| date_debut | DATE | Date de début du projet |
| date_fin | DATE | Date de fin prévue |
| statut | ENUM | État actuel du projet |
| budget | DECIMAL | Budget alloué |

## 📊 Exemples de Requêtes

Le système inclut plusieurs requêtes SQL démontrant différentes fonctionnalités :

- Jointures pour lier les informations clients et projets
- Agrégations pour l'analyse des portfolios
- Sous-requêtes pour des recherches complexes
- Fonctions de fenêtrage pour les analyses cumulatives
- Instructions CASE pour la catégorisation

## 🛠️ Installation

1. Connectez-vous à votre serveur MySQL
2. Exécutez le script SQL :
```sql
source fokus_gestion_projets.sql
```

## 🔍 Utilisation

Pour commencer à utiliser la base de données :

```sql
USE fokus_gestion_projets;
```

## 📈 Exemples d'Analyses

1. **Vue d'ensemble des projets par client :**
```sql
SELECT 
    c.nom_entreprise,
    COUNT(p.projet_id) as nombre_projets,
    SUM(p.budget) as budget_total
FROM clients c
LEFT JOIN projets p ON c.client_id = p.client_id
GROUP BY c.client_id;
```

2. **Statut des projets :**
```sql
SELECT 
    statut,
    COUNT(*) as nombre_projets
FROM projets
GROUP BY statut;
```

## 🤝 Contribution

Pour contribuer à ce projet :

1. Fork le projet
2. Créez votre branche (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 📝 License

© 2024 Fokus IT - Tous droits réservés

## 📞 Contact

- Site Web : [www.fokus-it.fr](https://www.fokus-it.fr)
- Email : contact@fokus-it.fr
- Téléphone : 04 37 53 39 04

---
<div align="center">
    <img src="https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-red.svg" alt="Made with love">
    <br>
    Développé avec passion par l'équipe Fokus IT
</div> 