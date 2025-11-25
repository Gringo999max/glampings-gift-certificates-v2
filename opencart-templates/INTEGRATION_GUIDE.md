# OpenCart Integration Guide - Hybrid SPA Architecture

## 📋 Обзор

Этот проект использует **Hybrid SPA (Single Page Application)** подход:
- Все 14 .tpl файлов загружают **ОДИН React bundle**
- Разные страницы передаются через атрибут `data-route`
- React Router определяет какую страницу показать
- Оригинальный дизайн Figma полностью сохранен

## 🎯 Преимущества

✅ **Один React bundle** - не нужно 14 копий CSS/JS
✅ **Оригинальный дизайн** - тот же React код
✅ **SEO работает** - разные URL в OpenCart
✅ **Просто деплоить** - копируем файлы один раз
✅ **manifest.json** - автоматический cache busting

---

## 📁 Структура файлов

### React App (Frontend)
```
src/
├── main.tsx              # Читает data-route и запускает Router
├── App.tsx               # Routing для всех страниц
└── components/           # Все React компоненты
```

### OpenCart Templates
```
opencart-templates/
├── gift-universal.tpl    # Универсальный шаблон (основа)
├── gift.tpl              # Главная страница (/)
├── gift_pet_friendly.tpl # /pet-friendly
├── gift_romantic.tpl     # /romantic
├── gift_family.tpl       # /family
├── gift_extreme.tpl      # /extreme
├── gift_relax.tpl        # /relax
├── gift_nominal.tpl      # /nominal
├── gift_delivery.tpl     # /delivery
├── gift_reviews.tpl      # /reviews
├── gift_how_it_works.tpl # /how-it-works
├── gift_corporate.tpl    # /corporate
├── gift_about.tpl        # /about
├── gift_contacts.tpl     # /contacts
└── gift_activate.tpl     # /activate
```

**ВАЖНО:** Все .tpl файлы идентичны! Это копии `gift-universal.tpl`.

---

## 🔧 Как это работает

### 1. OpenCart Controller передает route

```php
<?php
class ControllerInformationGift extends Controller {

    private function loadGiftPage($react_route) {
        $this->load->language('information/gift');

        $data['heading_title'] = 'Подарочные сертификаты';
        $data['react_route'] = $react_route; // ← КЛЮЧЕВОЙ ПАРАМЕТР!

        // Определяем template name
        if ($react_route === '/') {
            $template = 'information/gift';
        } else {
            $template = 'information/gift' . str_replace('/', '_', $react_route);
        }

        // Стандартная OpenCart обвязка
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view($template, $data));
    }

    // === Главная страница ===
    public function index() {
        $this->loadGiftPage('/');
    }

    // === Типы сертификатов ===
    public function petFriendly() {
        $this->loadGiftPage('/pet-friendly');
    }

    public function romantic() {
        $this->loadGiftPage('/romantic');
    }

    public function family() {
        $this->loadGiftPage('/family');
    }

    public function extreme() {
        $this->loadGiftPage('/extreme');
    }

    public function relax() {
        $this->loadGiftPage('/relax');
    }

    public function nominal() {
        $this->loadGiftPage('/nominal');
    }

    // === Основные страницы ===
    public function delivery() {
        $this->loadGiftPage('/delivery');
    }

    public function reviews() {
        $this->loadGiftPage('/reviews');
    }

    public function howItWorks() {
        $this->loadGiftPage('/how-it-works');
    }

    public function corporate() {
        $this->loadGiftPage('/corporate');
    }

    public function about() {
        $this->loadGiftPage('/about');
    }

    public function contacts() {
        $this->loadGiftPage('/contacts');
    }

    public function activate() {
        $this->loadGiftPage('/activate');
    }
}
?>
```

### 2. .tpl файл вставляет route в HTML

```php
<?php echo $header; ?>

<!-- React App Container with route -->
<div id="root" data-route="<?php echo isset($react_route) ? $react_route : '/'; ?>"></div>

<!-- Load React Bundle from manifest.json -->
<?php
$base_url = $this->config->get('config_url');
$manifest_path = DIR_APPLICATION . '../catalog/view/javascript/gift-app/manifest.json';

if (file_exists($manifest_path)) {
    $manifest = json_decode(file_get_contents($manifest_path), true);

    if (isset($manifest['index.html'])) {
        $entry = $manifest['index.html'];

        // Load CSS
        if (isset($entry['css'])) {
            foreach ($entry['css'] as $css) {
                echo '<link rel="stylesheet" href="' . $base_url . 'catalog/view/javascript/gift-app/' . $css . '">';
            }
        }

        // Load JS
        if (isset($entry['file'])) {
            echo '<script type="module" src="' . $base_url . 'catalog/view/javascript/gift-app/' . $entry['file'] . '"></script>';
        }
    }
}
?>

<?php echo $footer; ?>
```

### 3. React читает route и показывает страницу

**main.tsx:**
```typescript
// Read route from data-attribute
const initialRoute = rootElement.getAttribute("data-route") || "/";

createRoot(rootElement).render(
  <BrowserRouter>
    <App initialRoute={initialRoute} />
  </BrowserRouter>
);
```

**App.tsx:**
```typescript
function AppRouter({ initialRoute }: { initialRoute: string }) {
  const navigate = useNavigate();

  useEffect(() => {
    if (initialRoute !== "/" && initialRoute !== window.location.pathname) {
      navigate(initialRoute, { replace: true });
    }
  }, [initialRoute, navigate]);

  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
      <Route path="/pet-friendly" element={<PetFriendlyPage />} />
      <Route path="/romantic" element={<RomanticPage />} />
      {/* ... остальные routes ... */}
    </Routes>
  );
}
```

---

## 🚀 Deployment

### Шаг 1: Сборка React приложения

```bash
cd /path/to/glampings-gift-certificates-v2

# Установить зависимости
npm install

# Собрать production bundle
npm run build
```

**Результат:**
```
dist/
├── manifest.json         # ← Карта файлов с хешами
├── assets/
│   ├── index-abc123.js   # ← Главный JS bundle
│   ├── index-def456.css  # ← Главный CSS bundle
│   └── ...               # ← Другие chunks
```

### Шаг 2: Копирование в OpenCart

```bash
# Скопировать весь dist/ в OpenCart
cp -r dist/* /path/to/opencart/catalog/view/javascript/gift-app/

# Структура в OpenCart:
/opencart/
└── catalog/
    └── view/
        └── javascript/
            └── gift-app/
                ├── manifest.json
                └── assets/
                    ├── index-abc123.js
                    ├── index-def456.css
                    └── ...
```

### Шаг 3: Копирование .tpl файлов

```bash
# Скопировать все .tpl файлы в OpenCart theme
cp opencart-templates/*.tpl /path/to/opencart/catalog/view/theme/default/template/information/

# Структура в OpenCart:
/opencart/
└── catalog/
    └── view/
        └── theme/
            └── default/
                └── template/
                    └── information/
                        ├── gift.tpl
                        ├── gift_pet_friendly.tpl
                        ├── gift_romantic.tpl
                        ├── ... (все 14 файлов)
```

### Шаг 4: Создание Controller (если еще нет)

Создать файл: `/opencart/catalog/controller/information/gift.php`

```php
<?php
class ControllerInformationGift extends Controller {

    private function loadGiftPage($react_route) {
        $this->load->language('information/gift');

        $data['heading_title'] = 'Подарочные сертификаты';
        $data['react_route'] = $react_route;

        if ($react_route === '/') {
            $template = 'information/gift';
        } else {
            $template = 'information/gift' . str_replace('/', '_', $react_route);
        }

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view($template, $data));
    }

    public function index() { $this->loadGiftPage('/'); }
    public function petFriendly() { $this->loadGiftPage('/pet-friendly'); }
    public function romantic() { $this->loadGiftPage('/romantic'); }
    public function family() { $this->loadGiftPage('/family'); }
    public function extreme() { $this->loadGiftPage('/extreme'); }
    public function relax() { $this->loadGiftPage('/relax'); }
    public function nominal() { $this->loadGiftPage('/nominal'); }
    public function delivery() { $this->loadGiftPage('/delivery'); }
    public function reviews() { $this->loadGiftPage('/reviews'); }
    public function howItWorks() { $this->loadGiftPage('/how-it-works'); }
    public function corporate() { $this->loadGiftPage('/corporate'); }
    public function about() { $this->loadGiftPage('/about'); }
    public function contacts() { $this->loadGiftPage('/contacts'); }
    public function activate() { $this->loadGiftPage('/activate'); }
}
?>
```

