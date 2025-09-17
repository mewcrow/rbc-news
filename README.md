
## Содержание

* [Требования](#требования)
* [Установка](#установка)
* [Использование](#использование)
* [Документация API](#документация-api)
* [Tecтирование](#тестирование)

## Требования
#### Тестовое задание Фронтенд (SPA)
* Вывод новостей с пагинацией ( пагинация по скроллу ), кол-во элементов на странице можно задавать через веб-интерфейс
* Обновление данных раз в N - секунд, желательно с возможностью изменения времени из веб-интерфейса
* Выделять новость ( обводка, изменение фона ) при изменении рейтинга. При повышении рейтинга - зеленым, при уменьшении - красным
* Страница вывода подробной информации о новости
* Возможность удаления новости на главной странице из списка новостей
#### Тестовое задание PHP:
* Спарсить (программно) первые 15 новостей с rbk.ru (блок "Лента новостей") и вставить в базу данных (составить структуру самому).
* Для каждой новости добавить "рейтинг", который заполнить рандомно значениями от 1 до 10.
* Сделать API для получения новостей и обновления рейтинга отдельной новости.
* Вывести список новостей в формате jsonApi, сократив текст до 200 символов в качестве описания, значение рейтинга и ссылку на полную новость. На полной новости выводить картинку, если есть в новости.

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
  docker compose run --rm --entrypoint="" laravel php artisan storage:link
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

`docker compose exec laravel php artisan test` - тест бэкенда

`docker compose exec nuxt pnpm exec playwright test` - тест фронтенда

`cd nuxt && pnpm exec playwright test --ui` - тест фронтенда в режиме ui (playwright должен быть установлен локально)