# include .env
# export

init:up composer-install setup

up:
	@docker-compose up -d --build --remove-orphans

env:
	@docker-compose exec --user=www-data app bash

down:
	@docker-compose down

down-v:
	@docker-compose down -v

composer-install:
	@docker-compose exec --user=www-data app composer install

setup:key-gen config-cache nova-install migrate storage-link cghooks-add

key-gen:
	@docker-compose exec --user=www-data app php artisan key:generate

config-cache:
	@docker-compose exec --user=www-data app php artisan config:cache

migrate:
	@docker-compose exec --user=www-data app php artisan migrate

nova-install:
	@docker-compose exec --user=www-data app php artisan nova:install

nova-user:
	@docker-compose exec --user=www-data app php artisan nova:user

storage-link:
	@docker-compose exec --user=www-data app php artisan storage:link

doc-gen:
	@docker-compose exec --user=www-data app php artisan l5-swagger:generate

cghooks-add:
	@docker-compose exec --user=www-data app php vendor/bin/cghooks add

cghooks-update:
	@docker-compose exec --user=www-data app php vendor/bin/cghooks update
