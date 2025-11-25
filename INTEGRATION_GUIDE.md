# Руководство по интеграции React SPA в OpenCart 2.3

## Обзор

Это руководство описывает процесс интеграции React SPA приложения для продажи подарочных сертификатов в OpenCart 2.3.

**Версия:** v3.0 Multi-Template
**Дата:** 2025-11-25
**Frontend разработчик:** Claude AI
**Backend разработчик:** Тимур

---

## ⚠️ КРИТИЧЕСКОЕ ИЗМЕНЕНИЕ АРХИТЕКТУРЫ (v3.0)

**Дата изменения:** 2025-11-25

После обсуждения с backend разработчиком (Тимур) выяснилось, что **React SPA с клиентским роутингом НЕ подходит** для OpenCart 2.3.

**Новая архитектура:**
- ✅ **Главная страница** - React SPA (с корзиной и формой заказа)
- ✅ **Все остальные страницы** - статичные HTML .tpl шаблоны
- ✅ **14 отдельных .tpl файлов** для OpenCart
- ✅ **Локальные изображения** (не figma:asset/)
- ✅ **Shared header/footer** для всех страниц

**Подробная инструкция по интеграции:** См. `opencart-templates/README_FOR_TIMUR.md`

---

## 1. Структура проекта

```
glampings-gift-certificates-v2/
├── src/                          # Исходный код React приложения (только главная страница)
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
├── opencart-templates/          # ⭐ OpenCart шаблоны (v3.0)
│   ├── shared/                  # Общие компоненты
│   │   ├── header.tpl          # Хедер для всех страниц
│   │   └── footer.tpl          # Футер для всех страниц
│   ├── css/                     # CSS файлы
│   │   ├── gift_common.css     # Общие стили
│   │   ├── gift_delivery.css   # Стили доставки
│   │   └── gift_certificate_type.css  # Стили типов сертификатов
│   ├── images/                  # Локальные изображения
│   │   ├── hero/               # Hero изображения
│   │   ├── certificates/       # Изображения сертификатов
│   │   ├── designs/            # Дизайны
│   │   └── icons/              # Иконки
│   ├── gift.tpl                 # Главная (React SPA)
│   ├── gift_delivery.tpl        # Доставка и оплата
│   ├── gift_pet_friendly.tpl    # Pet-Friendly сертификат
│   ├── gift_reviews.tpl         # Отзывы (TODO)
│   ├── gift_how_it_works.tpl    # Как это работает (TODO)
│   ├── gift_corporate.tpl       # Корпоративные (TODO)
│   ├── gift_about.tpl           # О нас (TODO)
│   ├── gift_contacts.tpl        # Контакты (TODO)
│   ├── gift_activate.tpl        # Активация (TODO)
│   ├── gift_romantic.tpl        # Романтический (TODO)
│   ├── gift_family.tpl          # Семейный (TODO)
│   ├── gift_extreme.tpl         # Экстрим (TODO)
│   ├── gift_relax.tpl           # Релакс (TODO)
│   ├── gift_nominal.tpl         # По номиналу (TODO)
│   └── README_FOR_TIMUR.md      # Инструкция по интеграции
├── INTEGRATION_NOTE.md          # Объяснение изменений архитектуры
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

## 7. Multi-Template архитектура (v3.0)

### 7.1 Обзор архитектуры

**⚠️ React Router УДАЛЕН** в версии v3.0.

**Причина:** OpenCart 2.3 несовместим с client-side routing. Каждая страница должна быть отдельным PHP шаблоном (.tpl файл), управляемым через OpenCart контроллер.

**Новая структура:**
- 1 React SPA страница (главная с корзиной)
- 13 статичных HTML страниц (.tpl шаблоны)
- Shared header/footer для всех страниц
- Server-side навигация через OpenCart URLs

### 7.2 Список всех страниц

#### 1. Главная страница (React SPA)
- **Template:** `opencart-templates/gift.tpl`
- **URL:** `/index.php?route=information/gift`
- **SEO URL:** `/gift-certificate`
- **Технология:** React SPA с корзиной и checkout формой

#### 2-8. Основные информационные страницы (Static HTML)
| # | Template | URL | SEO URL |
|---|----------|-----|---------|
| 2 | gift_delivery.tpl | information/gift/delivery | /gift-certificate/delivery |
| 3 | gift_reviews.tpl | information/gift/reviews | /gift-certificate/reviews |
| 4 | gift_how_it_works.tpl | information/gift/howItWorks | /gift-certificate/how-it-works |
| 5 | gift_corporate.tpl | information/gift/corporate | /gift-certificate/corporate |
| 6 | gift_about.tpl | information/gift/about | /gift-certificate/about |
| 7 | gift_contacts.tpl | information/gift/contacts | /gift-certificate/contacts |
| 8 | gift_activate.tpl | information/gift/activate | /gift-certificate/activate |

#### 9-14. Страницы типов сертификатов (Static HTML)
| # | Template | URL | SEO URL |
|---|----------|-----|---------|
| 9 | gift_pet_friendly.tpl | information/gift/petFriendly | /gift-certificate/pet-friendly |
| 10 | gift_romantic.tpl | information/gift/romantic | /gift-certificate/romantic |
| 11 | gift_family.tpl | information/gift/family | /gift-certificate/family |
| 12 | gift_extreme.tpl | information/gift/extreme | /gift-certificate/extreme |
| 13 | gift_relax.tpl | information/gift/relax | /gift-certificate/relax |
| 14 | gift_nominal.tpl | information/gift/nominal | /gift-certificate/nominal |

### 7.3 Структура .tpl шаблонов

#### Главная страница (gift.tpl)
```php
<?php echo $header; ?>
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<!-- React App Container -->
<div id="root"></div>

