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
  ```

## Paths

### `/login`

#### **POST**

- **Tags**: user
- **Summary**: Вход пользователя в систему
- **Description**: Аутентификация пользователя с использованием логина и пароля.

#### **Request Body**

- **Required**: true
- **Content**:
  - `application/json`:
    - **Schema**:
      ```json
      {
        "type": "object",
        "required": ["username", "password"],
        "properties": {
          "username": {
            "type": "string",
            "description": "Логин пользователя",
            "example": "pav@slesarka.com"
          },
          "password": {
            "type": "string",
            "format": "password",
            "description": "Пароль пользователя",
            "example": "password"
          }
        }
      }
      ```

#### **Responses**

- **200**:
  - **Description**: Успешная аутентификация
  - **Content**:
    - `application/json`:
      - **Schema**:
        ```json
        {
          "type": "object",
          "properties": {
            "token": {
              "type": "string",
              "description": "Bearer Token для аутентификации",
              "example": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEyMzQiLCJ1c2VybmFtZSI6ImJpcnNjaG5lcnNvZXZfaGVsbG9fc2VjdXJpdHkiLCJyb2xlIjoidXNlciJ9.cZL6FJ2EKzK4gSKpPVo5v6poE1T9m3MxoA3on8RHkJ2I"
            }
          }
        }
        ```

- **400**:
  - **Description**: Некорректный запрос (например, отсутствуют обязательные параметры)

- **401**:
  - **Description**: Неверные данные для входа (неправильный логин или пароль)

- **500**:
  - **Description**: Внутренняя ошибка сервера
### `/login`

#### **POST**

- **Tags**: user
- **Summary**: Вход пользователя в систему
- **Description**: Аутентификация пользователя с использованием логина и пароля.

#### **Request Body**

- **Required**: true
- **Content**:
  - `application/json`:
    - **Schema**:
      ```json
      {
        "type": "object",
        "required": ["username", "password"],
        "properties": {
          "username": {
            "type": "string",
            "description": "Логин пользователя",
            "example": "pav@slesarka.com"
          },
          "password": {
            "type": "string",
            "format": "password",
            "description": "Пароль пользователя",
            "example": "password"
          }
        }
      }
      ```

#### **Responses**

- **200**:
  - **Description**: Успешная аутентификация
  - **Content**:
    - `application/json`:
      - **Schema**:
        ```json
        {
          "type": "object",
          "properties": {
            "token": {
              "type": "string",
              "description": "Bearer Token для аутентификации",
              "example": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEyMzQiLCJ1c2VybmFtZSI6ImJpcnNjaG5lcnNvZXZfaGVsbG9fc2VjdXJpdHkiLCJyb2xlIjoidXNlciJ9.cZL6FJ2EKzK4gSKpPVo5v6poE1T9m3MxoA3on8RHkJ2I"
            }
          }
        }
        ```

- **400**:
  - **Description**: Некорректный запрос (например, отсутствуют обязательные параметры)

- **401**:
  - **Description**: Неверные данные для входа (неправильный логин или пароль)

- **500**:
  - **Description**: Внутренняя ошибка сервера

---

### `/products`

#### **GET**

- **Tags**: user, courier, administrator
- **Summary**: Просмотр всех товаров
- **Description**: Получение списка всех товаров в магазине с поддержкой пагинации и сортировки.

##### **Parameters**

- **page**:
  - **in**: query
  - **description**: Номер страницы для пагинации.
  - **required**: false
  - **schema**:
    ```json
    {
      "type": "integer",
      "minimum": 1,
      "default": 1
    }
    ```

- **limit**:
  - **in**: query
  - **description**: Количество товаров на странице.
  - **required**: false
  - **schema**:
    ```json
    {
      "type": "integer",
      "minimum": 1,
      "maximum": 100,
      "default": 10
    }
    ```

- **sort_by**:
  - **in**: query
  - **description**: Поле для сортировки (`price`, `name`).
  - **required**: false
  - **schema**:
    ```json
    {
      "type": "string",
      "enum": ["price", "name"],
      "default": "name"
    }
    ```

- **order**:
  - **in**: query
  - **description**: Порядок сортировки.
  - **required**: false
  - **schema**:
    ```json
    {
      "type": "string",
      "enum": ["asc", "desc"],
      "default": "desc"
    }
    ```

##### **Responses**

- **200**:
  - **Description**: Список товаров
  - **Content**:
    - `application/json`:
      - **Schema**:
        ```json
        {
          "type": "array",
          "items": {
            "$ref": "#/components/schemas/product"
          }
        }
        ```

- **500**:
  - **Description**: Внутренняя ошибка сервера

#### **POST**

- **Tags**: administrator
- **Summary**: Добавить товар
- **OperationId**: addProduct
- **Security**:
  - `bearerAuth`: []
- **Description**: Добавить новый товар в каталог.

##### **Request Body**

- **Required**: true
- **Content**:
  - `application/json`:
    - **Schema**:
      ```json
      {
        "$ref": "#/components/schemas/productNew"
      }
      ```
- **Description**: Новый товар для добавления в каталог.

##### **Responses**

- **201**:
  - **Description**: Товар добавлен
  - **Content**:
    - `application/json`:
      - **Schema**:
        ```json
        {
          "type": "object",
          "properties": {
            "id": {
              "type": "integer",
              "example": 1
            }
          }
        }
        ```

- **400**:
  - **Description**: Некорректный ввод

- **409**:
  - **Description**: Такой товар уже есть

---

### `/products/{id}`

#### **GET**

- **Tags**: user, courier, administrator
- **Summary**: Просмотр товара
- **Description**: Получение информации о конкретном товаре по его ID.

##### **Parameters**

- **id**:
  - **in**: path
  - **description**: Идентификатор товара
  - **required**: true
  - **schema**:
    ```json
    {
      "type": "integer",
      "example": 1
    }
    ```

##### **Responses**

- **200**:
  - **Description**: Товар найден
  - **Content**:
    - `application/json`:
      - **Schema**:
        ```json
        {
          "$ref": "#/components/schemas/product"
        }
        ```

- **404**:
  - **Description**: Товар не найден

- **500**:
  - **Description**: Внутренняя ошибка сервера

#### **DELETE**

- **Tags**: administrator
- **Summary**: Удаление товара
- **OperationId**: deleteProduct
- **Security**:
  - `bearerAuth`: []

##### **Parameters**

- **id**:
  - **in**: path
  - **description**: Идентификатор товара, который нужно удалить
  - **required**: true
  - **schema**:
    ```json
    {
      "type": "integer",
      "example": 1
    }
    ```

##### **Responses**

- **200**:
  - **Description**: Товар удален

- **400**:
  - **Description**: Некорректные данные

- **404**:
  - **Description**: Товар не найден

- **500**:
  - **Description**: Внутренняя ошибка сервера

---

### `/orders/delivery`

#### **GET**

- **Tags**: courier
- **Summary**: Проверить заказы на доставку
- **Description**: Возвращает список заказов на доставку с возможностью фильтрации по статусу, дате и идентификатору курьера.

##### **Parameters**

- **status**:
  - **in**: query
  - **description**: Фильтр по статусу заказа
  - **required**: false
  - **schema**:
    ```json
    {
      "type": "string",
      "enum": ["in_progress", "delivered", "pending"],
      "example": "in_progress"
    }
    ```

- **date**:
  - **in**: query
  - **description**: Фильтр по дате заказа (в формате YYYY-MM-DD)
  - **required**: false
  - **schema**:
    ```json
    {
      "type": "string",
      "format": "date",
      "example": "2023-10-01"
    }
    ```

- **courier_id**:
  - **in**: query
  - **description**: Фильтр по идентификатору курьера
  - **required**: false
  - **schema**:
    ```json
    {
      "type": "integer",
      "example": 1
    }
    ```

##### **Responses**

- **200**:
  - **Description**: Список заказов
  - **Content**:
    - `application/json`:
      - **Schema**:
        ```json
        {
          "type": "object",
          "properties": {
            "orders": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "order_id": {
                    "type": "integer",
                    "description": "Идентификатор заказа",
                    "example": 123
                  },
                  "customer_name": {
                    "type": "string",
                    "description": "Имя клиента",
                    "example": "Константин Калиновский"
                  },
                  "delivery_address": {
                    "type": "string",
                    "description": "Адрес доставки",
                    "example": "ул. Янки Мавра, д. 10"
                  },
                  "status": {
                    "type": "string",
                    "description": "Статус заказа",
                    "example": "in_progress"
                  }
                }
              }
            }
          }
        }
        ```

- **404**:
  - **Description**: Заказы не найдены
  - **Content**:
    - `application/json`:
      - **Schema**:
        ```json
        {
          "type": "object",
          "properties": {
            "error": {
              "type": "string",
              "example": "not_found"
            },
            "message": {
              "type": "string",
              "example": "orders not found"
            }
          }
        }
        ```

---

## Components

### Security Schemes

- **bearerAuth**:
  - **type**: http
  - **scheme**: bearer
  - **bearerFormat**: JWT

### Schemas

#### **product**

```json
{
  "type": "object",
  "required": ["id", "name", "price_with_discount", "group", "char_code"],
  "properties": {
    "id": {
      "type": "integer",
      "description": "Идентификатор товара",
      "example": 105
    },
    "name": {
      "type": "string",
      "description": "Название продукта",
      "example": "Саморезы"
    },
    "price_with_discount": {
      "type": "number",
      "format": "decimal",
      "description": "Цена товара после применения скидки",
      "example": 1.99
    },
    "group": {
      "type": "string",
      "description": "Группа товара",
      "example": "Крепеж"
    },
    "char_code": {
      "type": "string",
      "description": "Бар-код товара",
      "example": "SHP0001"
    }
  }
}
productNew
json
Copy
{
  "type": "object",
  "required": ["name", "price_with_discount", "group", "char_code", "count_of_warehouse"],
  "properties": {
    "name": {
      "type": "string",
      "description": "Название продукта",
      "example": "Шуруповерт"
    },
    "price_with_discount": {
      "type": "number",
      "format": "decimal",
      "description": "Цена товара после применения скидки",
      "example": 1.99
    },
    "group": {
      "type": "string",
      "description": "Группа товара",
      "example": "Электро инструмент"
    },
    "char_code": {
      "type": "string",
      "description": "Бар-код товара",
      "example": "SHP0001"
    },
    "count_of_warehouse": {
      "type": "integer",
      "description": "Количество товара на складе",
      "example": 1000
    }
  }
}
