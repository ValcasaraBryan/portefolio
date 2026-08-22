-- 019 — Seed descriptions FR/EN pour tous les skills existants
-- Mise à jour par skill_id + locale pour éviter les collisions sur les noms dupliqués

-- ── API ────────────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'API de Google pour accéder et gérer des fichiers stockés dans Google Drive.'          WHERE skill_id = 58 AND locale = 'fr';
UPDATE skill_translations SET description = 'Google API to access and manage files stored in Google Drive.'                        WHERE skill_id = 58 AND locale = 'en';

UPDATE skill_translations SET description = 'API de Google pour lire, écrire et manipuler des feuilles de calcul Google Sheets.'  WHERE skill_id = 59 AND locale = 'fr';
UPDATE skill_translations SET description = 'Google API to read, write and manipulate Google Sheets spreadsheets.'                 WHERE skill_id = 59 AND locale = 'en';

UPDATE skill_translations SET description = 'Plateforme de paiement en ligne pour intégrer des transactions sécurisées par carte.' WHERE skill_id = 61 AND locale = 'fr';
UPDATE skill_translations SET description = 'Online payment platform for integrating secure card transactions into applications.'   WHERE skill_id = 61 AND locale = 'en';

-- ── Back-End ───────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Langage système bas niveau offrant un contrôle fin des ressources mémoire et matérielles.' WHERE skill_id = 11 AND locale = 'fr';
UPDATE skill_translations SET description = 'Low-level system language providing fine-grained control over memory and hardware.'        WHERE skill_id = 11 AND locale = 'en';

UPDATE skill_translations SET description = 'Extension du C avec la programmation orientée objet, pour des systèmes performants et complexes.' WHERE skill_id = 12 AND locale = 'fr';
UPDATE skill_translations SET description = 'C extension with object-oriented programming for high-performance and complex systems.'         WHERE skill_id = 12 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework Node.js minimaliste et non-opinionné pour construire des API REST rapidement.' WHERE skill_id = 48 AND locale = 'fr';
UPDATE skill_translations SET description = 'Minimal, unopinionated Node.js framework for quickly building REST APIs.'               WHERE skill_id = 48 AND locale = 'en';

UPDATE skill_translations SET description = 'Langage orienté objet robuste, très utilisé en entreprise pour des applications scalables.' WHERE skill_id = 50 AND locale = 'fr';
UPDATE skill_translations SET description = 'Robust object-oriented language widely used in enterprise for scalable applications.'       WHERE skill_id = 50 AND locale = 'en';

UPDATE skill_translations SET description = 'JavaScript côté serveur via Node.js pour des APIs asynchrones et performantes.' WHERE skill_id = 66 AND locale = 'fr';
UPDATE skill_translations SET description = 'Server-side JavaScript via Node.js for asynchronous and performant APIs.'     WHERE skill_id = 66 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework Node.js structuré inspiré d''Angular, idéal pour des APIs maintenables et scalables.' WHERE skill_id = 14 AND locale = 'fr';
UPDATE skill_translations SET description = 'Angular-inspired structured Node.js framework, ideal for maintainable and scalable APIs.'       WHERE skill_id = 14 AND locale = 'en';

UPDATE skill_translations SET description = 'Langage serveur populaire pour le développement web dynamique, avec un écosystème mature.' WHERE skill_id = 10 AND locale = 'fr';
UPDATE skill_translations SET description = 'Popular server-side language for dynamic web development with a mature ecosystem.'         WHERE skill_id = 10 AND locale = 'en';

UPDATE skill_translations SET description = 'Langage polyvalent apprécié pour sa lisibilité, son scripting et ses bibliothèques data/ML.' WHERE skill_id = 13 AND locale = 'fr';
UPDATE skill_translations SET description = 'Versatile language valued for its readability, scripting capabilities and data/ML libraries.' WHERE skill_id = 13 AND locale = 'en';

UPDATE skill_translations SET description = 'Surcouche typée de JavaScript apportant la sécurité des types dans le code serveur.' WHERE skill_id = 65 AND locale = 'fr';
UPDATE skill_translations SET description = 'Typed superset of JavaScript bringing type safety to server-side code.'              WHERE skill_id = 65 AND locale = 'en';

-- ── BDD ────────────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Fork open-source de MySQL, performant et compatible, pour les bases de données relationnelles.' WHERE skill_id = 19 AND locale = 'fr';
UPDATE skill_translations SET description = 'Open-source MySQL fork, performant and compatible, for relational databases.'                   WHERE skill_id = 19 AND locale = 'en';