### Шаг 5: Настройка URL (routes)

Добавить в `/opencart/config/opencart_routes.php` (или через админку):

```
gift → information/gift/index
gift/pet-friendly → information/gift/petFriendly
gift/romantic → information/gift/romantic
gift/family → information/gift/family
gift/extreme → information/gift/extreme
gift/relax → information/gift/relax
gift/nominal → information/gift/nominal
gift/delivery → information/gift/delivery
gift/reviews → information/gift/reviews
gift/how-it-works → information/gift/howItWorks
gift/corporate → information/gift/corporate
gift/about → information/gift/about
gift/contacts → information/gift/contacts
gift/activate → information/gift/activate
```

---

## 🧪 Тестирование

### Локальная разработка

```bash
npm run dev
```

Откроется `http://localhost:3000` с React Router

### Production тест

После deployment откройте:

- https://ваш-сайт.ru/gift
- https://ваш-сайт.ru/gift/pet-friendly
- https://ваш-сайт.ru/gift/romantic
- https://ваш-сайт.ru/gift/delivery
- и т.д.

Все страницы должны:
- Загружать один React bundle
- Показывать правильный контент
- Работать навигация

---

## 🔍 Troubleshooting

### manifest.json не создается

**Проблема:** После `npm run build` нет файла `dist/manifest.json`

**Решение:** Убедитесь что в `vite.config.ts` есть:
```typescript
build: {
  manifest: true, // ← ВАЖНО!
  outDir: 'dist',
  // ...
}
```

### Страница показывает неправильный контент

**Проблема:** Открываю `/gift/pet-friendly` но показывается главная страница

**Решение:** Проверьте что:
1. Controller передает правильный `$react_route`
2. В .tpl файле есть `data-route="<?php echo $react_route; ?>"`
3. В браузере inspect `<div id="root" data-route="/pet-friendly">`

### Стили не применяются

**Проблема:** Страница загружается но без стилей

**Решение:**
1. Проверьте что CSS файлы скопированы в OpenCart
2. Откройте DevTools → Network → проверьте что CSS загружается
3. Проверьте `$base_url` в .tpl файле

### 404 на ассетах

**Проблема:** `GET /catalog/view/javascript/gift-app/assets/index-abc123.js` → 404

**Решение:**
1. Проверьте что `dist/` скопирован в правильную директорию
2. Убедитесь что путь в .tpl файле правильный
3. Проверьте права доступа к файлам (644 для файлов, 755 для папок)

---

## 📝 Changelog

### v3.0 - Hybrid SPA Architecture (Current)
- ✅ Все .tpl файлы идентичны, загружают один React bundle
- ✅ Route передается через `data-route` attribute
- ✅ React Router показывает правильную страницу
- ✅ Оригинальный дизайн Figma сохранен
- ✅ manifest.json для cache busting

### v2.0 - Multi-Template Architecture (Deprecated)
- ❌ 14 отдельных статических HTML страниц
- ❌ Копирование дизайна вручную

### v1.0 - Full SPA (Deprecated)
- ❌ Client-side routing не работал с OpenCart SEO

---

## 📞 Support

Если возникли проблемы при интеграции:

1. Проверьте все пути к файлам
2. Убедитесь что `manifest.json` существует
3. Проверьте OpenCart error logs
4. Проверьте браузер DevTools Console

**Важно:** Все 14 .tpl файлов должны быть идентичными! Если что-то меняете, обновляйте `gift-universal.tpl` и копируйте изменения во все файлы.

---

## 🎉 Итог

Hybrid SPA подход = **Best of Both Worlds**:
- ✅ React Router для навигации
- ✅ OpenCart SEO для поисковиков
- ✅ Один bundle для всех страниц
- ✅ Простая интеграция для бэкенда

Тимур может просто скопировать файлы и всё заработает! 🚀
