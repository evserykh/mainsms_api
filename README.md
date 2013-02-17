## Использование

Добавить в Gemfile:
```ruby
gem 'mainsms_api', :git => 'git://github.com/evserykh/mainsms_api.git'
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

Для объекта _response_ доступны методы, возвращаемые в ответе сервера. Например, обработать статус ответа можно так:
```ruby
if response.status == 'success'
  #code
end
```
Подробнее от ответе сервера можно прочитать [тут](http://mainsms.ru/home/mainapi#send_api)

### Запрос статуса сообщения
```ruby
status = MainsmsApi::Status.new(:message_ids => ['1', '2'])
response = status.check
```
Параметры:
* __message_ids__ - идентификаторы сообщений

Подробнее [тут](http://mainsms.ru/home/mainapi#status_api)

### Определение цены рассылки
```ruby
price = MainsmsApi::Price.new(:message => 'MESSAGE', :recipients => ['89112223344'])
response = price.calculate
```
Параметры:
* __message__ - текст сообщения
* __recipients__ - массив с номерами получателей

Подробнее [тут](http://mainsms.ru/home/mainapi#price_api)

### Запрос баланса
```ruby
balance = MainsmsApi::Balance.new
response = balance.check
```
Подробнее [тут](http://mainsms.ru/home/mainapi#balance_api)
 
### Запрос информации о номерах
```ruby
info = MainsmsApi::Info.new(:phones => ['89112223344'])
response = info.get
```
Параметры:
* __phones__ - массив номеров

Подробнее [тут](http://mainsms.ru/home/mainapi#info_api)
