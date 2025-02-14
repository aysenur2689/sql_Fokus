# 🚀 Système de Gestion de Projets Fokus

![Fokus IT](https://img.shields.io/badge/Fokus%20IT-Gestion%20Projets-blue)
![SQL](https://img.shields.io/badge/SQL-Database-orange)
![Version](https://img.shields.io/badge/version-1.0.0-green)
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)
![Made with Love](https://img.shields.io/badge/Made%20with-Love-red.svg)

## 📋 Description

Ce projet est une démonstration d'une base de données SQL complète pour la gestion de projets chez Fokus IT. Il permet de gérer les clients, les projets, les employés, les compétences, les tâches et la facturation de manière efficace et professionnelle.

## 🎯 Fonctionnalités

- ✨ Gestion complète des clients et leur suivi
- 👥 Gestion des employés et leurs compétences
- 📊 Suivi détaillé des projets et tâches
- 💰 Gestion des budgets et facturation
- 📈 Analyses et rapports avancés
- 🔄 Suivi des statuts et de l'avancement
- 📆 Planification et gestion du temps
- 💡 Gestion des compétences et expertises

## 🗄️ Structure de la Base de Données

### Table `clients`
| Champ | Type | Description |
|-------|------|-------------|
| client_id | INT | Identifiant unique du client |
| nom_entreprise | VARCHAR(100) | Nom de l'entreprise cliente |
| nom_contact | VARCHAR(100) | Nom du contact principal |
| email | VARCHAR(100) | Adresse email du contact |
| telephone | VARCHAR(20) | Numéro de téléphone |
| adresse | TEXT | Adresse postale |
| ville | VARCHAR(100) | Ville |
| code_postal | VARCHAR(10) | Code postal |
| pays | VARCHAR(50) | Pays (France par défaut) |
| secteur_activite | VARCHAR(100) | Secteur d'activité |
| date_creation | TIMESTAMP | Date d'ajout du client |
| statut_client | ENUM | Statut du client |

### Table `employes`
| Champ | Type | Description |
|-------|------|-------------|
| employe_id | INT | Identifiant unique de l'employé |
| nom | VARCHAR(50) | Nom de famille |
| prenom | VARCHAR(50) | Prénom |
| email_pro | VARCHAR(100) | Email professionnel |
| poste | VARCHAR(100) | Poste occupé |
| departement | VARCHAR(100) | Département |
| niveau_competence | ENUM | Niveau d'expertise |

### Table `projets`
| Champ | Type | Description |
|-------|------|-------------|
| projet_id | INT | Identifiant unique du projet |
| nom_projet | VARCHAR(100) | Nom du projet |
| description | TEXT | Description détaillée |
| client_id | INT | Référence au client |
| chef_projet_id | INT | Chef de projet assigné |
| date_debut | DATE | Date de début |
| date_fin | DATE | Date de fin prévue |
| statut | ENUM | État du projet |
| priorite | ENUM | Niveau de priorité |
| budget | DECIMAL | Budget prévu |
| cout_reel | DECIMAL | Coût réel |

### Autres Tables
- `taches` : Gestion détaillée des tâches
- `competences` : Référentiel des compétences
- `employe_competences` : Association employés-compétences
- `factures` : Suivi de la facturation

## 📊 Exemples d'Analyses Avancées

1. **Vue d'ensemble des projets :**
```sql
SELECT 
    p.nom_projet,
    p.statut,
    p.priorite,
    CONCAT(e.prenom, ' ', e.nom) as chef_projet,
    c.nom_entreprise as client,
    p.budget,
    p.cout_reel,
    COALESCE(p.cout_reel - p.budget, 0) as difference_budget
FROM projets p
JOIN employes e ON p.chef_projet_id = e.employe_id
JOIN clients c ON p.client_id = c.client_id;
```

2. **Analyse des compétences :**
```sql
SELECT 
    e.departement,
    c.nom as competence,
    COUNT(*) as nombre_employes
FROM employes e
JOIN employe_competences ec ON e.employe_id = ec.employe_id
JOIN competences c ON ec.competence_id = c.competence_id
GROUP BY e.departement, c.nom;
```

3. **Suivi financier :**
```sql
SELECT 
    p.nom_projet,
    COUNT(f.facture_id) as nombre_factures,
    SUM(CASE WHEN f.statut = 'payee' 
        THEN f.montant_ttc ELSE 0 END) as montant_paye
FROM projets p
LEFT JOIN factures f ON p.projet_id = f.projet_id
GROUP BY p.projet_id, p.nom_projet;
```

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

## 📈 Fonctionnalités Avancées

- **Suivi des Performances :** Analyse détaillée de l'avancement des projets
- **Gestion des Ressources :** Suivi de la charge de travail des employés
- **Reporting Financier :** Analyse des budgets et coûts réels
- **Gestion des Compétences :** Suivi des expertises et formations
- **Facturation Automatisée :** Génération et suivi des factures

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
- Adresse : 11 Bd Eugène Deruelle, 69003 Lyon

---
<div align="center">
    <img src="https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-red.svg" alt="Made with love">
    <br>
    Développé avec passion par l'équipe Fokus IT
</div> 