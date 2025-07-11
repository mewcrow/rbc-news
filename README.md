
## Содержание

* [Требования](#требования)
* [Установка](#установка)
* [Использование](#использование)
* [Документация API](#документация-api)
* [Tecтирование](#тестирование)

## Требования

## Установка

Docker должен быть установлен.

Для контейнера nuxt в windows нужны повышенные привелегии в docker desktop, т.к. используется `network_mode: host`

```bash
  make
```

Или выполнить команды вручную

```bash
  cp laravel/.env.example laravel/.env
  cp nuxt/.env.example nuxt/.env
  docker compose build
  docker compose run --rm --entrypoint="" laravel composer install
  docker compose up -d postgres
  docker compose run --rm --entrypoint="" laravel php artisan migrate:fresh --seed
  docker compose run --rm nuxt pnpm install
  docker compose up
```

Для восстановления данных из дампа

```bash
  make db-restore
```

## Использование

* Фронтенд доступен на [http://localhost:8000](http://localhost:8000)
* Бэкенд доступен на [http://localhost:8001](http://localhost:8001)
  * [Telescope](http://localhost:8001/telescope)
  * [Horizon](http://localhost:8001/horizon)

Для редактирования рейтинга или скрытия новостей нужно войти как администратор
```
Логин: admin@local
Пароль: qwerty123
```

Для ручного запуска парсинга новостей без очередей `docker compose exec laravel` +

`crawl:rbc:links` - запускаетcя парсинг ссылок c rbc.ru

`crawl:rbc:pages` - запускается парсинг страниц по свежим ссылкам

`crawl:rbc:pages {id}` - запускается парсинг страницы по id ссылки


## Документация API

* [Swagger](http://localhost:8001/swagger)


## Тестирование

```bash
  docker compose exec laravel php artisan test
```