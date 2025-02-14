-- Création de la base de données
CREATE DATABASE fokus_gestion_projets;

-- Utilisation de la base de données
USE fokus_gestion_projets;


-- Création de la table Clients
CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    nom_entreprise VARCHAR(100) NOT NULL,
    nom_contact VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    adresse TEXT,
    ville VARCHAR(100),
    code_postal VARCHAR(10),
    pays VARCHAR(50) DEFAULT 'France',
    secteur_activite VARCHAR(100),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut_client ENUM('actif', 'inactif', 'prospect') DEFAULT 'actif'
);


-- Création de la table Employés
CREATE TABLE employes (
    employe_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email_pro VARCHAR(100) UNIQUE NOT NULL,
    telephone_pro VARCHAR(20),
    poste VARCHAR(100),
    departement VARCHAR(100),
    date_embauche DATE,
    niveau_competence ENUM('junior', 'intermediaire', 'senior', 'expert')
);


-- Création de la table Projets
CREATE TABLE projets (
    projet_id INT PRIMARY KEY AUTO_INCREMENT,
    nom_projet VARCHAR(100) NOT NULL,
    client_id INT,
    chef_projet_id INT,
    description TEXT,
    date_debut DATE,
    date_fin DATE,
    statut ENUM('planification', 'actif', 'termine', 'en_pause', 'annule'),
    priorite ENUM('basse', 'moyenne', 'haute', 'critique'),
    budget DECIMAL(10,2),
    cout_reel DECIMAL(10,2),
    technologie_principale VARCHAR(100),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (chef_projet_id) REFERENCES employes(employe_id)
);


-- Création de la table Tâches
CREATE TABLE taches (
    tache_id INT PRIMARY KEY AUTO_INCREMENT,
    projet_id INT,
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    employe_id INT,
    statut ENUM('a_faire', 'en_cours', 'en_revue', 'termine'),
    priorite ENUM('basse', 'moyenne', 'haute'),
    date_debut DATE,
    date_fin_prevue DATE,
    date_fin_reelle DATE,
    temps_estime DECIMAL(5,2),
    temps_passe DECIMAL(5,2),
    FOREIGN KEY (projet_id) REFERENCES projets(projet_id),
    FOREIGN KEY (employe_id) REFERENCES employes(employe_id)
);


-- Création de la table Compétences
CREATE TABLE competences (
    competence_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    categorie VARCHAR(50),
    description TEXT
);


-- Table de liaison Employés-Compétences
CREATE TABLE employe_competences (
    employe_id INT,
    competence_id INT,
    niveau ENUM('debutant', 'intermediaire', 'avance', 'expert'),
    date_acquisition DATE,
    PRIMARY KEY (employe_id, competence_id),
    FOREIGN KEY (employe_id) REFERENCES employes(employe_id),
    FOREIGN KEY (competence_id) REFERENCES competences(competence_id)
);


-- Création de la table Factures
CREATE TABLE factures (
    facture_id INT PRIMARY KEY AUTO_INCREMENT,
    projet_id INT,
    numero_facture VARCHAR(50) UNIQUE NOT NULL,
    date_emission DATE NOT NULL,
    date_echeance DATE,
    montant_ht DECIMAL(10,2),
    tva DECIMAL(5,2),
    montant_ttc DECIMAL(10,2),
    statut ENUM('en_attente', 'payee', 'retard', 'annulee'),
    FOREIGN KEY (projet_id) REFERENCES projets(projet_id)
);


-- Insertion des données exemple pour les compétences
INSERT INTO competences (nom, categorie, description) VALUES
('SQL', 'Base de données', 'Maîtrise des requêtes complexes et optimisation'),
('Java', 'Programmation', 'Développement d''applications enterprise'),
('Docker', 'DevOps', 'Conteneurisation et orchestration'),
('AWS', 'Cloud', 'Architecture et déploiement cloud');


-- Insertion des données exemple pour les employés
INSERT INTO employes (nom, prenom, email_pro, telephone_pro, poste, departement, date_embauche, niveau_competence) VALUES
('Dubois', 'Thomas', 'thomas.dubois@fokus-it.fr', '+33611223344', 'Chef de Projet', 'Gestion de Projet', '2023-01-15', 'senior'),
('Laurent', 'Sophie', 'sophie.laurent@fokus-it.fr', '+33622334455', 'Développeuse Full-Stack', 'Développement', '2023-03-01', 'expert'),
('Martin', 'Lucas', 'lucas.martin@fokus-it.fr', '+33633445566', 'DevOps Engineer', 'Infrastructure', '2023-06-15', 'intermediaire');


-- Insertion des données exemple pour les clients
INSERT INTO clients (nom_entreprise, nom_contact, email, telephone, ville, secteur_activite) VALUES
('Tech Solutions', 'Jean Dupont', 'jean@techsolutions.fr', '+33123456789', 'Lyon', 'Technologies'),
('Digital Innovation', 'Marie Lambert', 'marie@digital-inn.fr', '+33987654321', 'Paris', 'Conseil'),
('Smart Systems', 'Pierre Martin', 'pierre@smartsys.fr', '+33654321987', 'Marseille', 'IoT');


