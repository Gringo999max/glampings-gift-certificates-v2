# Руководство по интеграции React SPA в OpenCart 2.3

## Обзор

Это руководство описывает процесс интеграции React SPA приложения для продажи подарочных сертификатов в OpenCart 2.3.

**Версия:** v2.0 MVP
**Дата:** 2025-11-24
**Frontend разработчик:** Claude AI
**Backend разработчик:** Тимур

---

## 1. Структура проекта

```
glampings-gift-certificates-v2/
├── src/                          # Исходный код React приложения
│   ├── components/               # React компоненты
│   ├── utils/                    # Утилиты (включая checkoutService.ts)
│   └── assets/                   # Изображения (77MB PNG)
├── dist/                         # Production build (создается после npm run build)
│   ├── index.html               # Главный HTML файл
│   ├── assets/                  # Скомпилированные JS/CSS/изображения
│   │   ├── gift-app-[hash].js  # Основной бандл приложения
│   │   ├── react-vendor-[hash].js  # React библиотеки
│   │   ├── ui-radix-[hash].js  # UI компоненты
│   │   └── [name]-[hash].css   # Стили
│   └── manifest.json            # Манифест со списком файлов
├── gift.tpl                     # OpenCart шаблон
├── package.json                 # NPM зависимости
├── vite.config.ts              # Конфигурация сборки
└── tsconfig.json               # TypeScript конфигурация
```

---

## 2. Backend требования

### 2.1 OpenCart модуль: Gift Certificate

Создайте модуль в OpenCart для обработки подарочных сертификатов:

**Путь:** `catalog/controller/gift/`

#### Файл: `catalog/controller/gift/checkout.php`

```php
<?php
class ControllerGiftCheckout extends Controller {

    /**
     * Главная страница с React приложением
     */
    public function index() {
        // Загружаем шаблон с React приложением
        $this->response->setOutput($this->load->view('gift/gift', array(
            'header' => $this->load->controller('common/header'),
            'footer' => $this->load->controller('common/footer'),
            'currency' => $this->session->data['currency'],
        )));
    }

    /**
     * API endpoint для обработки заказа
     * POST /index.php?route=gift/checkout
     */
    public function checkout() {
        // Проверяем метод запроса
        if ($this->request->server['REQUEST_METHOD'] !== 'POST') {
            $this->response->setOutput(json_encode([
                'error' => 'Invalid request method'
            ]));
            return;
        }

        // Получаем JSON данные
        $json = file_get_contents('php://input');
        $data = json_decode($json, true);

        // Валидация данных
        if (!$this->validateCheckoutData($data)) {
            $this->response->setOutput(json_encode([
                'error' => 'Invalid data'
            ]));
            return;
        }

        // Создаем заказ
        $order_id = $this->createOrder($data);

        if (!$order_id) {
            $this->response->setOutput(json_encode([
                'error' => 'Failed to create order'
            ]));
            return;
        }

        // Генерируем форму для оплаты Tinkoff
        $payment_form = $this->generateTinkoffForm($order_id, $data['totals']['grand_total']);

        // Возвращаем HTML форму для автоматической отправки
        $this->response->addHeader('Content-Type: text/html; charset=utf-8');
        $this->response->setOutput($payment_form);
    }

    /**
     * Валидация данных заказа
     */
    private function validateCheckoutData($data) {
        // Проверяем обязательные поля
        if (empty($data['certificates']) || !is_array($data['certificates'])) {
            return false;
        }

        if (empty($data['customer']['firstname']) ||
            empty($data['customer']['telephone']) ||
            empty($data['customer']['email'])) {
            return false;
        }

        if (empty($data['totals'])) {
            return false;
        }

        return true;
    }

    /**
     * Создание заказа в БД
     */
    private function createOrder($data) {
        $this->load->model('gift/certificate');

        // Создаем заказ
        $order_data = array(
            'customer_id' => $this->customer->isLogged() ? $this->customer->getId() : 0,
            'customer_group_id' => $this->customer->isLogged() ? $this->customer->getGroupId() : 1,
            'firstname' => $data['customer']['firstname'],
            'lastname' => $data['customer']['lastname'],
            'email' => $data['customer']['email'],
            'telephone' => $data['customer']['telephone'],
            'payment_method' => 'Tinkoff',
            'payment_code' => 'tinkoff',
            'shipping_method' => $this->getShippingMethodName($data['delivery']['method']),
            'total' => $data['totals']['grand_total'],
            'order_status_id' => 1, // Pending
            'comment' => $data['customer']['comment'],
            'language_id' => $this->config->get('config_language_id'),
            'currency_id' => $this->currency->getId($this->session->data['currency']),
            'currency_code' => $this->session->data['currency'],
            'currency_value' => $this->currency->getValue($this->session->data['currency']),
            'ip' => $this->request->server['REMOTE_ADDR'],
            'user_agent' => $this->request->server['HTTP_USER_AGENT'],
            'date_added' => date('Y-m-d H:i:s'),
        );

        // Добавляем адрес доставки если есть
        if ($data['delivery']['needed']) {
            $order_data['shipping_address'] = json_encode($data['delivery']['address']);
        }

        // Создаем заказ
        $order_id = $this->model_gift_certificate->createOrder($order_data);

        // Добавляем сертификаты
        foreach ($data['certificates'] as $cert) {
            $this->model_gift_certificate->addCertificateToOrder($order_id, $cert);
        }

        return $order_id;
    }

    /**
     * Генерация формы для Tinkoff
     */
    private function generateTinkoffForm($order_id, $amount) {
        // Здесь должна быть интеграция с Tinkoff API
        // Возвращаем HTML форму для автоматической отправки

        $terminal_key = $this->config->get('tinkoff_terminal_key');
        $password = $this->config->get('tinkoff_password');

        // Генерируем токен и данные для Tinkoff
        $payment_data = array(
            'TerminalKey' => $terminal_key,
            'Amount' => $amount * 100, // в копейках
            'OrderId' => $order_id,
            'Description' => 'Оплата подарочного сертификата',
            'SuccessURL' => $this->url->link('gift/success', 'order_id=' . $order_id),
            'FailURL' => $this->url->link('gift/fail', 'order_id=' . $order_id),
        );

        // Генерируем HTML форму
        $html = '<!DOCTYPE html><html><head><meta charset="utf-8"></head><body>';
        $html .= '<form id="tinkoff-form" method="post" action="https://securepay.tinkoff.ru/new">';

        foreach ($payment_data as $key => $value) {
            $html .= '<input type="hidden" name="' . $key . '" value="' . $value . '">';
        }

        $html .= '</form>';
        $html .= '<script>document.getElementById("tinkoff-form").submit();</script>';
        $html .= '</body></html>';

        return $html;
    }

    /**
     * Получить название метода доставки
     */
    private function getShippingMethodName($method) {
        $methods = array(
            'email' => 'Email',
            'pickup' => 'Самовывоз',
            'courier_express' => 'Курьер (экспресс)',
            'courier_standard' => 'Курьер (стандарт)',
            'pvz' => 'Пункт выдачи заказов'
        );

        return isset($methods[$method]) ? $methods[$method] : 'Unknown';
    }
}
?>
```

