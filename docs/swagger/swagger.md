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