-- Insertion des données exemple pour les projets
INSERT INTO projets (nom_projet, client_id, chef_projet_id, description, date_debut, date_fin, statut, priorite, budget, technologie_principale) VALUES
('Implémentation CRM', 1, 1, 'Mise en place d''un système CRM personnalisé', '2024-01-01', '2024-06-30', 'actif', 'haute', 50000.00, 'Java'),
('Migration Cloud', 2, 1, 'Migration de l''infrastructure vers AWS', '2024-02-15', '2024-08-15', 'planification', 'critique', 75000.00, 'AWS'),
('Entrepôt de Données', 3, 1, 'Création d''un entrepôt de données', '2023-11-01', '2024-04-30', 'termine', 'moyenne', 100000.00, 'SQL');


-- Insertion des données exemple pour les tâches
INSERT INTO taches (projet_id, titre, employe_id, statut, priorite, date_debut, date_fin_prevue, temps_estime) VALUES
(1, 'Analyse des besoins client', 1, 'termine', 'haute', '2024-01-01', '2024-01-15', 40.00),
(1, 'Développement interface utilisateur', 2, 'en_cours', 'moyenne', '2024-01-16', '2024-02-15', 80.00),
(2, 'Configuration AWS', 3, 'a_faire', 'haute', '2024-02-15', '2024-03-15', 60.00);


-- Insertion des données exemple pour les factures
INSERT INTO factures (projet_id, numero_facture, date_emission, date_echeance, montant_ht, tva, montant_ttc, statut) VALUES
(1, 'FAC-2024-001', '2024-01-31', '2024-03-02', 15000.00, 20.00, 18000.00, 'payee'),
(2, 'FAC-2024-002', '2024-02-28', '2024-03-30', 25000.00, 20.00, 30000.00, 'en_attente'),
(3, 'FAC-2024-003', '2024-03-15', '2024-04-14', 40000.00, 20.00, 48000.00, 'en_attente');


-- Insertion des données exemple pour les compétences des employés
INSERT INTO employe_competences (employe_id, competence_id, niveau, date_acquisition) VALUES
(1, 1, 'expert', '2023-01-15'),
(2, 1, 'avance', '2023-03-01'),
(2, 2, 'expert', '2023-03-01'),
(3, 3, 'expert', '2023-06-15'),
(3, 4, 'avance', '2023-06-15');


-- Exemples de requêtes avancées

-- 1. Vue d'ensemble des projets avec leurs chefs de projet et clients
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


-- 2. Analyse des compétences par département
SELECT 
    e.departement,
    c.nom as competence,
    COUNT(*) as nombre_employes,
    GROUP_CONCAT(CONCAT(e.prenom, ' ', e.nom)) as employes
FROM employes e
JOIN employe_competences ec ON e.employe_id = ec.employe_id
JOIN competences c ON ec.competence_id = c.competence_id
GROUP BY e.departement, c.nom;


-- 3. Suivi des factures et paiements par projet
SELECT 
    p.nom_projet,
    COUNT(f.facture_id) as nombre_factures,
    SUM(CASE WHEN f.statut = 'payee' THEN f.montant_ttc ELSE 0 END) as montant_paye,
    SUM(CASE WHEN f.statut = 'en_attente' THEN f.montant_ttc ELSE 0 END) as montant_en_attente
FROM projets p
LEFT JOIN factures f ON p.projet_id = f.projet_id
GROUP BY p.projet_id, p.nom_projet;


-- 4. Analyse de la charge de travail des employés
SELECT 
    CONCAT(e.prenom, ' ', e.nom) as employe,
    COUNT(t.tache_id) as nombre_taches,
    SUM(t.temps_estime) as temps_total_estime,
    SUM(t.temps_passe) as temps_total_passe
FROM employes e
LEFT JOIN taches t ON e.employe_id = t.employe_id
WHERE t.statut != 'termine' OR t.statut IS NULL
GROUP BY e.employe_id;


-- 5. Rapport sur l'avancement des projets
SELECT 
    p.nom_projet,
    COUNT(t.tache_id) as total_taches,
    SUM(CASE WHEN t.statut = 'termine' THEN 1 ELSE 0 END) as taches_terminees,
    ROUND(SUM(CASE WHEN t.statut = 'termine' THEN 1 ELSE 0 END) * 100.0 / COUNT(t.tache_id), 2) as pourcentage_avancement,
    p.date_fin as date_fin_prevue,
    DATEDIFF(p.date_fin, CURRENT_DATE) as jours_restants
FROM projets p
LEFT JOIN taches t ON p.projet_id = t.projet_id
WHERE p.statut = 'actif'
GROUP BY p.projet_id; 