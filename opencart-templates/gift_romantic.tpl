<?php echo $header; ?>

<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_certificate_type.css">

<?php
$current_page = 'certificates';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="certificate-type-page romantic">
  <div class="container">

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <span class="badge" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); color: white;">💕 Романтический отдых</span>
        <h1>Подарочный сертификат<br>на романтический отдых</h1>
        <p class="lead">Незабываемые моменты для двоих в самых романтичных глэмпингах с панорамными окнами, джакузи и закатами</p>
        <div class="hero-badges">
          <span class="badge-pill">👫 Для двоих</span>
          <span class="badge-pill">🌅 Романтическая атмосфера</span>
          <span class="badge-pill">🗺️ 80+ романтичных мест</span>
        </div>
      </div>
      <div class="hero-image">
        <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/romantic-hero.jpg"
             alt="Романтический отдых в глэмпинге">
      </div>
    </section>

    <!-- Certificate Selector -->
    <section class="certificate-selector">
      <h2>Выберите номинал сертификата</h2>

      <div class="amount-grid">
        <div class="amount-card" data-amount="10000">
          <div class="amount-value">10 000 ₽</div>
          <div class="amount-nights">1-2 ночи</div>
          <div class="amount-note">Романтический уикенд</div>
        </div>

        <div class="amount-card popular" data-amount="15000">
          <div class="popular-badge">Популярно</div>
          <div class="amount-value">15 000 ₽</div>
          <div class="amount-nights">2-3 ночи</div>
          <div class="amount-note">Идеально для годовщины</div>
        </div>

        <div class="amount-card" data-amount="25000">
          <div class="amount-value">25 000 ₽</div>
          <div class="amount-nights">3-5 ночей</div>
          <div class="amount-note">Романтический отпуск</div>
        </div>

        <div class="amount-card premium" data-amount="50000">
          <div class="premium-badge">Премиум</div>
          <div class="amount-value">50 000 ₽</div>
          <div class="amount-nights">5-7 ночей</div>
          <div class="amount-note">Люкс-отдых для влюбленных</div>
        </div>
      </div>

      <!-- Format Selector -->
      <div class="format-selector">
        <h3>Формат получения</h3>
        <div class="format-options">
          <label class="format-option">
            <input type="radio" name="format" value="electronic" checked>
            <div class="format-card">
              <div class="format-icon">📧</div>
              <div class="format-name">Электронный</div>
              <div class="format-price">Бесплатно</div>
              <div class="format-delivery">Мгновенно на email</div>
            </div>
          </label>

          <label class="format-option">
            <input type="radio" name="format" value="envelope">
            <div class="format-card">
              <div class="format-icon">💌</div>
              <div class="format-name">В конверте</div>
              <div class="format-price">+500 ₽</div>
              <div class="format-delivery">Курьер или почта</div>
            </div>
          </label>

          <label class="format-option">
            <input type="radio" name="format" value="gift_box">
            <div class="format-card">
              <div class="format-icon">🎁</div>
              <div class="format-name">Подарочная коробка</div>
              <div class="format-price">+1 500 ₽</div>
              <div class="format-delivery">Премиум упаковка</div>
            </div>
          </label>
        </div>
      </div>

      <div class="action-buttons">
        <a href="<?php echo $base; ?>gift-certificate" class="btn btn-primary btn-large">
          Добавить в корзину
        </a>
        <a href="<?php echo $base; ?>gift-certificate/how-it-works" class="btn btn-secondary btn-large">
          Как это работает
        </a>
      </div>
    </section>

    <!-- Where Valid Section -->
    <section class="where-valid">
      <h2>Где действует сертификат</h2>
      <p class="section-subtitle">Лучшие романтические глэмпинги России</p>

      <div class="glamping-grid">
        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);"></div>
          <div class="glamping-info">
            <h4>Романтик на озере</h4>
            <p class="glamping-location">📍 Карелия</p>
            <p class="glamping-features">Панорамные окна • Джакузи • Камин</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);"></div>
          <div class="glamping-info">
            <h4>Sunset View</h4>
            <p class="glamping-location">📍 Крым</p>
            <p class="glamping-features">Вид на море • Терраса • Ужин при свечах</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%);"></div>
          <div class="glamping-info">
            <h4>Лесная сказка</h4>
            <p class="glamping-location">📍 Подмосковье</p>
            <p class="glamping-features">Уединение • SPA • Романтические ужины</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);"></div>
          <div class="glamping-info">
            <h4>Горный рай</h4>
            <p class="glamping-location">📍 Алтай</p>
            <p class="glamping-features">Горные виды • Бочка-баня • Звездное небо</p>
          </div>
        </div>
      </div>

      <div class="view-all-link">
        <a href="<?php echo $base; ?>gift-certificate" class="btn-link">
          Посмотреть все романтические глэмпинги (80+) →
        </a>
      </div>
    </section>

    <!-- How It Works Brief -->
    <section class="how-it-works-brief">
      <h2>Как подарить романтику</h2>
      <div class="steps-grid">
        <div class="step-card">
          <div class="step-number">1</div>
          <h4>Выберите</h4>
          <p>Номинал и формат сертификата</p>
        </div>
        <div class="step-card">
          <div class="step-number">2</div>
          <h4>Оформите</h4>
          <p>Заказ и добавьте поздравление</p>
        </div>
        <div class="step-card">
          <div class="step-number">3</div>
          <h4>Подарите</h4>
          <p>Любимому человеку</p>
        </div>
        <div class="step-card">
          <div class="step-number">4</div>
          <h4>Наслаждайтесь</h4>
          <p>Романтическим отдыхом вместе</p>
        </div>
      </div>
    </section>

    <!-- Features -->
    <section class="features">
      <h2>Что включено</h2>
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">🏡</div>
          <h4>Роскошное проживание</h4>
          <p>Премиум глэмпинги с панорамными окнами и дизайнерским интерьером</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🛁</div>
          <h4>Джакузи и SPA</h4>
          <p>Расслабьтесь в джакузи под звездным небом или насладитесь массажем для двоих</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🍽️</div>
          <h4>Романтические ужины</h4>
          <p>Изысканная кухня, сервировка, ужины при свечах на террасе с видом</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🌅</div>
          <h4>Невероятные виды</h4>
          <p>Закаты над озером, рассветы в горах, звездное небо над лесом</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🔥</div>
          <h4>Атмосфера</h4>
          <p>Камины, костры, приватные террасы - все для создания романтического настроения</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🎁</div>
          <h4>Сюрпризы</h4>
          <p>Шампанское, цветы, шоколад - возможность организовать особенный момент</p>
        </div>
      </div>
    </section>

    <!-- Perfect For -->
    <section class="perfect-for">
      <h2>Идеально подходит для</h2>
      <div class="occasions-grid">
        <div class="occasion-card">
          <div class="occasion-icon">💝</div>
          <h4>День Святого Валентина</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">💍</div>
          <h4>Предложение руки и сердца</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🎂</div>
          <h4>День рождения половинки</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">💑</div>
          <h4>Годовщина свадьбы</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🌹</div>
          <h4>Просто так, без повода</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🎉</div>
          <h4>Медовый месяц</h4>
        </div>
      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
