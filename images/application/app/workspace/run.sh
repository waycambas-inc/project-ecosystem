#!/bin/bash

cd /usr/share/app/
composer create-project laravel/laravel Galaxy
composer create-project laravel/laravel Stars

chmod -R 777 Galaxy/storage
chmod -R 777 Stars/storage

# plugin environment
composer require jenssegers/mongodb