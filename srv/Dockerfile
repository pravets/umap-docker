
FROM ubuntu:20.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y build-essential autoconf python3.8 python3.8-dev python3-pip\ 
	python3.8-venv wget nginx uwsgi uwsgi-plugin-python3 docker \ 
	postgresql-server-dev-12 git libxml2-dev \
	libxslt1-dev zlib1g-dev libgdal26

RUN mkdir -p /home/srv/ && mkdir -p /etc/umap

RUN useradd -N umap -d /home/srv/

RUN chown umap:users /etc/umap && chown umap:users /home/srv/

RUN su umap -c "python3 -m venv /home/srv/venv && chmod +x /home/srv/venv/bin/activate"

COPY umap.conf /etc/umap/
COPY run.sh /home/srv/
RUN chmod +x /home/srv/run.sh

RUN /home/srv/venv/bin/activate && pip3 install umap-project && umap collectstatic

VOLUME ["/home/srv", "/etc/umap"]

EXPOSE 8000
CMD /home/srv/venv/bin/activate && /home/srv/run.sh