UPDATE skill_translations SET description = 'Base de données NoSQL orientée documents, flexible et adaptée aux données semi-structurées.' WHERE skill_id = 21 AND locale = 'fr';
UPDATE skill_translations SET description = 'Document-oriented NoSQL database, flexible and suited for semi-structured data.'             WHERE skill_id = 21 AND locale = 'en';

UPDATE skill_translations SET description = 'SGBD relationnel open-source avancé, robuste et riche en fonctionnalités pour la production.' WHERE skill_id = 20 AND locale = 'fr';
UPDATE skill_translations SET description = 'Advanced open-source relational database system, robust and feature-rich for production use.' WHERE skill_id = 20 AND locale = 'en';

UPDATE skill_translations SET description = 'Langage standard pour interroger, insérer, mettre à jour et gérer des bases relationnelles.' WHERE skill_id = 17 AND locale = 'fr';
UPDATE skill_translations SET description = 'Standard language for querying, inserting, updating and managing relational databases.'       WHERE skill_id = 17 AND locale = 'en';

UPDATE skill_translations SET description = 'Moteur de base de données embarqué, léger et sans serveur, idéal pour le développement local et le mobile.' WHERE skill_id = 18 AND locale = 'fr';
UPDATE skill_translations SET description = 'Lightweight embedded serverless database engine, ideal for local development and mobile apps.'               WHERE skill_id = 18 AND locale = 'en';

-- ── Best practice ──────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Architecture isolant la logique métier des couches techniques via des ports et adaptateurs.' WHERE skill_id = 15 AND locale = 'fr';
UPDATE skill_translations SET description = 'Architecture isolating business logic from technical layers via ports and adapters.'         WHERE skill_id = 15 AND locale = 'en';

UPDATE skill_translations SET description = 'Outil de hooks Git bloquant les commits qui ne respectent pas les règles de qualité.' WHERE skill_id = 53 AND locale = 'fr';
UPDATE skill_translations SET description = 'Git hook tool that blocks commits not meeting code quality rules.'                    WHERE skill_id = 53 AND locale = 'en';

UPDATE skill_translations SET description = 'Méthode de développement où les tests sont écrits avant l''implémentation pour guider la conception.' WHERE skill_id = 16 AND locale = 'fr';
UPDATE skill_translations SET description = 'Development method where tests are written before the implementation to guide design decisions.'       WHERE skill_id = 16 AND locale = 'en';

-- ── Cloud provider ─────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Suite de services cloud de Google pour héberger, déployer et scaler des applications.' WHERE skill_id = 60 AND locale = 'fr';
UPDATE skill_translations SET description = 'Google cloud services suite for hosting, deploying and scaling applications.'          WHERE skill_id = 60 AND locale = 'en';

-- ── Cryptography ───────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Protocole cryptographique sécurisant les communications entre client et serveur via TLS/HTTPS.' WHERE skill_id = 52 AND locale = 'fr';
UPDATE skill_translations SET description = 'Cryptographic protocol securing client-server communications via TLS/HTTPS.'                    WHERE skill_id = 52 AND locale = 'en';

-- ── Cyber Strategy ─────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Certification de Sécurité de Premier Niveau délivrée par l''ANSSI pour évaluer des produits de sécurité.' WHERE skill_id = 41 AND locale = 'fr';
UPDATE skill_translations SET description = 'First-level security certification issued by ANSSI to evaluate security products.'                        WHERE skill_id = 41 AND locale = 'en';

UPDATE skill_translations SET description = 'Méthode française d''appréciation et de traitement des risques cyber développée par l''ANSSI.' WHERE skill_id = 44 AND locale = 'fr';
UPDATE skill_translations SET description = 'French cyber risk assessment and treatment method developed by ANSSI.'                        WHERE skill_id = 44 AND locale = 'en';

UPDATE skill_translations SET description = 'Norme internationale définissant les exigences d''un système de management de la sécurité de l''information.' WHERE skill_id = 42 AND locale = 'fr';
UPDATE skill_translations SET description = 'International standard defining the requirements for an information security management system.'             WHERE skill_id = 42 AND locale = 'en';

UPDATE skill_translations SET description = 'Norme internationale fournissant les lignes directrices pour la gestion des risques de sécurité de l''information.' WHERE skill_id = 43 AND locale = 'fr';
UPDATE skill_translations SET description = 'International standard providing guidelines for information security risk management.'                              WHERE skill_id = 43 AND locale = 'en';

