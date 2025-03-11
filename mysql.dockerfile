FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=12345678
ENV MYSQL_DATABASE=askyu
ENV MYSQL_USER=testes
ENV MYSQL_PASSWORD=1234678

COPY database_hom_gestio.sql /docker-entrypoint-initdb.d/