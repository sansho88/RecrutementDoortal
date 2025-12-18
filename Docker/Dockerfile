# Dockerfile pour SQL Server avec données initiales
FROM mcr.microsoft.com/mssql/server:2025-latest

# Variables d'environnement (par simplicité c'est en clair, mais évidemment qu'un .env est mieux)
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=GriffithDoortal2026!
ENV MSSQL_PID=Express

# Créer le répertoire pour les scripts
USER root
RUN mkdir -p /var/opt/mssql/scripts
COPY init-db.sql /var/opt/mssql/scripts/
COPY entrypoint.sh /var/opt/mssql/scripts/
RUN chmod +x /var/opt/mssql/scripts/entrypoint.sh

USER mssql

EXPOSE 1433

# Lancer SQL Server puis exécuter le script d'init
CMD ["/bin/bash", "/var/opt/mssql/scripts/entrypoint.sh"]

