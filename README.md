# Abiscoitado
![2150688019](https://github.com/davide-almeida/abiscoitado/assets/85287720/37fb621d-3f62-4d25-b5e9-21d6e697d835)

Este projeto é uma API com um CRUD de clientes e estou desenvolvendo para aprender sobre prometheus, grafana e kubernetes.

## Stack
- Ruby 3.3
- Sinatra
- PostgreSql
- Docker
- Nginx

## Requisitos
- Docker
- Docker compose
- Make

## Como executar o projeto
```bash
make run
```
___Obs.: A aplicação estará disponível no endereço http://localhost:3001___

## Comandos disponíveis
| Descrição | Comando |
|-|-|
| Executar o projeto | `make run` |
| Acessar o console da API | `make bash` |
| Acessar logs da API | `make logs` |
| Remover TODOS os containers/volumes/redes | `make clean` |

## Endpoints
| Path | HTTP Verb | Descrição |
|-|-|-|
| /clients | GET | Lista todos os clientes e seus respectivos dados |
| /client/:id | GET | Lista dados de um cliente específico |
| /clients | POST | Cadastra um cliente |
| /client/:id | PUT | Edita um cliente |
| /client/:id | DELETE | Deleta um cliente |