UPDATE skill_translations SET description = 'Directive européenne renforçant les exigences de cybersécurité pour les entités essentielles et importantes.' WHERE skill_id = 62 AND locale = 'fr';
UPDATE skill_translations SET description = 'European directive strengthening cybersecurity requirements for essential and important entities.'             WHERE skill_id = 62 AND locale = 'en';

UPDATE skill_translations SET description = 'Liste des dix risques de sécurité web les plus critiques, établie par l''OWASP comme référence mondiale.' WHERE skill_id = 45 AND locale = 'fr';
UPDATE skill_translations SET description = 'List of the ten most critical web security risks, established by OWASP as a global reference.'            WHERE skill_id = 45 AND locale = 'en';

-- ── DevSecOps ──────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Pratique d''intégration et déploiement continus automatisant les builds, tests et livraisons.' WHERE skill_id = 23 AND locale = 'fr';
UPDATE skill_translations SET description = 'Continuous integration and deployment practice automating builds, tests and releases.'         WHERE skill_id = 23 AND locale = 'en';

UPDATE skill_translations SET description = 'Plateforme de conteneurisation pour packager des applications et leurs dépendances en images portables.' WHERE skill_id = 24 AND locale = 'fr';
UPDATE skill_translations SET description = 'Containerization platform for packaging applications and their dependencies into portable images.'       WHERE skill_id = 24 AND locale = 'en';

UPDATE skill_translations SET description = 'Service CI/CD natif de GitHub pour automatiser les workflows de build, test et déploiement.' WHERE skill_id = 22 AND locale = 'fr';
UPDATE skill_translations SET description = 'GitHub native CI/CD service for automating build, test and deployment workflows.'            WHERE skill_id = 22 AND locale = 'en';

UPDATE skill_translations SET description = 'Orchestrateur open-source de conteneurs pour déployer, scaler et gérer des applications en production.' WHERE skill_id = 25 AND locale = 'fr';
UPDATE skill_translations SET description = 'Open-source container orchestrator for deploying, scaling and managing applications in production.'      WHERE skill_id = 25 AND locale = 'en';

UPDATE skill_translations SET description = 'Scanner réseau open-source pour la découverte d''hôtes, la cartographie de ports et l''audit de sécurité.' WHERE skill_id = 28 AND locale = 'fr';
UPDATE skill_translations SET description = 'Open-source network scanner for host discovery, port mapping and security auditing.'                      WHERE skill_id = 28 AND locale = 'en';

UPDATE skill_translations SET description = 'Proxy d''attaque open-source de l''OWASP pour tester la sécurité des applications web par interception.' WHERE skill_id = 26 AND locale = 'fr';
UPDATE skill_translations SET description = 'OWASP open-source attack proxy for testing web application security by intercepting requests.'          WHERE skill_id = 26 AND locale = 'en';

UPDATE skill_translations SET description = 'Plateforme d''analyse statique du code source pour détecter bugs, vulnérabilités et dette technique.' WHERE skill_id = 27 AND locale = 'fr';
UPDATE skill_translations SET description = 'Static code analysis platform to detect bugs, vulnerabilities and technical debt.'                    WHERE skill_id = 27 AND locale = 'en';

UPDATE skill_translations SET description = 'Outil automatisant la détection et l''exploitation d''injections SQL dans les applications web.' WHERE skill_id = 29 AND locale = 'fr';
UPDATE skill_translations SET description = 'Tool automating the detection and exploitation of SQL injection flaws in web applications.'    WHERE skill_id = 29 AND locale = 'en';

-- ── Front-End ──────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Langage de style pour mettre en forme, animer et rendre responsive les interfaces web.' WHERE skill_id = 56 AND locale = 'fr';
UPDATE skill_translations SET description = 'Stylesheet language for styling, animating and making web interfaces responsive.'       WHERE skill_id = 56 AND locale = 'en';

-- id=55 : name_fr=HTML (le nom EN est erroné en BDD, la compétence est HTML)
UPDATE skill_translations SET description = 'Langage de balisage définissant la structure et le contenu sémantique des pages web.' WHERE skill_id = 55 AND locale = 'fr';
UPDATE skill_translations SET description = 'Markup language defining the structure and semantic content of web pages.'            WHERE skill_id = 55 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework simplifiant le développement et le déploiement d''applications React Native sur iOS et Android.' WHERE skill_id = 7 AND locale = 'fr';
UPDATE skill_translations SET description = 'Framework simplifying the development and deployment of React Native apps on iOS and Android.'            WHERE skill_id = 7 AND locale = 'en';

