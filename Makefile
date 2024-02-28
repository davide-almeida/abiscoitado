CONTAINER_NAME ?= api

run:
	@docker compose down
	@docker compose up

bash:
	@docker compose exec $(CONTAINER_NAME) bash

logs:
	@docker compose logs -f $(CONTAINER_NAME)

clean:
	@docker compose down
	@docker system prune --volumes --force
	@docker network prune

setup.prod:
	@docker build -t ghcr.io/davide-almeida/abiscoitado --target production .

run.prod:
	@docker compose -f docker-compose-prod.yml up