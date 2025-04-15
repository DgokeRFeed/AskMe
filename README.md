# Веб-приложение "AskMe"

Социальная сеть, в которой пользователи могут задавать друг другу вопросы и отвечать на них. Является клоном некогда популярного сервиса "Ask.fm".
При создании приложения для использования аватарок был использован Gravatar API.

## Как развернуть приложение на локальной машине
Требуется
```
Ruby 3.1.2
Rails 7.0.3
```
Нужно установить необходимые гемы и подготовить базу данных
```
bundle install
bundle exec rails db:migrate
```
После можете запустить сервер командой
```
bundle exec rails s
```
