for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

if [ -z "$password" ]; then
    echo "Password not provided"
    exit 1
fi

sleep 15s

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Y0uSh@llN0tP@ss -d master -i setup.sql

echo "Finished setting up database"

echo "Reseting SA_PASSWORD to not use environment password"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Y0uSh@llN0tP@ss -Q "ALTER LOGIN SA WITH PASSWORD='$password'"
echo "Changed password"