# Ruby Delivery

## Stack

* `ruby 2.7.1`
* `rails 6.0.3`
* `postgres 12`
* `Docker`

## About

This API receives an incoming order, parses it and send the parsed result to other API.

## Getting started

To run the project ensure that you have docker and docker-compose installed and follow this instructions:

```bash
# add .env to project
mv .env.sample .env

# build project
docker-compose build

# start the server
docker-compose up

# in other terminal run the following to preprate DB and its deps
docker-compose exec web bin/setup

# to access the container run
docker-compose exec web bash
```

## Testing

Inside the web container run:

```bash
# lint the code
rubocop

# run test suit
rspec
```

Coverage report can be found at `coverage/index.html`.


## Sending an order

To create a new order you must send a post request containing the raw order data. e.g:

* `verb` - `POST`
* `endpoint` - `/api/v1/order`
* `body` - [spec/fixtures/raw_order.json](spec/fixtures/raw_order.json)

```bash
curl -H 'Content-Type: application/json' \
     -d @spec/fixtures/raw_order.json \
     http://localhost/api/v1/orders
```

* Possible responses:

  - 201 - Successfully created
  - 422 - Cant create order, please check your params  
  - 503 - Cant send order to remote server


## GraphQL queries

```bash
curl -H 'Content-Type: application/json' \
     -d @spec/fixtures/query.json \
     http://localhost/graphql
```