#### Файл: `catalog/model/gift/certificate.php`

```php
<?php
class ModelGiftCertificate extends Model {

    /**
     * Создать заказ в БД
     */
    public function createOrder($data) {
        $sql = "INSERT INTO `" . DB_PREFIX . "order` SET ";
        $sql .= "customer_id = '" . (int)$data['customer_id'] . "', ";
        $sql .= "customer_group_id = '" . (int)$data['customer_group_id'] . "', ";
        $sql .= "firstname = '" . $this->db->escape($data['firstname']) . "', ";
        $sql .= "lastname = '" . $this->db->escape($data['lastname']) . "', ";
        $sql .= "email = '" . $this->db->escape($data['email']) . "', ";
        $sql .= "telephone = '" . $this->db->escape($data['telephone']) . "', ";
        $sql .= "payment_method = '" . $this->db->escape($data['payment_method']) . "', ";
        $sql .= "payment_code = '" . $this->db->escape($data['payment_code']) . "', ";
        $sql .= "shipping_method = '" . $this->db->escape($data['shipping_method']) . "', ";
        $sql .= "total = '" . (float)$data['total'] . "', ";
        $sql .= "order_status_id = '" . (int)$data['order_status_id'] . "', ";
        $sql .= "comment = '" . $this->db->escape($data['comment']) . "', ";
        $sql .= "language_id = '" . (int)$data['language_id'] . "', ";
        $sql .= "currency_id = '" . (int)$data['currency_id'] . "', ";
        $sql .= "currency_code = '" . $this->db->escape($data['currency_code']) . "', ";
        $sql .= "currency_value = '" . (float)$data['currency_value'] . "', ";
        $sql .= "ip = '" . $this->db->escape($data['ip']) . "', ";
        $sql .= "user_agent = '" . $this->db->escape($data['user_agent']) . "', ";
        $sql .= "date_added = '" . $this->db->escape($data['date_added']) . "'";

        $this->db->query($sql);

        return $this->db->getLastId();
    }

    /**
     * Добавить сертификат к заказу
     */
    public function addCertificateToOrder($order_id, $certificate) {
        $sql = "INSERT INTO `" . DB_PREFIX . "gift_certificate` SET ";
        $sql .= "order_id = '" . (int)$order_id . "', ";
        $sql .= "category = '" . $this->db->escape($certificate['certificate_category']) . "', ";
        $sql .= "theme = '" . $this->db->escape($certificate['theme']) . "', ";
        $sql .= "format = '" . $this->db->escape($certificate['format']) . "', ";
        $sql .= "design_id = '" . (int)$certificate['design_id'] . "', ";
        $sql .= "amount = '" . (float)$certificate['amount'] . "', ";
        $sql .= "wishes = '" . $this->db->escape($certificate['wishes']) . "', ";
        $sql .= "recipient_name = '" . $this->db->escape($certificate['recipient_name']) . "', ";
        $sql .= "validity_start = '" . $this->db->escape($certificate['validity_start']) . "', ";
        $sql .= "validity_date = '" . $this->db->escape($certificate['validity_date']) . "', ";
        $sql .= "date_added = NOW()";

        $this->db->query($sql);

        return $this->db->getLastId();
    }
}
?>
```

---

## 3. Структура базы данных

### Таблица: `gift_certificate`

```sql
CREATE TABLE IF NOT EXISTS `gift_certificate` (
  `certificate_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `category` enum('thematic','nominal') NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `format` enum('electronic','envelope','gift_box') NOT NULL,
  `design_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `wishes` text,
  `recipient_name` varchar(255) NOT NULL,
  `validity_start` varchar(50) NOT NULL,
  `validity_date` datetime DEFAULT NULL,
  `code` varchar(100) UNIQUE DEFAULT NULL COMMENT 'Уникальный код сертификата',
  `status` enum('pending','active','used','expired') DEFAULT 'pending',
  `date_added` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`certificate_id`),
  KEY `order_id` (`order_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

---

## 4. Размещение файлов в OpenCart

### 4.1 Frontend файлы

1. **Скомпилировать React приложение:**
   ```bash
   cd /path/to/glampings-gift-certificates-v2
   npm install
   npm run build
   ```

2. **Скопировать dist/ в OpenCart:**
   ```bash
   # Создать папку для React приложения
   mkdir -p /path/to/opencart/catalog/view/theme/default/dist/

   # Копировать все файлы из dist/
   cp -r dist/* /path/to/opencart/catalog/view/theme/default/dist/
   ```

3. **Скопировать gift.tpl шаблон:**
   ```bash
   cp gift.tpl /path/to/opencart/catalog/view/theme/default/template/gift/gift.tpl
   ```

### 4.2 Backend файлы

1. **Создать контроллер:**
   ```bash
   mkdir -p /path/to/opencart/catalog/controller/gift/
   # Создать файл checkout.php (см. раздел 2.1)
   ```

2. **Создать модель:**
   ```bash
   mkdir -p /path/to/opencart/catalog/model/gift/
   # Создать файл certificate.php (см. раздел 2.1)
   ```

---

## 5. Структура данных API

### 5.1 POST Request: `/index.php?route=gift/checkout`

**Headers:**
```
Content-Type: application/json
```

**Request Body:**
```json
{
  "certificates": [
    {
      "certificate_category": "thematic",
      "theme": "Романтический отдых",
      "format": "electronic",
      "design_id": 1,
      "amount": 10000,
      "wishes": "С днем рождения!",
      "recipient_name": "Иван Иванов",
      "validity_start": "immediate",
      "validity_date": null
    }
  ],
  "customer": {
    "firstname": "Петр",
    "lastname": "Петров",
    "telephone": "+79991234567",
    "email": "petr@example.com",
    "comment": "Позвонить перед доставкой"
  },
  "delivery": {
    "needed": true,
    "method": "courier_express",
    "cost": 500,
    "address": {
      "city": "Москва",
      "street": "ул. Ленина, д. 1",
      "apartment": "кв. 10",
      "zipcode": "123456"
    },
    "pickup_point": null
  },
  "totals": {
    "certificates_total": 10000,
    "delivery_total": 500,
    "grand_total": 10500
  },
  "customerDate": "2025-11-24",
  "source": "website"
}
```

### 5.2 Response

**Success:** HTML форма с автоматической отправкой в Tinkoff

```html
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"></head>
<body>
  <form id="tinkoff-form" method="post" action="https://securepay.tinkoff.ru/new">
    <input type="hidden" name="TerminalKey" value="...">
    <input type="hidden" name="Amount" value="1050000">
    <input type="hidden" name="OrderId" value="12345">
    <!-- ... другие поля -->
  </form>
  <script>document.getElementById("tinkoff-form").submit();</script>
</body>
</html>
```

**Error:** JSON с описанием ошибки

```json
{
  "error": "Invalid data"
}
```

---

## 6. Настройка конфигурации

### 6.1 OpenCart настройки

В админ-панели OpenCart добавьте настройки для Tinkoff:

```
Система → Настройки → Магазин → Оплата
```

- `tinkoff_terminal_key` - Terminal Key от Tinkoff
- `tinkoff_password` - Пароль от Tinkoff API

### 6.2 Роуты OpenCart

Убедитесь что роуты настроены правильно:

```
/index.php?route=gift/checkout → главная страница с React
/index.php?route=gift/checkout/checkout → API endpoint (POST)
/index.php?route=gift/success → страница успешной оплаты
/index.php?route=gift/fail → страница неудачной оплаты
```

---

## 7. React Router и структура URL

### 7.1 Обзор

Приложение использует React Router v6 для client-side навигации. Это позволяет:
- Навигация без перезагрузки страницы
- Прямой доступ к любой странице по URL
- Browser history support (кнопки Назад/Вперед)
- SEO-friendly URLs

### 7.2 Структура маршрутов

#### Главные страницы
```
/ → Главная страница (с секциями сертификатов)
/delivery → Доставка и оплата
/reviews → Отзывы клиентов
/how-it-works → Как это работает
/corporate → Корпоративные подарки (B2B)
/about → О нас
/contacts → Контакты
/activate → Активация сертификата
```

#### Страницы типов сертификатов
```
/certificates/pet-friendly → Отдых с питомцами
/certificates/romantic → Романтические сертификаты (TODO)
/certificates/family → Семейный отдых (TODO)
/certificates/extreme → Экстремальный отдых (TODO)
/certificates/relax → Релакс и SPA (TODO)
/certificates/nominal → Номинальные сертификаты (TODO)
```

#### 404 обработка
```
/* → Редирект на главную страницу (/)
```

### 7.3 Конфигурация .htaccess для SPA

Для правильной работы React Router в production необходим файл `.htaccess`:

**Путь:** `public/.htaccess`

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteCond %{REQUEST_FILENAME} !-l
  RewriteRule . /index.html [L]
</IfModule>
```

**Важно:** Этот файл должен быть скопирован в корень папки с React приложением в OpenCart:
```bash
cp public/.htaccess /path/to/opencart/catalog/view/theme/default/dist/.htaccess
```

### 7.4 Lazy Loading страниц

Все страницы кроме главной загружаются динамически (lazy loading) с помощью `React.lazy()` и `Suspense`:

```typescript
// Пример из App.tsx
const DeliveryPaymentPage = React.lazy(
  () => import("./components/DeliveryPaymentPage")
);

// Использование
<Route
  path="/delivery"
  element={
    <Suspense fallback={<LoadingSpinner />}>
      <DeliveryPaymentPage />
    </Suspense>
  }
/>
```

**Преимущества:**
- Уменьшение размера начального бандла
- Быстрая загрузка главной страницы
- Загрузка страниц по требованию

### 7.5 Навигация в компонентах

#### Header.tsx и Footer.tsx
Все ссылки используют компонент `Link` из react-router-dom:

```typescript
import { Link } from 'react-router-dom';

<Link to="/delivery">Доставка и оплата</Link>
<Link to="/reviews">Отзывы</Link>
```

#### Certificate Cards
Карточки сертификатов поддерживают навигацию через prop `to`:

```typescript
<GlampingCard
  {...certificateData}
  to="/certificates/pet-friendly"
