#!/bin/bash

# Asegúrate de que se detengan en caso de error
set -e

# Instalar dependencias de Composer
echo "Instalando dependencias de Composer..."
composer install --no-dev --optimize-autoloader

# Ejecutar migraciones
echo "Ejecutando migraciones..."
php artisan migrate --force

# Ejecutar seeding si es necesario
echo "Ejecutando seeders..."
php artisan db:seed --force

# Cachear configuraciones
echo "Cacheando configuraciones..."
php artisan config:cache

# Cachear rutas
echo "Cacheando rutas..."
php artisan route:cache

# Listar rutas para verificar que todo está en orden
echo "Listando rutas..."
php artisan route:list

# Iniciar el servidor de Laravel en el puerto 80
echo "Iniciando el servidor..."
php artisan serve --host=0.0.0.0 --port=80
