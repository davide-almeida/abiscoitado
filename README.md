# Abiscoitado
![2150688019](https://github.com/davide-almeida/abiscoitado/assets/85287720/37fb621d-3f62-4d25-b5e9-21d6e697d835)

Este projeto é uma API com um CRUD de clientes e estou desenvolvendo para aprender sobre prometheus, grafana e kubernetes. Então não se surpreenda, pode ser que tudo esteja quebrando e esfarelando como na imagem acima.

## Stack
- Ruby 3.3
- Sinatra
- PostgreSql
- Docker
- Nginx
- Prometheus
- Grafana
- Kubernetes

## Requisitos
- Docker
- Docker compose
- Make
- Kubernetes

## Como executar o projeto SEM kubernetes
```bash
make run
```
___Obs.: A aplicação estará disponível no endereço http://localhost:3001___

## Como executar o projeto COM kubernetes
```bash
make k8s.apply
make k8s.port-forward
```
___Obs.: A aplicação estará disponível no endereço http://localhost:8080___

## Comandos disponíveis
| Descrição | Comando |
|-|-|
| Executar o projeto (Development) | `make run` |
| Buildar (Production) | `make setup.prod` |
| Executar o projeto (Production) | `make run.prod` |
| Acessar o console do container da API | `make bash` |
| Acessar logs do container da API | `make logs` |
| Remover TODOS os containers/volumes/redes | `make clean` |

## Comandos kubernetes
| Descrição | Comando |
|-|-|
| Aplicar todos os YML's do kubernetes | `make k8s.apply` |
| Deletar todos os services/deployments/pods do kubernetes | `make k8s.delete` |
| Criar a conexão com pod do nginx | `make k8s.port-forward` |

## Endpoints
| Path | HTTP Verb | Descrição |
|-|-|-|
| api/v1/clients | GET | Lista todos os clientes e seus respectivos dados |
| api/v1/clients/:id | GET | Lista dados de um cliente específico |
| api/v1/clients | POST | Cadastra um cliente |
| api/v1/clients/:id | PUT | Edita um cliente |
| api/v1/clients/:id | DELETE | Deleta um cliente |
