#!/bin/bash

# Stop and remove existing process if running
pm2 stop $CONTAINER_NAME
pm2 delete $CONTAINER_NAME

# Pull latest code from repository
cd ~/FarmersMarket
git pull origin main

# Install dependencies
bundle install
yarn install

# Start application using pm2
SECRET_KEY_BASE=$SECRET_KEY_BASE RAILS_ENV=production pm2 start --name $CONTAINER_NAME -- bundle exec rails server -p 3000
