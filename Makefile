CONTAINER_NAME ?= api

run:
	@docker compose down
	@docker compose up

bash:
	@docker compose exec $(CONTAINER_NAME) bash

logs:
	@docker compose logs -f $(CONTAINER_NAME)

healthcheck.prometheus:
	@curl http://localhost:9090/-/ready

clean:
	@docker compose down
	@docker system prune --volumes --force
	@docker network prune

setup.prod:
	@docker build -t ghcr.io/davide-almeida/abiscoitado --target production .

run.prod:
	@docker compose -f docker-compose-prod.yml up

clients.create:
	@if [ -z "$(NAME)" ]; then \
		echo "Erro: É necessário fornecer um nome de cliente. Use 'make client.create NAME=<nome do cliente>'"; \
	else \
		curl -X POST -H 'content-type: application/json' -d '{ "name": "$(NAME)", "address": "Endereço teste", "phone_number": "(55)55555555", "email": "clienteteste@cliente.com.br" }' localhost:3001/api/v1/clients; \
	fi

clients.list:
	@curl localhost:3001/api/v1/clients | jq

clients.get:
	@if [ -z "$(ID)" ]; then \
		echo "Erro: É necessário fornecer um ID de cliente. Use 'make client.get ID=<id do cliente>'"; \
	else \
		curl localhost:3001/api/v1/clients/$(ID) | jq; \
	fi

clients.delete:
	@if [ -z "$(ID)" ]; then \
		echo "Erro: É necessário fornecer um ID de cliente. Use 'make client.delete ID=<id do cliente>'"; \
	else \
		curl -X DELETE localhost:3001/api/v1/clients/$(ID); \
	fi