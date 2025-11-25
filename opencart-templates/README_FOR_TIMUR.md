# Инструкция по интеграции для Тимура

## 📦 Что в этой папке

**14 готовых .tpl файлов для OpenCart 2.3:**
- ✅ 1 главная страница (React SPA с корзиной и формой заказа)
- ✅ 7 основных статичных страниц
- ✅ 6 страниц типов сертификатов

## 🚀 Что нужно сделать

### Шаг 1: Скопировать Templates

```bash
# Скопировать все .tpl файлы
cp opencart-templates/*.tpl → catalog/view/theme/default/template/information/

# Скопировать shared папку
cp -r opencart-templates/shared/ → catalog/view/theme/default/template/information/shared/
```

**Результат:**
```
catalog/view/theme/default/template/information/
├── gift.tpl                     # Главная (React SPA)
├── gift_delivery.tpl            # Доставка
├── gift_reviews.tpl             # Отзывы (создать)
├── gift_how_it_works.tpl        # Как работает (создать)
├── gift_corporate.tpl           # Корпоративные (создать)
├── gift_about.tpl               # О нас (создать)
├── gift_contacts.tpl            # Контакты (создать)
├── gift_activate.tpl            # Активация (создать)
├── gift_pet_friendly.tpl        # Pet-Friendly
├── gift_romantic.tpl            # Романтический (создать)
├── gift_family.tpl              # Семейный (создать)
├── gift_extreme.tpl             # Экстрим (создать)
├── gift_relax.tpl               # Релакс (создать)
├── gift_nominal.tpl             # По номиналу (создать)
└── shared/
    ├── header.tpl
    └── footer.tpl
```

### Шаг 2: Скопировать CSS

```bash
cp opencart-templates/css/* → catalog/view/theme/default/stylesheet/
```

**Результат:**
```
catalog/view/theme/default/stylesheet/
├── gift_common.css              # Общие стили
├── gift_delivery.css            # Для страницы доставки
└── gift_certificate_type.css   # Для страниц типов
```

### Шаг 3: Скопировать изображения

```bash
# Создать папку
mkdir -p catalog/view/theme/default/image/gift/

# Скопировать все изображения
cp -r opencart-templates/images/* → catalog/view/theme/default/image/gift/
```

**Структура:**
```
catalog/view/theme/default/image/gift/
├── logo.png
├── hero/
│   ├── pet-friendly-hero.jpg
│   └── ...
├── certificates/
│   ├── pet-friendly-1.jpg
│   └── ...
├── designs/
│   ├── pet-friendly-1.jpg
│   └── ...
└── icons/
    └── ...
```

### Шаг 4: Скопировать JavaScript (только для главной)

**ВАЖНО:** Сначала нужно собрать React проект:

```bash
cd /path/to/glampings-gift-certificates-v2
npm install
npm run build
```

Это создаст папку `dist/` с файлами:
```
dist/
├── manifest.json              # ⭐ ОБЯЗАТЕЛЬНО! Карта файлов с хешами
└── assets/
    ├── gift-app-abc123.js    # Главный JS бандл
    ├── react-vendor-xyz.js   # React библиотеки
    ├── index-def456.css      # Стили
    └── images/               # Изображения
```

**Копируем в OpenCart:**

```bash
# Создать папку для React бандла
mkdir -p catalog/view/javascript/gift-app/

# Скопировать всё содержимое dist/
cp -r dist/assets/* catalog/view/javascript/gift-app/assets/
cp dist/manifest.json catalog/view/javascript/gift-app/
```

**📋 Что такое manifest.json?**

Это файл, который содержит маппинг файлов с хешами. Vite генерирует его автоматически при сборке:

```json
{
  "index.html": {
    "file": "assets/gift-app-abc123.js",
    "css": [
      "assets/index-def456.css"
    ],
    "isEntry": true
  }
}
```

Шаблон `gift.tpl` читает этот файл, чтобы подключить правильные JS/CSS файлы с хешами.

**❌ Если manifest.json не создался:**

1. Проверьте, что в `vite.config.ts` есть `manifest: true`
2. Удалите папку `dist/` и соберите заново: `rm -rf dist && npm run build`
3. Проверьте логи сборки на ошибки

