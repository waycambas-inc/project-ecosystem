#!/bin/bash

cd /usr/share/app/
composer create-project laravel/laravel Galaxy
composer create-project laravel/lumen Stars

chmod -R 777 Galaxy/storage
chmod -R 777 Stars/storage

# plugin environment
cd Galaxy 
composer require jenssegers/mongodb
composer require laravel/passport
composer require phpoffice/phpspreadsheet

