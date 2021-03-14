#!/usr/bin/env bash
while !</dev/tcp/factory-db/5432; do sleep 1; done;
flask db migrate
flask db upgrade
gunicorn -b 0.0.0.0:5002 "app:create_app()"
