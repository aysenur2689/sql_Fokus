# 🌟 Système de Gestion de Projets Fokus

<div align="center">

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2022-blue?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)](https://www.microsoft.com/sql-server)
[![Version](https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge&logo=git-lfs&logoColor=white)](https://github.com)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green?style=for-the-badge&logo=github&logoColor=white)](https://github.com)

</div>

## 📋 Structure de la Base de Données

### 1. Table `clients`
- Gestion complète des informations clients
- Suivi des contacts et coordonnées
- Historique des interactions
- Statut et secteur d'activité

### 2. Table `employes`
- Informations personnelles et professionnelles
- Gestion des postes et départements
- Niveau de compétence
- Coordonnées professionnelles

### 3. Table `projets`
- Suivi complet des projets
- Association client et chef de projet
- Gestion des budgets et coûts
- Statut et priorité du projet
- Technologies utilisées

### 4. Table `taches`
- Découpage des projets en tâches
- Attribution aux employés
- Suivi des délais et de l'avancement
- Estimation et suivi du temps

### 5. Table `competences`
- Référentiel des compétences
- Catégorisation des expertises
- Description détaillée

### 6. Table `employe_competences`
- Association employés et compétences
- Niveau de maîtrise
- Date d'acquisition

### 7. Table `factures`
- Gestion complète de la facturation
- Suivi des paiements
- Calcul TVA et montants
- États des factures

## 🚀 Installation

### Prérequis
- SQL Server 2022 ou plus récent
- Windows 10 ou plus récent
- PowerShell

### Étapes d'Installation

1. **Préparation de l'environnement**
```powershell
# Vérifier SQL Server
Get-Service MSSQLSERVER
```

2. **Création de la base de données**
```sql
CREATE DATABASE fokus_gestion_projets;
```

3. **Exécution du script d'initialisation**
```powershell
sqlcmd -S . -E -i fokus_gestion_projets_sqlserver.sql
```

## 📊 Exemples de Requêtes

### 1. Vue d'ensemble des projets
```sql
SELECT 
    p.nom_projet,
    c.nom_entreprise as client,
    e.nom + ' ' + e.prenom as chef_projet,
    p.statut,
    p.priorite
FROM projets p
JOIN clients c ON p.client_id = c.client_id
JOIN employes e ON p.chef_projet_id = e.employe_id;
```

### 2. Suivi des compétences
```sql
SELECT 
    e.nom + ' ' + e.prenom as employe,
    c.nom as competence,
    ec.niveau,
    ec.date_acquisition
FROM employes e
JOIN employe_competences ec ON e.employe_id = ec.employe_id
JOIN competences c ON ec.competence_id = c.competence_id;
```

### 3. État des factures
```sql
SELECT 
    p.nom_projet,
    f.numero_facture,
    f.montant_ttc,
    f.statut,
    f.date_echeance
FROM factures f
JOIN projets p ON f.projet_id = p.projet_id;
```

## 🔧 Maintenance

### Sauvegarde
```sql
BACKUP DATABASE fokus_gestion_projets
TO DISK = 'C:\Backup\fokus_gestion_projets.bak'
WITH FORMAT, COMPRESSION;
```

### Restauration
```sql
RESTORE DATABASE fokus_gestion_projets
FROM DISK = 'C:\Backup\fokus_gestion_projets.bak'
WITH REPLACE;
```

## 📈 Fonctionnalités Principales

1. **Gestion des Projets**
   - Suivi complet du cycle de vie
   - Gestion des priorités
   - Suivi budgétaire

2. **Gestion des Ressources**
   - Suivi des compétences
   - Attribution des tâches
   - Gestion des charges

3. **Facturation**
   - Génération automatique
   - Suivi des paiements
   - Calcul des taxes

4. **Reporting**
   - Tableaux de bord
   - Suivi des performances
   - Analyses financières

## 🔒 Sécurité

- Authentification Windows intégrée
- Gestion des droits par rôle
- Journalisation des modifications

## 📞 Support

Pour toute assistance technique :
- 📧 Email: support@fokus-it.fr
- 📱 Téléphone: +33 4 37 53 39 04
- 🌐 Site web: www.fokus-it.fr

## 📝 Licence

© 2024 Fokus IT - Tous droits réservés

---

<div align="center">
    <b>Développé avec passion par l'équipe Fokus IT</b>
</div>

---