UPDATE skill_translations SET description = 'Langage de script interactif du navigateur, fondement du web dynamique côté client.' WHERE skill_id = 3 AND locale = 'fr';
UPDATE skill_translations SET description = 'Interactive browser scripting language, the foundation of client-side dynamic web.'  WHERE skill_id = 3 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework React avec rendu côté serveur, génération statique et routing intégré pour des apps web modernes.' WHERE skill_id = 9 AND locale = 'fr';
UPDATE skill_translations SET description = 'React framework with server-side rendering, static generation and built-in routing for modern web apps.'      WHERE skill_id = 9 AND locale = 'en';

UPDATE skill_translations SET description = 'Bibliothèque JavaScript pour construire des interfaces utilisateur déclaratives à base de composants réutilisables.' WHERE skill_id = 5 AND locale = 'fr';
UPDATE skill_translations SET description = 'JavaScript library for building declarative user interfaces from reusable components.'                              WHERE skill_id = 5 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework basé sur React permettant de créer des applications mobiles natives iOS et Android en JavaScript.' WHERE skill_id = 6 AND locale = 'fr';
UPDATE skill_translations SET description = 'React-based framework for building native iOS and Android mobile applications in JavaScript.'                WHERE skill_id = 6 AND locale = 'en';

UPDATE skill_translations SET description = 'Surcouche typée de JavaScript apportant la sécurité des types et l''autocomplétion dans le développement front-end.' WHERE skill_id = 4 AND locale = 'fr';
UPDATE skill_translations SET description = 'Typed superset of JavaScript providing type safety and autocompletion in front-end development.'                       WHERE skill_id = 4 AND locale = 'en';

UPDATE skill_translations SET description = 'Outil de build front-end ultra-rapide exploitant les modules ES natifs pour un DX optimal.' WHERE skill_id = 8 AND locale = 'fr';
UPDATE skill_translations SET description = 'Ultra-fast front-end build tool leveraging native ES modules for optimal developer experience.' WHERE skill_id = 8 AND locale = 'en';

-- ── Governance ─────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Plan documenté garantissant la continuité des activités critiques de l''organisation en cas de sinistre.' WHERE skill_id = 63 AND locale = 'fr';
UPDATE skill_translations SET description = 'Documented plan ensuring the continuity of the organization''s critical activities in the event of a disaster.' WHERE skill_id = 63 AND locale = 'en';

UPDATE skill_translations SET description = 'Plan structuré permettant la reprise rapide des systèmes informatiques après une interruption majeure.' WHERE skill_id = 64 AND locale = 'fr';
UPDATE skill_translations SET description = 'Structured plan enabling rapid recovery of IT systems after a major disruption.'                        WHERE skill_id = 64 AND locale = 'en';

-- ── Infrastructure ─────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Gestion et administration de serveurs, environnements et services d''hébergement web.' WHERE skill_id = 51 AND locale = 'fr';
UPDATE skill_translations SET description = 'Management and administration of servers, environments and web hosting services.'     WHERE skill_id = 51 AND locale = 'en';

-- ── Languages ──────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Langue de travail internationale, maîtrisée à un niveau professionnel pour la communication écrite et orale.' WHERE skill_id = 2 AND locale = 'fr';
UPDATE skill_translations SET description = 'International working language, mastered at a professional level for written and oral communication.'         WHERE skill_id = 2 AND locale = 'en';

UPDATE skill_translations SET description = 'Langue maternelle, utilisée au quotidien en contexte professionnel et personnel.' WHERE skill_id = 1 AND locale = 'fr';
UPDATE skill_translations SET description = 'Native language, used daily in professional and personal contexts.'               WHERE skill_id = 1 AND locale = 'en';

-- ── Networking ─────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Protocole réseau assurant l''attribution automatique d''adresses IP aux équipements d''un réseau.' WHERE skill_id = 47 AND locale = 'fr';
UPDATE skill_translations SET description = 'Network protocol providing automatic IP address assignment to devices on a network.'              WHERE skill_id = 47 AND locale = 'en';

UPDATE skill_translations SET description = 'Système de résolution de noms de domaine en adresses IP, socle d''internet.' WHERE skill_id = 46 AND locale = 'fr';
UPDATE skill_translations SET description = 'Domain Name System resolving domain names to IP addresses, the backbone of the internet.' WHERE skill_id = 46 AND locale = 'en';

UPDATE skill_translations SET description = 'Configuration et gestion du routage réseau pour acheminer les paquets entre équipements et sous-réseaux.' WHERE skill_id = 54 AND locale = 'fr';
UPDATE skill_translations SET description = 'Configuration and management of network routing to forward packets between devices and subnets.'           WHERE skill_id = 54 AND locale = 'en';

