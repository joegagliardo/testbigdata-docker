FROM joegagliardo/ubuntu
MAINTAINER joegagliardo
ENV MSSQL_SA_PASSWORD='SaPassword17!' 
ENV MSSQL_PID='evaluation'
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - 
RUN add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)" 
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - 
RUN add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/prod.list)" 
RUN apt-get update 
RUN apt-get install -y mssql-server mssql-server-fts 
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev 
RUN ACCEPT_EULA=Y MSSQL_SA_PASSWORD=$MSSQL_SA_PASSWORD MSSQL_PID=$MSSQL_PID /opt/mssql/bin/mssql-conf -n setup accept-eula 
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc



