# TUTUAPP
## Описание
Приложение «TUTUAPP» — управления железнодорожным транспортом на rails 5.0.1

Рассчитано на работу с Heroku.

Предназначено для освоения работы с аутентификацией,
авторизацией, гемом devise, фреймворком bootstrap,
реализована отправка почты.

## Демо
[Open](https://tutuapp.herokuapp.com/)

## Админка
`email: progsergo@gmail.com`  
 `password: 123456`


## Установка
Для разворачивания своей копии клонируйте git репозиторий (зеленая кнопочка в правом верхнем углу на гитхабе), командой `git clone`, залейте на свое приложение на Heroku (или создайте новое `heroku create`). Также поправьте урл сайта в `production.rb`. Обязательно пропишите миграции на heroku командой `heroku run bundle exec rake db:migrate`.

Для работы почты на хероку должен быть подключен SendGrid.