-- ── Policy ─────────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Règlement européen encadrant la collecte, le traitement et la protection des données personnelles.' WHERE skill_id = 57 AND locale = 'fr';
UPDATE skill_translations SET description = 'European regulation governing the collection, processing and protection of personal data.'           WHERE skill_id = 57 AND locale = 'en';

-- ── System ─────────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Interface en ligne de commande pour l''administration système, le scripting et l''automatisation de tâches.' WHERE skill_id = 49 AND locale = 'fr';
UPDATE skill_translations SET description = 'Command-line interface for system administration, scripting and task automation.'                          WHERE skill_id = 49 AND locale = 'en';

-- ── Tooling ────────────────────────────────────────────────────────────────────
UPDATE skill_translations SET description = 'Utilisation d''outils d''intelligence artificielle pour assister la rédaction de code, la documentation et la productivité.' WHERE skill_id = 30 AND locale = 'fr';
UPDATE skill_translations SET description = 'Using AI tools to assist code writing, documentation and overall developer productivity.'                                    WHERE skill_id = 30 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework de tests end-to-end pour applications web, avec exécution dans un vrai navigateur.' WHERE skill_id = 34 AND locale = 'fr';
UPDATE skill_translations SET description = 'End-to-end testing framework for web applications, running tests inside a real browser.'       WHERE skill_id = 34 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework de tests end-to-end pour applications React Native, avec interactions natives simulées.' WHERE skill_id = 35 AND locale = 'fr';
UPDATE skill_translations SET description = 'End-to-end testing framework for React Native apps with simulated native interactions.'             WHERE skill_id = 35 AND locale = 'en';

UPDATE skill_translations SET description = 'Suite Elasticsearch-Logstash-Kibana pour la centralisation, l''analyse et la visualisation de logs.' WHERE skill_id = 40 AND locale = 'fr';
UPDATE skill_translations SET description = 'Elasticsearch-Logstash-Kibana stack for centralizing, analyzing and visualizing log data.'           WHERE skill_id = 40 AND locale = 'en';

UPDATE skill_translations SET description = 'Système de contrôle de version distribué, incontournable pour la gestion du code source en équipe.' WHERE skill_id = 36 AND locale = 'fr';
UPDATE skill_translations SET description = 'Distributed version control system, essential for managing source code in teams.'                    WHERE skill_id = 36 AND locale = 'en';

UPDATE skill_translations SET description = 'Serveur d''intégration continue open-source pour automatiser builds, tests et déploiements.' WHERE skill_id = 38 AND locale = 'fr';
UPDATE skill_translations SET description = 'Open-source continuous integration server for automating builds, tests and deployments.'     WHERE skill_id = 38 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework de tests JavaScript avec une syntaxe claire, du mocking intégré et une couverture de code.' WHERE skill_id = 31 AND locale = 'fr';
UPDATE skill_translations SET description = 'JavaScript testing framework with clear syntax, built-in mocking and code coverage reporting.'         WHERE skill_id = 31 AND locale = 'en';

UPDATE skill_translations SET description = 'Framework de tests JavaScript flexible pour Node.js et le navigateur, avec support asynchrone natif.' WHERE skill_id = 32 AND locale = 'fr';
UPDATE skill_translations SET description = 'Flexible JavaScript test framework for Node.js and the browser with native async support.'            WHERE skill_id = 32 AND locale = 'en';

UPDATE skill_translations SET description = 'Bibliothèque Node.js pour contrôler un navigateur Chrome en mode headless, utilisée pour les tests et le scraping.' WHERE skill_id = 33 AND locale = 'fr';
UPDATE skill_translations SET description = 'Node.js library for controlling a headless Chrome browser, used for testing and web scraping.'                       WHERE skill_id = 33 AND locale = 'en';

UPDATE skill_translations SET description = 'Environnement de développement isolé pour créer, documenter et tester des composants UI indépendamment.' WHERE skill_id = 37 AND locale = 'fr';
UPDATE skill_translations SET description = 'Isolated development environment for building, documenting and testing UI components independently.'      WHERE skill_id = 37 AND locale = 'en';

UPDATE skill_translations SET description = 'Analyseur de protocoles réseau pour capturer, inspecter et diagnostiquer le trafic en temps réel.' WHERE skill_id = 39 AND locale = 'fr';
UPDATE skill_translations SET description = 'Network protocol analyzer for capturing, inspecting and diagnosing network traffic in real time.'   WHERE skill_id = 39 AND locale = 'en';
