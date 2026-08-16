# CRM Demo

A small Rails CRM for maintaining people and their contact information.

## Requirements

- Ruby 3.4.10
- Rails 8.1.3.1
- PostgreSQL 15+

## Setup

```sh
bin/setup --skip-server
bin/rails server
```

The app uses the current operating-system user for local PostgreSQL peer
authentication. Alternatively, set `DATABASE_URL`.

## Tests and checks

```sh
bin/rails test
bin/rubocop
bin/brakeman --no-pager
```