/>
```

### 7.6 Интеграция с OpenCart

При интеграции в OpenCart убедитесь что:

1. **Все статические ресурсы доступны:**
   - JS бандлы из `dist/assets/*.js`
   - CSS файлы из `dist/assets/*.css`
   - Изображения из `dist/assets/*.png`, `*.jpg`, `*.webp`

2. **Apache/Nginx настроен для SPA:**
   - `.htaccess` работает (Apache `mod_rewrite` включен)
   - Или эквивалентная конфигурация для Nginx

3. **Базовый URL настроен:**
   - В `vite.config.ts` указан `base: './'` для относительных путей
   - Все импорты используют относительные пути

### 7.7 Тестирование маршрутов

После развертывания проверьте все маршруты:

```bash
# Главная страница
curl -I https://your-domain.com/

# Страницы
curl -I https://your-domain.com/delivery
curl -I https://your-domain.com/reviews
curl -I https://your-domain.com/how-it-works
curl -I https://your-domain.com/corporate
curl -I https://your-domain.com/about
curl -I https://your-domain.com/activate

# Сертификаты
curl -I https://your-domain.com/certificates/pet-friendly

# 404 → должен возвращать главную страницу
curl -I https://your-domain.com/nonexistent-page
```

Все URL должны возвращать `200 OK` и загружать `index.html`.

---

## 8. Тестирование

### 8.1 Локальное тестирование

1. **Запуск dev сервера:**
   ```bash
   npm run dev
   ```
   Откройте http://localhost:3000

2. **Тестовые данные:**
   - Корзина пустая при запуске (тестовые данные удалены)
   - Добавьте сертификат через интерфейс
   - Заполните форму заказа
   - Проверьте отправку данных в Network tab

### 8.2 Production тестирование

1. **Build приложения:**
   ```bash
   npm run build
   ```

2. **Проверка файлов:**
   - `dist/index.html` существует
   - `dist/manifest.json` содержит список файлов
   - `dist/assets/` содержит JS/CSS/изображения

3. **Интеграционное тестирование:**
   - Откройте `/index.php?route=gift/checkout` на сайте
   - Проверьте загрузку React приложения
   - Добавьте сертификат в корзину
   - Оформите заказ
   - Проверьте создание заказа в БД
   - Проверьте редирект на Tinkoff

---

## 9. Возможные проблемы и решения

### 9.1 React приложение не загружается

**Проблема:** Белый экран, ошибки в консоли

**Решение:**
- Проверьте пути к файлам в gift.tpl
- Убедитесь что файлы скопированы в правильную папку
- Проверьте права доступа к файлам (chmod 644)
- Проверьте manifest.json

### 9.2 API не отвечает

**Проблема:** Ошибка 404 при отправке формы

**Решение:**
- Проверьте роут в URL: `/index.php?route=gift/checkout`
- Убедитесь что контроллер создан в правильной папке
- Проверьте права доступа к файлам PHP
- Проверьте логи OpenCart: `system/storage/logs/error.log`

### 9.3 CORS ошибки

**Проблема:** CORS policy блокирует запросы

**Решение:**
- Убедитесь что React и OpenCart на одном домене
- Добавьте CORS заголовки в PHP контроллер если нужно
- Проверьте настройки `.htaccess`

### 9.4 Изображения не загружаются

**Проблема:** Ошибки 404 для изображений

**Решение:**
- Проверьте что папка `dist/assets/` скопирована полностью
- Проверьте пути в vite.config.ts (base: './')
- Проверьте права доступа к папке assets/

---

## 10. Оптимизация (Post-MVP)

### 10.1 Изображения

**Текущее состояние:** 77MB PNG файлов (40 изображений)

**Рекомендации:**
- Конвертировать PNG → WebP (экономия ~70%)
- Использовать responsive images
- Настроить lazy loading
- CDN для статики

### 10.2 Производительность

- Настроить кеширование в Nginx/Apache
- Включить Gzip/Brotli сжатие
- Оптимизировать code splitting (уже настроено в vite.config.ts)
- Использовать Service Worker для PWA

### 10.3 Безопасность

- Добавить CSRF токены
- Валидация данных на сервере
- Санитизация пользовательского ввода
- Rate limiting для API
- HTTPS обязательно

---

## 11. Контакты и поддержка

**Frontend разработчик:** Claude AI
**Backend разработчик:** Тимур
**Репозиторий:** https://github.com/Gringo999max/glampings-gift-certificates-v2

**Технологии:**
- React 18.3.1
- TypeScript 5.6.3
- Vite 6.3.5
- OpenCart 2.3
- Tinkoff Payment Gateway

---

## Чеклист интеграции

- [ ] Создать таблицу `gift_certificate` в БД
- [ ] Создать контроллер `catalog/controller/gift/checkout.php`
- [ ] Создать модель `catalog/model/gift/certificate.php`
- [ ] Скопировать dist/ в `catalog/view/theme/default/dist/`
- [ ] Скопировать gift.tpl в `catalog/view/theme/default/template/gift/`
- [ ] Настроить Tinkoff Terminal Key и Password
- [ ] Протестировать создание заказа
- [ ] Протестировать оплату через Tinkoff
- [ ] Проверить сохранение в БД
- [ ] Настроить email уведомления
- [ ] Настроить генерацию PDF сертификатов
- [ ] Развернуть на production сервере

---

**Версия документа:** 1.0
**Дата создания:** 2025-11-24
**Статус:** MVP Ready
