<?php echo $header; ?>

<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_certificate_type.css">

<?php
$current_page = 'certificates';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="certificate-type-page relax">
  <div class="container">

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <span class="badge" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); color: #111827;">🧘 Релакс и SPA</span>
        <h1>Подарочный сертификат<br>на релакс и SPA отдых</h1>
        <p class="lead">Полная перезагрузка: йога, медитации, массажи, SPA-процедуры и уединение на природе</p>
        <div class="hero-badges">
          <span class="badge-pill">🧘‍♀️ Йога и медитация</span>
          <span class="badge-pill">💆 SPA-процедуры</span>
          <span class="badge-pill">🗺️ 70+ wellness-мест</span>
        </div>
      </div>
      <div class="hero-image">
        <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/relax-hero.jpg"
             alt="Релакс и SPA отдых в глэмпинге">
      </div>
    </section>

    <!-- Certificate Selector -->
    <section class="certificate-selector">
      <h2>Выберите номинал сертификата</h2>

      <div class="amount-grid">
        <div class="amount-card" data-amount="10000">
          <div class="amount-value">10 000 ₽</div>
          <div class="amount-nights">1-2 ночи</div>
          <div class="amount-note">Релакс на выходные</div>
        </div>

        <div class="amount-card popular" data-amount="15000">
          <div class="popular-badge">Популярно</div>
          <div class="amount-value">15 000 ₽</div>
          <div class="amount-nights">2-3 ночи</div>
          <div class="amount-note">Wellness-программа</div>
        </div>

        <div class="amount-card" data-amount="25000">
          <div class="amount-value">25 000 ₽</div>
          <div class="amount-nights">3-5 ночей</div>
          <div class="amount-note">Полная перезагрузка</div>
        </div>

        <div class="amount-card premium" data-amount="50000">
          <div class="premium-badge">Премиум</div>
          <div class="amount-value">50 000 ₽</div>
          <div class="amount-nights">5-7 ночей</div>
          <div class="amount-note">Детокс-ретрит</div>
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
              <div class="format-icon">✉️</div>
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
      <p class="section-subtitle">Лучшие wellness-глэмпинги России</p>

      <div class="glamping-grid">
        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);"></div>
          <div class="glamping-info">
            <h4>Оазис спокойствия</h4>
            <p class="glamping-location">📍 Подмосковье</p>
            <p class="glamping-features">Йога-платформа • SPA-центр • Вегетарианская кухня</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #d299c2 0%, #fef9d7 100%);"></div>
          <div class="glamping-info">
            <h4>Лесной SPA</h4>
            <p class="glamping-location">📍 Карелия</p>
            <p class="glamping-features">Баня на дровах • Массажи • Медитации</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);"></div>
          <div class="glamping-info">
            <h4>Горная медитация</h4>
            <p class="glamping-location">📍 Алтай</p>
            <p class="glamping-features">Йога-ретриты • Звуковые ванны • Детокс-программы</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);"></div>
          <div class="glamping-info">
            <h4>Морской wellness</h4>
            <p class="glamping-location">📍 Крым</p>
            <p class="glamping-features">Талассотерапия • Пилатес • Здоровое питание</p>
          </div>
        </div>
      </div>

      <div class="view-all-link">
        <a href="<?php echo $base; ?>gift-certificate" class="btn-link">
          Посмотреть все wellness-глэмпинги (70+) →
        </a>
      </div>
    </section>

    <!-- How It Works Brief -->
    <section class="how-it-works-brief">
      <h2>Как это работает</h2>
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
          <p>Тому, кто нуждается в отдыхе</p>
        </div>
        <div class="step-card">
          <div class="step-number">4</div>
          <h4>Перезагрузитесь</h4>
          <p>Обретите гармонию и силы</p>
        </div>
      </div>
    </section>

    <!-- Features -->
    <section class="features">
      <h2>Что включено</h2>
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">🧘‍♀️</div>
          <h4>Йога и медитация</h4>
          <p>Ежедневные занятия йогой, медитации, дыхательные практики с опытными инструкторами</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">💆‍♀️</div>
          <h4>SPA-процедуры</h4>
          <p>Массажи, обертывания, скрабы, ароматерапия, талассотерапия</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🛁</div>
          <h4>Термальные зоны</h4>
          <p>Бани, сауны, хаммамы, купели, джакузи с видом на природу</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🥗</div>
          <h4>Здоровое питание</h4>
          <p>Вегетарианское меню, детокс-программы, органические продукты</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🌳</div>
          <h4>Единение с природой</h4>
          <p>Лесные прогулки, медитации у воды, звуковые ванны на открытом воздухе</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🎵</div>
          <h4>Релаксация</h4>
          <p>Звукотерапия, ароматерапия, библиотека, гамаки, зоны для чтения</p>
        </div>
      </div>
    </section>

    <!-- Perfect For -->
    <section class="perfect-for">
      <h2>Идеально подходит для</h2>
      <div class="occasions-grid">
        <div class="occasion-card">
          <div class="occasion-icon">💆</div>
          <h4>Антистресс-терапия</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🎂</div>
          <h4>День рождения</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">👩</div>
          <h4>Женский отдых</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🧘</div>
          <h4>Йога-ретрит</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">💪</div>
          <h4>Восстановление сил</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🌿</div>
          <h4>Детокс-программа</h4>
        </div>
      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
