#!/bin/bash

cd /usr/share/app/
composer create-project laravel/laravel Galaxy

cd Galaxy
chmod -R 777 storage
