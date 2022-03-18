FROM postgis/postgis:12-3.2

RUN pg_createcluster 12 main

RUN pg_ctlcluster 12 main start && \
	su postgres -c "createuser umap" && \
	su postgres -c "createdb umap -O umap" && \
	su postgres -c "psql umap -c \"CREATE EXTENSION postgis\""
