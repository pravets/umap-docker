FROM ubuntu:20.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y build-essential autoconf python3.8 python3.8-dev python3-pip\ 
	python3-virtualenv wget nginx uwsgi uwsgi-plugin-python3 postgresql-12 docker \ 
	postgresql-server-dev-12 postgresql-12-postgis-3 git libxml2-dev \
	libxslt1-dev zlib1g-dev

RUN mkdir -p /home/srv/ && mkdir -p /etc/umap

RUN useradd -N umap -d /home/srv/

RUN chown umap:users /etc/umap && chown umap:users /home/srv/

RUN /etc/init.d/postgresql start && \
	su postgres -c "createuser umap" && \ 
	su postgres -c "createdb umap -O umap" && \ 
	su postgres -c "psql umap -c \"CREATE EXTENSION postgis\""

#RUN su umap

#RUN virtualenv /srv/umap/venv --python=/usr/bin/python3.8 && source /srv/umap/venv/bin/activate

COPY umap.conf /etc/umap/

#WORKDIR /home/srv/
RUN /etc/init.d/postgresql start && su umap -c "pip3 install umap-project && \ 
	./home/srv/.local/bin/umap migrate && \
	./home/srv/.local/bin/umap collectstatic"

COPY run.sh /home/srv/
RUN chmod +x /home/srv/run.sh

EXPOSE 8000
CMD ["./home/srv/run.sh", ""]
