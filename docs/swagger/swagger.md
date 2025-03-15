# API Документация для E-shop Slesarka

## Общая информация

- **Версия API**: 1.0.0
- **Описание**: API для управления онлайн-магазином "Слесарка".
- **Лицензия**: [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)
- **Контакты**:
  - **Email**: skauronski@gmail.com

---

## Серверы

- **SwaggerHub API Auto Mocking**: [https://virtserver.swaggerhub.com/nonenone-b12/SlesarkaAPI/1.0.0](https://virtserver.swaggerhub.com/nonenone-b12/SlesarkaAPI/1.0.0)

---

## Теги

- **user**: Посмотреть выбранную группу товаров.
- **administrator**: Добавить новую акцию.
- **courier**: Проверить заказы на доставку.

---

## Эндпоинты

### 1. Вход пользователя в систему

- **Метод**: `POST`
- **URL**: `/login`
- **Теги**: user
- **Описание**: Аутентификация пользователя с использованием логина и пароля.
- **Параметры запроса**:
  ```json
  {
    "username": "pav@slesarka.com",
    "password": "password"
  }
Ответы:

200: Успешная аутентификация.

json
Copy
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9..."
}
400: Некорректный запрос.

401: Неверные данные для входа.

500: Внутренняя ошибка сервера.

2. Просмотр всех товаров
Метод: GET

URL: /products

Теги: user, courier, administrator

Описание: Получение списка всех товаров в магазине с поддержкой пагинации и сортировки.

Параметры запроса:

page: Номер страницы (по умолчанию: 1).

limit: Количество товаров на странице (по умолчанию: 10, максимум: 100).

sort_by: Поле для сортировки (price, name, по умолчанию: name).

order: Порядок сортировки (asc, desc, по умолчанию: desc).

Ответы:

200: Список товаров.

json
Copy
[
  {
    "id": 105,
    "name": "Саморезы",
    "price_with_discount": 1.99,
    "group": "Крепеж",
    "char_code": "SHP0001"
  }
]
500: Внутренняя ошибка сервера.

3. Добавление товара
Метод: POST

URL: /products

Теги: administrator

Описание: Добавить новый товар в каталог.

Требуемая авторизация: Bearer Token.

Параметры запроса:

json
Copy
{
  "name": "Шуруповерт",
  "price_with_discount": 1.99,
  "group": "Электро инструмент",
  "char_code": "SHP0001",
  "count_of_warehouse": 1000
}
Ответы:

201: Товар добавлен.

json
Copy
{
  "id": 1
}
400: Некорректный ввод.

409: Такой товар уже есть.

4. Просмотр товара
Метод: GET

URL: /products/{id}

Теги: user, courier, administrator

Описание: Получение информации о конкретном товаре по его ID.

Параметры пути:

id: Идентификатор товара (например, 1).

Ответы:

200: Товар найден.

json
Copy
{
  "id": 105,
  "name": "Саморезы",
  "price_with_discount": 1.99,
  "group": "Крепеж",
  "char_code": "SHP0001"
}
404: Товар не найден.

500: Внутренняя ошибка сервера.

5. Удаление товара
Метод: DELETE

URL: /products/{id}

Теги: administrator

Описание: Удаление товара по его ID.

Требуемая авторизация: Bearer Token.

Параметры пути:

id: Идентификатор товара (например, 1).

Ответы:

200: Товар удалён.

400: Некорректные данные.

404: Товар не найден.

500: Внутренняя ошибка сервера.

6. Проверить заказы на доставку
Метод: GET

URL: /orders/delivery

Теги: courier

Описание: Возвращает список заказов на доставку с возможностью фильтрации по статусу, дате и идентификатору курьера.

Параметры запроса:

status: Фильтр по статусу заказа (in_progress, delivered, pending).

date: Фильтр по дате заказа (в формате YYYY-MM-DD).

courier_id: Фильтр по идентификатору курьера.

Ответы:

200: Список заказов.

json
Copy
{
  "orders": [
    {
      "order_id": 123,
      "customer_name": "Константин Калиновский",
      "delivery_address": "ул. Янки Мавра, д. 10",
      "status": "in_progress"
    }
  ]
}
404: Заказы не найдены.

json
Copy
{
  "error": "not_found",
  "message": "orders not found"
}
Схемы данных
1. Товар (Product)
json
Copy
{
  "id": 105,
  "name": "Саморезы",
  "price_with_discount": 1.99,
  "group": "Крепеж",
  "char_code": "SHP0001"
}
2. Новый товар (ProductNew)
json
Copy
{
  "name": "Шуруповерт",
  "price_with_discount": 1.99,
  "group": "Электро инструмент",
  "char_code": "SHP0001",
  "count_of_warehouse": 1000
}
Авторизация
API использует JWT-токены для авторизации. Чтобы получить токен, выполните запрос к /login:

Запрос:

http
Copy
POST /login HTTP/1.1
Host: api.slesarka.by
Content-Type: application/json

{
  "username": "pav@slesarka.com",
  "password": "password"
}
Ответ:

json
Copy
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9..."
}
После получения токена передавайте его в заголовке Authorization:

http
Copy
Authorization: Bearer <token>
Ошибки
400: Некорректный запрос.

401: Неверные данные для входа.

404: Ресурс не найден.

409: Конфликт (например, товар уже существует).

500: Внутренняя ошибка сервера.
