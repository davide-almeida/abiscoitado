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

## Comandos disponíveis
| Descrição | Comando |
|-|-|
| Executar o projeto | `make run` |
| Acessar o console da API | `make bash` |
| Acessar logs da API | `make logs` |
| Remover TODOS os containers/volumes/redes | `make clean` |

## Rotas
| Rota | Descrição |
|-|-|
| http://localhost:3001 | - |
