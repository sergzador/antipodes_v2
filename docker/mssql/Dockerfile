FROM mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

#COPY ./create-from-mdf.sql .
#COPY ./entrypoint.sh .
EXPOSE 1433
# tried this: CMD ["/opt/mssql-tools/bin/sqlcmd", "-i", "create-from-mdf.sql", "-S", "localhost", "-U", "SA", "-P" "Welcome@toSQL2022"]
# tried this: CMD  sleep 30 && /opt/mssql-tools/bin/sqlcmd -S localhost,1433 -U sa -P Welcome@toSQL2022 -i create-from-mdf.sql#
#CMD  sleep 100 && /opt/mssql-tools/bin/sqlcmd -S localhost,1433 -U sa -P Welcome@toSQL2022 -d master -i create-from-mdf.sql
#CMD /bin/bash ./entrypoint.sh

#ENTRYPOINT /bin/bash ./entrypoint.sh




