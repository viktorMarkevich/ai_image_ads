SHELL := /bin/bash

setup:
	docker compose run --rm web bin/setup

up:
	docker compose up --build

bash:
	docker compose exec web bash

restart:
	docker compose down && docker compose up --build

rails:
	docker compose run --rm web bin/rails $(ARGS)

console:
	docker compose run --rm web bin/rails console

test:
	docker compose run --rm web bin/rails test
