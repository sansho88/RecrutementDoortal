#!/bin/bash

# Démarrer SQL Server en arrière-plan
/opt/mssql/bin/sqlservr &

# Fonction pour attendre que SQL Server soit prêt
wait_for_sqlserver() {
    echo "Attente du demarrage de SQL Server..."
    
    # Attendre un peu avant le premier test
    sleep 15
    
    # Boucle de retry (max 60 tentatives = ~2 minutes)
    for i in {1..60}; do
        echo "Test de connexion... (tentative $i/60)"
        
        # Tester si SQL Server répond
        /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -C -Q "SELECT 1" > /dev/null 2>&1
        
        if [ $? -eq 0 ]; then
            echo "SQL Server est pret!"
            return 0
        fi
        
        echo "SQL Server pas encore pret, attente 2 secondes..."
        sleep 2
    done
    
    echo "ERREUR: SQL Server n'a pas demarre dans le temps imparti"
    return 1
}

# Attendre que SQL Server soit vraiment prêt
if wait_for_sqlserver; then
    echo "Execution du script d'initialisation..."
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -C -i /var/opt/mssql/scripts/init-db.sql
    echo "Base de donnees initialisee."
else
    echo "Impossible d'initialiser la base de donnees."
fi

# Garder le conteneur actif
wait