<!-- React Bundle (from npm run build) -->
<?php
$manifest_path = DIR_APPLICATION . '../catalog/view/javascript/gift-app/manifest.json';
if (file_exists($manifest_path)) {
    $manifest = json_decode(file_get_contents($manifest_path), true);
    // Load CSS and JS from manifest
}
?>

<?php echo $footer; ?>
```

#### Статичные страницы (gift_delivery.tpl, gift_pet_friendly.tpl и т.д.)
```php
<?php echo $header; ?>
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_delivery.css">

<?php
$current_page = 'delivery';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="delivery-page">
  <div class="container">
    <!-- Статичный HTML контент -->
  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>
<?php echo $footer; ?>
```

### 7.4 Shared компоненты

#### header.tpl (shared/header.tpl)
Содержит:
- Логотип и навигационное меню
- Активная страница highlight через `$current_page`
- Mobile menu toggle
- Кнопка "Активировать сертификат"

#### footer.tpl (shared/footer.tpl)
Содержит:
- 4-колоночный layout с ссылками
- Социальные сети
- Copyright и disclaimer

### 7.5 CSS файлы

| Файл | Описание | Используется в |
|------|----------|----------------|
| gift_common.css | Base стили для всех страниц | Все страницы |
| gift_delivery.css | Стили доставки и оплаты | gift_delivery.tpl |
| gift_certificate_type.css | Стили типов сертификатов | gift_pet_friendly.tpl и др. типы |

### 7.6 OpenCart контроллер

**Файл:** `catalog/controller/information/gift.php`

```php
<?php
class ControllerInformationGift extends Controller {

