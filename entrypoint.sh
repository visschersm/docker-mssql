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

/usr/src/app/setup-database.sh password=$password & /opt/mssql/bin/sqlservr