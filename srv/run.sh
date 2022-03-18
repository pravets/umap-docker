#!/usr/bin/bash

umap migrate

su umap -c "umap runserver 0.0.0.0:8000"