    private function loadGiftPage($template, $page_name) {
        $this->load->language('information/gift');
        $data['heading_title'] = 'Подарочные сертификаты ГЛЭМПИНГИ.РФ';
        $data['base'] = $this->config->get('config_url');
        $data['home_url'] = $this->url->link('common/home');
        $data['current_page'] = $page_name;

        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => 'Главная',
            'href' => $this->url->link('common/home')
        );
        $data['breadcrumbs'][] = array(
            'text' => 'Подарочные сертификаты',
            'href' => $this->url->link('information/gift')
        );

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view($template, $data));
    }

    // Главная (React SPA)
    public function index() {
        $this->loadGiftPage('information/gift', 'home');
    }

    // Основные страницы
    public function delivery() {
        $this->loadGiftPage('information/gift_delivery', 'delivery');
    }

    public function reviews() {
        $this->loadGiftPage('information/gift_reviews', 'reviews');
    }

    // ... 12 других методов для остальных страниц
}
?>
```

**Полный код контроллера:** См. `opencart-templates/README_FOR_TIMUR.md`

### 7.7 SEO URL конфигурация

В **Admin Panel → System → Design → SEO URL** добавить:

```
gift-certificate → information/gift
gift-certificate/delivery → information/gift/delivery
gift-certificate/reviews → information/gift/reviews
gift-certificate/how-it-works → information/gift/howItWorks
gift-certificate/corporate → information/gift/corporate
gift-certificate/about → information/gift/about
gift-certificate/contacts → information/gift/contacts
gift-certificate/activate → information/gift/activate
gift-certificate/pet-friendly → information/gift/petFriendly
gift-certificate/romantic → information/gift/romantic
gift-certificate/family → information/gift/family
gift-certificate/extreme → information/gift/extreme
gift-certificate/relax → information/gift/relax
gift-certificate/nominal → information/gift/nominal
```

### 7.8 Интеграция с OpenCart

**Шаг 1: Скопировать Templates**
```bash
cp opencart-templates/*.tpl → catalog/view/theme/default/template/information/
cp -r opencart-templates/shared/ → catalog/view/theme/default/template/information/shared/
```

**Шаг 2: Скопировать CSS**
```bash
cp opencart-templates/css/* → catalog/view/theme/default/stylesheet/
```

**Шаг 3: Скопировать изображения**
```bash
mkdir -p catalog/view/theme/default/image/gift/
cp -r opencart-templates/images/* → catalog/view/theme/default/image/gift/
```

**Шаг 4: Скопировать React bundle (только для главной)**
```bash
# После npm run build
cp -r dist/assets/* → catalog/view/javascript/gift-app/
cp dist/manifest.json → catalog/view/javascript/gift-app/
```

**Шаг 5: Создать контроллер**
```bash
# Создать catalog/controller/information/gift.php
# См. секцию 7.6 или README_FOR_TIMUR.md
```

**Полная инструкция:** `opencart-templates/README_FOR_TIMUR.md`

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

## Чеклист интеграции (v3.0 Multi-Template)

### Frontend (OpenCart Templates)
- [x] Создать папку opencart-templates/
- [x] Создать shared/header.tpl и footer.tpl
- [x] Создать gift.tpl (главная React SPA)
- [x] Создать gift_delivery.tpl
- [x] Создать gift_pet_friendly.tpl
- [ ] Создать gift_reviews.tpl
- [ ] Создать gift_how_it_works.tpl
- [ ] Создать gift_corporate.tpl
- [ ] Создать gift_about.tpl
- [ ] Создать gift_contacts.tpl
- [ ] Создать gift_activate.tpl
- [ ] Создать gift_romantic.tpl
- [ ] Создать gift_family.tpl
- [ ] Создать gift_extreme.tpl
- [ ] Создать gift_relax.tpl
- [ ] Создать gift_nominal.tpl
- [x] Создать CSS файлы (common, delivery, certificate_type)
- [ ] Конвертировать все изображения в локальные файлы

### Backend (OpenCart Integration)
- [ ] Создать таблицу `gift_certificate` в БД
- [ ] Создать контроллер `catalog/controller/information/gift.php` (14 методов)
- [ ] Создать контроллер `catalog/controller/gift/checkout.php` (API)
- [ ] Создать модель `catalog/model/gift/certificate.php`
- [ ] Скопировать все .tpl файлы в `catalog/view/theme/default/template/information/`
- [ ] Скопировать shared/ в `catalog/view/theme/default/template/information/shared/`
- [ ] Скопировать CSS в `catalog/view/theme/default/stylesheet/`
- [ ] Скопировать изображения в `catalog/view/theme/default/image/gift/`
- [ ] Скопировать React bundle в `catalog/view/javascript/gift-app/`
- [ ] Настроить SEO URL (14 маршрутов)
- [ ] Настроить Tinkoff Terminal Key и Password
- [ ] Протестировать все 14 страниц
- [ ] Протестировать создание заказа
- [ ] Протестировать оплату через Tinkoff
- [ ] Проверить сохранение в БД
- [ ] Настроить email уведомления
- [ ] Настроить генерацию PDF сертификатов
- [ ] Развернуть на production сервере

---

**Версия документа:** 3.0
**Дата создания:** 2025-11-24
**Дата обновления:** 2025-11-25
**Статус:** Multi-Template Architecture
