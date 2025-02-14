# 🌟 Système de Gestion de Projets Fokus

<div align="center">

[![Fokus IT](https://img.shields.io/badge/Fokus%20IT-Gestion%20Projets-blue?style=for-the-badge&logo=windows-terminal&logoColor=white)](https://www.fokus-it.fr)
[![SQL](https://img.shields.io/badge/SQL-Database-orange?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com)
[![Version](https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge&logo=git-lfs&logoColor=white)](https://github.com)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green?style=for-the-badge&logo=github&logoColor=white)](https://github.com)
[![Made with Love](https://img.shields.io/badge/Made%20with-Love-red?style=for-the-badge&logo=heart&logoColor=white)](https://www.fokus-it.fr)

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

</div>

<div align="center">
  <h3>🏢 Une Solution Complète de Gestion de Projets pour Fokus IT</h3>
  <p><i>Développé avec passion pour optimiser la gestion de projets IT</i></p>
  
  [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/company/fokus-it)
  [![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/FokusIT)
  [![Facebook](https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white)](https://www.facebook.com/fokusit)
  [![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/fokusit)
</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png" width="100%">

## 🎯 Points Forts du Projet

<table>
  <tr>
    <td align="center"><b>🔥 Performance</b></td>
    <td align="center"><b>🛡️ Sécurité</b></td>
    <td align="center"><b>📊 Analytics</b></td>
    <td align="center"><b>🔄 Scalabilité</b></td>
  </tr>
  <tr>
    <td align="center">Optimisation SQL</td>
    <td align="center">Gestion des accès</td>
    <td align="center">Rapports avancés</td>
    <td align="center">Architecture évolutive</td>
  </tr>
</table>

## 💫 Fonctionnalités Principales

<div align="center">
  <table>
    <tr>
      <td>
        <h3>📊 Gestion des Projets</h3>
        <ul>
          <li>Suivi en temps réel</li>
          <li>Gestion des priorités</li>
          <li>Analyse des coûts</li>
        </ul>
      </td>
      <td>
        <h3>👥 Gestion des Équipes</h3>
        <ul>
          <li>Profils détaillés</li>
          <li>Suivi des compétences</li>
          <li>Attribution des tâches</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>
        <h3>💼 Gestion des Clients</h3>
        <ul>
          <li>Historique complet</li>
          <li>Suivi des interactions</li>
          <li>Gestion des contrats</li>
        </ul>
      </td>
      <td>
        <h3>📈 Analyses & Rapports</h3>
        <ul>
          <li>KPIs en temps réel</li>
          <li>Tableaux de bord</li>
          <li>Prévisions budgétaires</li>
        </ul>
      </td>
    </tr>
  </table>
</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/fire.png" width="100%">

## 🗄️ Architecture de la Base de Données

### 📋 Structure des Tables Principales

<details>
<summary><b>Table `clients` 🏢</b></summary>

| Champ | Type | Description |
|:------|:-----|:------------|
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

</details>

<details>
<summary><b>Table `employes` 👥</b></summary>

| Champ | Type | Description |
|:------|:-----|:------------|
| employe_id | INT | Identifiant unique de l'employé |
| nom | VARCHAR(50) | Nom de famille |
| prenom | VARCHAR(50) | Prénom |
| email_pro | VARCHAR(100) | Email professionnel |
| poste | VARCHAR(100) | Poste occupé |
| departement | VARCHAR(100) | Département |
| niveau_competence | ENUM | Niveau d'expertise |

</details>

<details>
<summary><b>Table `projets` 📊</b></summary>

| Champ | Type | Description |
|:------|:-----|:------------|
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

</details>

## 📊 Exemples d'Analyses Avancées

<details>
<summary><b>🔍 Vue d'ensemble des projets</b></summary>

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
</details>

<details>
<summary><b>📈 Analyse des compétences</b></summary>

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
</details>

<details>
<summary><b>💰 Suivi financier</b></summary>

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
</details>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

## 🚀 Installation et Démarrage

<div align="center">

### Prérequis
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com)
[![Server](https://img.shields.io/badge/Server-Compatible-green?style=for-the-badge&logo=server-fault&logoColor=white)](https://www.mysql.com/downloads/)

</div>

### 📥 Installation de MySQL

1. **Sur macOS (avec Homebrew)**
```bash
# Installation de MySQL
brew install mysql

# Démarrage du service MySQL
brew services start mysql
```

2. **Sur Linux (Ubuntu/Debian)**
```bash
# Mise à jour des paquets
sudo apt update

# Installation de MySQL
sudo apt install mysql-server

# Démarrage du service MySQL
sudo systemctl start mysql
```

3. **Sur Windows**
- Téléchargez MySQL depuis [le site officiel](https://dev.mysql.com/downloads/installer/)
- Suivez l'assistant d'installation
- Assurez-vous que le service MySQL est démarré

### 🔧 Configuration Initiale

1. **Connexion à MySQL**
```bash
# Connexion sans mot de passe (si configuré ainsi)
mysql -u root

# OU avec mot de passe
mysql -u root -p
```

2. **Création et Utilisation de la Base de Données**
```sql
-- Création de la base de données
CREATE DATABASE fokus_gestion_projets;

-- Utilisation de la base de données
USE fokus_gestion_projets;
```

### 📋 Installation du Projet

1. **Clonez le Projet**
```bash
git clone https://github.com/votre-repo/fokus-gestion-projets.git
cd fokus-gestion-projets
```

2. **Importez la Structure et les Données**
```bash
# Dans le terminal
mysql -u root < fokus_gestion_projets.sql

# OU dans MySQL
source fokus_gestion_projets.sql
```

### 🔍 Vérification de l'Installation

Exécutez ces requêtes pour vérifier que tout est bien installé :

```sql
-- Vérification des tables
SHOW TABLES;

-- Vérification des données des projets
SELECT p.nom_projet, c.nom_entreprise, 
       CONCAT(e.prenom, ' ', e.nom) as chef_projet
FROM projets p
JOIN clients c ON p.client_id = c.client_id
JOIN employes e ON p.chef_projet_id = e.employe_id;
```

### 🎯 Exemples d'Utilisation

1. **Liste des Clients**
```sql
SELECT nom_entreprise, nom_contact, ville 
FROM clients 
ORDER BY ville;
```

2. **Projets en Cours**
```sql
SELECT nom_projet, priorite, budget
FROM projets
WHERE statut = 'actif'
ORDER BY priorite DESC;
```

3. **Analyse des Compétences**
```sql
SELECT e.departement, c.nom as competence,
       COUNT(*) as nombre_employes
FROM employes e
JOIN employe_competences ec ON e.employe_id = ec.employe_id
JOIN competences c ON ec.competence_id = c.competence_id
GROUP BY e.departement, c.nom;
```

### ⚠️ Résolution des Problèmes Courants

1. **Erreur d'Accès**
```bash
# Réinitialisation du mot de passe root
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'votre_nouveau_mot_de_passe';
FLUSH PRIVILEGES;
```

2. **Erreur de Base de Données Existante**
```sql
-- Suppression de la base si nécessaire
DROP DATABASE IF EXISTS fokus_gestion_projets;
CREATE DATABASE fokus_gestion_projets;
```

3. **Erreur de Privilèges**
```sql
-- Attribution des privilèges
GRANT ALL PRIVILEGES ON fokus_gestion_projets.* TO 'votre_utilisateur'@'localhost';
FLUSH PRIVILEGES;
```

### 📝 Notes Importantes

- Assurez-vous que MySQL est bien démarré avant toute opération
- Vérifiez les droits d'accès aux fichiers
- Sauvegardez vos données avant toute manipulation importante
- Pour les environnements de production, configurez des mots de passe sécurisés

## 🌟 Fonctionnalités Avancées

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="https://img.shields.io/badge/-Performance-blue?style=for-the-badge&logo=speedtest&logoColor=white" alt="Performance"><br>
        Analyse détaillée de l'avancement
      </td>
      <td align="center">
        <img src="https://img.shields.io/badge/-Resources-green?style=for-the-badge&logo=resource-guru&logoColor=white" alt="Resources"><br>
        Gestion optimale des ressources
      </td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://img.shields.io/badge/-Finance-yellow?style=for-the-badge&logo=bitcoin&logoColor=white" alt="Finance"><br>
        Reporting financier avancé
      </td>
      <td align="center">
        <img src="https://img.shields.io/badge/-Skills-red?style=for-the-badge&logo=skills-share&logoColor=white" alt="Skills"><br>
        Gestion des compétences
      </td>
    </tr>
  </table>
</div>

## 📞 Contact & Support

<div align="center">
  <table>
    <tr>
      <td align="center">
        <a href="https://www.fokus-it.fr" target="_blank">
          <img src="https://img.shields.io/badge/-Website-blue?style=for-the-badge&logo=firefox&logoColor=white" alt="Website"><br>
          www.fokus-it.fr
        </a>
      </td>
      <td align="center">
        <a href="mailto:contact@fokus-it.fr">
          <img src="https://img.shields.io/badge/-Email-red?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"><br>
          contact@fokus-it.fr
        </a>
      </td>
    </tr>
    <tr>
      <td align="center">
        <a href="tel:+33437533904">
          <img src="https://img.shields.io/badge/-Phone-green?style=for-the-badge&logo=phone&logoColor=white" alt="Phone"><br>
          04 37 53 39 04
        </a>
      </td>
      <td align="center">
        <a href="https://goo.gl/maps/YOUR_GOOGLE_MAPS_LINK" target="_blank">
          <img src="https://img.shields.io/badge/-Address-purple?style=for-the-badge&logo=map&logoColor=white" alt="Address"><br>
          11 Bd Eugène Deruelle, 69003 Lyon
        </a>
      </td>
    </tr>
  </table>
</div>

---

<div align="center">
    <img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">
    <br>
    <a href="https://www.fokus-it.fr">
      <img src="https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-red.svg?style=for-the-badge" alt="Made with love">
    </a>
    <br>
    <b>Développé avec passion par l'équipe Fokus IT</b>
    <br>
    © 2024 Fokus IT - Tous droits réservés
</div> 