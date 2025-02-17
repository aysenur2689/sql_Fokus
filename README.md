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

## 📘 Guide d'Utilisation SQL Server

### Installation de SQL Server
1. Téléchargez SQL Server 2022 Developer Edition depuis le [site officiel Microsoft](https://www.microsoft.com/fr-fr/sql-server/sql-server-downloads)
2. Lancez l'installation et sélectionnez "Installation personnalisée"
3. Installez les composants suivants :
   - Services Moteur de base de données
   - SQL Server Management Studio (SSMS)

### Démarrage avec SQL Server
1. **Lancer SQL Server Management Studio**
   - Recherchez "SSMS" dans le menu Démarrer
   - Connectez-vous avec l'authentification Windows

2. **Créer une nouvelle base de données**
   ```sql
   -- Via SSMS : Clic droit sur "Bases de données" > "Nouvelle base de données"
   -- Ou via requête :
   CREATE DATABASE fokus_gestion_projets;
   GO
   USE fokus_gestion_projets;
   ```

3. **Exécuter des scripts SQL**
   - Via SSMS : 
     1. Ouvrez un nouveau fichier de requête (Ctrl+N)
     2. Collez le script SQL
     3. Cliquez sur Exécuter (F5)
   
   - Via PowerShell :
   ```powershell
   # Exécuter un fichier SQL
   sqlcmd -S . -E -i "chemin_vers_fichier.sql"

   # Exécuter une requête directe
   sqlcmd -S . -E -Q "SELECT * FROM clients"
   ```

### Commandes SQL Server Utiles

1. **Gestion des Services**
   ```powershell
   # Démarrer SQL Server
   Start-Service MSSQLSERVER

   # Arrêter SQL Server
   Stop-Service MSSQLSERVER

   # Vérifier le statut
   Get-Service MSSQLSERVER
   ```

2. **Sauvegarde et Restauration**
   ```sql
   -- Sauvegarde complète
   BACKUP DATABASE fokus_gestion_projets
   TO DISK = 'C:\Backup\fokus_gestion_projets.bak'
   WITH FORMAT, COMPRESSION;

   -- Restauration
   RESTORE DATABASE fokus_gestion_projets
   FROM DISK = 'C:\Backup\fokus_gestion_projets.bak'
   WITH REPLACE;
   ```

3. **Maintenance de Base**
   ```sql
   -- Vérifier l'intégrité
   DBCC CHECKDB('fokus_gestion_projets');

   -- Reconstruire les index
   ALTER INDEX ALL ON table_name REBUILD;
   ```

### Résolution des Problèmes Courants

1. **Erreur de Connexion**
   - Vérifiez que le service SQL Server est démarré
   - Assurez-vous d'avoir les droits administrateur
   - Vérifiez le nom de l'instance (par défaut: .)

2. **Erreur d'Accès aux Fichiers**
   - Vérifiez les permissions du dossier
   - Exécutez SSMS en tant qu'administrateur

3. **Problèmes de Performance**
   - Vérifiez l'utilisation des index
   - Analysez le plan d'exécution des requêtes
   - Surveillez l'utilisation des ressources

### Bonnes Pratiques

1. **Sécurité**
   - Utilisez l'authentification Windows quand possible
   - Limitez les droits d'accès au minimum nécessaire
   - Changez régulièrement les mots de passe

2. **Performance**
   - Créez des index appropriés
   - Évitez les requêtes SELECT *
   - Utilisez des procédures stockées

3. **Maintenance**
   - Planifiez des sauvegardes régulières
   - Surveillez l'espace disque
   - Mettez à jour régulièrement SQL Server
