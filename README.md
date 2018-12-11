[![Gem Version](https://badge.fury.io/rb/mainsms_api.svg)](http://badge.fury.io/rb/mainsms) [![Build Status](https://travis-ci.org/evserykh/mainsms_api.svg?branch=master)](https://travis-ci.org/evserykh/mainsms)
***

## Использование

Добавить в Gemfile:
```ruby
gem 'mainsms_api'
```

### Настройка
При использовании в Rails приложении запустить генератор
```ruby
bundle exec rails g mainsms_api:install
```
и указать настройки в __config/mainsms.yml__

Если gem используется не в Rails приложении, то можно задать настройки следующим образом:

```ruby
MainsmsApi::Configuration.setup project: 'PROJECT', api_key: 'SECRET'
```

### Отправка сообщения
```ruby
message = MainsmsApi::Message.new(sender: 'SENDER', message: 'MESSAGE', recipients: ['89112223344'])
response = message.deliver
```
Параметры:
* __sender__ - имя отправителя
* __message__ - текст сообщения
* __recipients__ - массив с номерами получателей
* __run_at__ - время отправки
* __test__ - тестовый режим ('1' для включения)

Объект _response_ является экземпляром класса [Hashie::Mash](https://github.com/intridea/hashie#mash). Для него доступны методы, возвращаемые в ответе сервера. Например, обработать статус ответа можно так:
```ruby
if response.status == 'success'
  #code
end
```
или
```ruby
if response['status'] == 'success'
  #code
end
```
Подробнее об ответе сервера можно прочитать [тут](http://mainsms.ru/home/api/main#send)

### Запрос статуса сообщения
```ruby
status = MainsmsApi::Status.new(:message_ids => ['1', '2'])
response = status.check
```
Параметры:
* __message_ids__ - идентификаторы сообщений

Подробнее [тут](http://mainsms.ru/home/api/main#status)

### Отмена запланированного сообщения
```ruby
messages = MainsmsApi::Cancel.new(:message_ids => ['1', '2'])
response = messages.cancel
```
Параметры:
* __message_ids__ - идентификаторы сообщений

Подробнее [тут](http://mainsms.ru/home/api/main#cancel)

### Определение цены
```ruby
price = MainsmsApi::Price.new(:message => 'MESSAGE', :recipients => ['89112223344'])
response = price.calculate
```
Параметры:
* __message__ - текст сообщения
* __recipients__ - массив с номерами получателей

Подробнее [тут](http://mainsms.ru/home/api/main#price)

### Запрос баланса
```ruby
balance = MainsmsApi::Balance.new
response = balance.check
```
Подробнее [тут](http://mainsms.ru/home/api/main#balance)

### Запрос информации о номерах
```ruby
info = MainsmsApi::Info.new(:phones => ['89112223344'])
response = info.get
```
Параметры:
* __phones__ - массив номеров

Подробнее [тут](http://mainsms.ru/home/api/main#info)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/evserykh/mainsms_api/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

