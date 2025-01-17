apiVersion: v1
kind: ConfigMap
metadata:
  name: liquibase-config
  namespace: liquibase
data:
  liquibase.properties: |
    changeLogFile=/liquibase/changelog/db.changelog-master.yaml
    username=postgres
    password=Postgres123
    url=jdbc:postgresql://postgres.sandbox.paylease.com:5432/postgres
    logLevel=info
    driver=org.postgresql.Driver
    includeSchema=false
  db.changelog-master.yaml: |
    databaseChangeLog:
      - include: file:changelog/changeset-001-create-users.yaml
      - include: file:changelog/changeset-002-add-products.yaml
  changeset-001-create-table-deploy.yaml: |
    databaseChangeLog:
      - changeSet:
          id: 001-create-table-deploy
          author: walters
          sqlFile: /eks/sql-scripts/create-table-deploy.sql
  changeset-002-create-table-connect.yaml: |
    databaseChangeLog:
      - changeSet:
          id: 002-create-table-connect
          author: walters
          sqlFile: /eks/sql-scripts/create-table-connect.sql
