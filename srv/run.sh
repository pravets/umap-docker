#!/usr/bin/bash

./etc/init.d/postgresql start
su umap -c "./home/srv/.local/bin/umap runserver 0.0.0.0:8000"
