# Library

Sistema de reservas de livros de uma biblioteca.

## Principais ferramentas
- Ruby (v3.1.2)
- Rails (v7.0.1)
- Devise (v4.8.1)
- PostgreSQL
- Bootstrap
- GitHub Actions

## Setup local

- Clone o repositório
- Dentro do diretório do projeto, crie um arquivo `.env` com o conteúdo:

```
DATABASE_USER=postgres
POSTGRES_PASSWORD=shark
DATABASE_HOST=db
DATABASE_PORT=5432
```

Agora execute os comandos no terminal:

```
cd library
docker-compose pull
docker-compose build
docker-compose -f docker-compose.yml up
```

Abra um outro terminal execute:

```
bin/setup
docker compose exec rake db:setup
```

Acesse a aplicação em http://localhost:3000/

## Login

Para o login, exisem dois usuários já criados.

- **Admin**
```
e-mail: admin@app.net
senha: 123456
```

- **Membro**
```
e-mail: maria@gmail.web
senha: 654321
```
