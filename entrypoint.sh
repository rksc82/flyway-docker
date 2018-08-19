#!/usr/bin/env bash
 export FLYWAY_USER=$USERNAME
export FLYWAY_PASSWORD=$PASSWORD
 echo
echo "----------------------------------------------------------------"
printf "| %-50s |\n" "Running flyway migrations"
echo "----------------------------------------------------------------"
echo
 export FLYWAY_URL=$HOST
export FLYWAY_SCHEMAS=$SCHEMA
export FLYWAY_LOCATIONS=filesystem:./scripts
export FLYWAY_PLACEHOLDERS_schema=$SCHEMA
 echo "------------------------------------------------------"
printf "| %-50s |\n" "Migrating $FLYWAY_SCHEMAS"
echo "------------------------------------------------------"
echo
flyway migrate
flyway info