### Шаг 5: Создать контроллер

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

    public function howItWorks() {
        $this->loadGiftPage('information/gift_how_it_works', 'how-it-works');
    }

    public function corporate() {
        $this->loadGiftPage('information/gift_corporate', 'corporate');
    }

    public function about() {
        $this->loadGiftPage('information/gift_about', 'about');
    }

    public function contacts() {
        $this->loadGiftPage('information/gift_contacts', 'contacts');
    }

    public function activate() {
        $this->loadGiftPage('information/gift_activate', 'activate');
    }

    // Страницы типов сертификатов
    public function petFriendly() {
        $this->loadGiftPage('information/gift_pet_friendly', 'pet-friendly');
    }

    public function romantic() {
        $this->loadGiftPage('information/gift_romantic', 'romantic');
    }

    public function family() {
        $this->loadGiftPage('information/gift_family', 'family');
    }

    public function extreme() {
        $this->loadGiftPage('information/gift_extreme', 'extreme');
    }

    public function relax() {
        $this->loadGiftPage('information/gift_relax', 'relax');
    }

    public function nominal() {
        $this->loadGiftPage('information/gift_nominal', 'nominal');
    }
}
?>
```

### Шаг 6: Настроить SEO URL

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

### Шаг 7: Тестирование

Открыть в браузере и проверить:

**✅ Главная (React SPA):**
- https://глэмпинги.рф/gift-certificate

**✅ Основные страницы:**
- https://глэмпинги.рф/gift-certificate/delivery
- https://глэмпинги.рф/gift-certificate/reviews
- https://глэмпинги.рф/gift-certificate/how-it-works
- https://глэмпинги.рф/gift-certificate/corporate
- https://глэмпинги.рф/gift-certificate/about
- https://глэмпинги.рф/gift-certificate/contacts
- https://глэмпинги.рф/gift-certificate/activate

**✅ Типы сертификатов:**
- https://глэмпинги.рф/gift-certificate/pet-friendly
- https://глэмпинги.рф/gift-certificate/romantic
- https://глэмпинги.рф/gift-certificate/family
- https://глэмпинги.рф/gift-certificate/extreme
- https://глэмпинги.рф/gift-certificate/relax
- https://глэмпинги.рф/gift-certificate/nominal

## ⚠️ Важно

1. **React SPA** (главная страница) требует npm run build перед копированием
2. **Все изображения** должны быть локальные (не figma:asset/)
3. **header.tpl и footer.tpl** должны быть в shared/ папке
4. **Проверь права доступа** к файлам (644 для файлов, 755 для папок)

## 🐛 Troubleshooting

### Проблема: Белый экран на главной странице

**Решение:**
- Проверь что файлы из dist/ скопированы в catalog/view/javascript/gift-app/
- Проверь что manifest.json существует
- Проверь в браузере консоль (F12) на ошибки загрузки JS

### Проблема: 404 на страницах

**Решение:**
- Проверь что контроллер gift.php создан в правильной папке
- Проверь что SEO URL настроены в admin panel
- Проверь что методы в контроллере соответствуют URL (petFriendly, howItWorks и т.д.)

### Проблема: Стили не применяются

**Решение:**
- Проверь что CSS файлы скопированы
- Проверь пути в .tpl файлах: `<?php echo $base; ?>catalog/view/theme/default/stylesheet/...`
- Очисти кеш OpenCart (System → Maintenance → Refresh)

### Проблема: Изображения не грузятся

**Решение:**
- Проверь что все изображения скопированы в catalog/view/theme/default/image/gift/
- Проверь права доступа к папке image/gift/
- Проверь пути в .tpl файлах

## 📞 Контакты

Если что-то не работает - пиши в Telegram, разберемся!

## ✅ Чеклист интеграции

- [ ] Скопированы все .tpl файлы
- [ ] Скопированы shared/header.tpl и footer.tpl
- [ ] Скопированы все CSS файлы
- [ ] Скопированы все изображения
- [ ] Скопирован React bundle (dist/)
- [ ] Создан контроллер gift.php
- [ ] Настроены SEO URL в admin panel
- [ ] Протестированы все 14 страниц
- [ ] Проверена корзина на главной
- [ ] Проверена форма заказа

Готово? Поехали! 🚀
