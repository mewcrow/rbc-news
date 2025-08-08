DOCKER_COMPOSE = docker compose
DB_CONTAINER = postgres
DB_NAME = rbc-news
DB_USER = rbc-news
DB_PASSWORD = rbc-news
DUMP_FILE = docker/postgres/dump.sql

build:
	cp laravel/.env.example laravel/.env
	cp nuxt/.env.example nuxt/.env
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) run --rm --entrypoint="" laravel composer install
	$(DOCKER_COMPOSE) up -d postgres
	$(DOCKER_COMPOSE) run --rm --entrypoint="" laravel php artisan migrate:fresh --seed
	$(DOCKER_COMPOSE) run --rm --entrypoint="" laravel php artisan storage:link
	$(DOCKER_COMPOSE) run --rm nuxt pnpm install
	$(DOCKER_COMPOSE) up -d

db-dump:
	@mkdir -p docker/postgres
	$(DOCKER_COMPOSE) exec -T $(DB_CONTAINER) pg_dump --clean -U $(DB_USER) $(DB_NAME) --schema-only > $(DUMP_FILE)
	$(DOCKER_COMPOSE) exec -T postgres pg_dump -U $(DB_USER) $(DB_NAME) --data-only \
		--table=migrations \
		--table=news \
		--table=page_links \
		--table=users >> $(DUMP_FILE)
	@echo "Dump saved to $(DUMP_FILE)"

db-restore:
	cat $(DUMP_FILE) | $(DOCKER_COMPOSE) exec -T $(DB_CONTAINER) psql -U $(DB_USER) $(DB_NAME)
	@echo "Database restored from $(DUMP_FILE)"

.PHONY: rebuild db-dump db-restore