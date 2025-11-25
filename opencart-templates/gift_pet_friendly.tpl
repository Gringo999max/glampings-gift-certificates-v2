<?php echo $header; ?>

<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_certificate_type.css">

<?php
$current_page = 'certificates';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="certificate-type-page pet-friendly">
  <div class="container">

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <span class="badge">🐾 Pet-Friendly</span>
        <h1>Подарочный сертификат<br>на отдых с питомцем</h1>
        <p class="lead">Глэмпинги и коттеджи высокого уровня на природе и в городе, где рады вашим четвероногим друзьям</p>
        <div class="hero-badges">
          <span class="badge-pill">🏠 Для двоих + питомец</span>
          <span class="badge-pill">📅 2 года на активацию</span>
          <span class="badge-pill">🗺️ 50+ локаций по России</span>
        </div>
      </div>
      <div class="hero-image">
        <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/pet-friendly-hero.jpg"
             alt="Отдых с питомцем в глэмпинге">
      </div>
    </section>

    <!-- Certificate Selector -->
    <section class="certificate-selector">
      <h2>Выберите номинал сертификата</h2>

      <div class="amount-grid">
        <div class="amount-card" data-amount="10000">
          <div class="amount-value">10 000 ₽</div>
          <div class="amount-nights">1-2 ночи</div>
          <div class="amount-note">Выходные на природе</div>
        </div>

        <div class="amount-card popular" data-amount="15000">
          <div class="popular-badge">Популярно</div>
          <div class="amount-value">15 000 ₽</div>
          <div class="amount-nights">2-3 ночи</div>
          <div class="amount-note">Мини-отпуск с питомцем</div>
        </div>

        <div class="amount-card" data-amount="25000">
          <div class="amount-value">25 000 ₽</div>
          <div class="amount-nights">3-5 ночей</div>
          <div class="amount-note">Полноценный отдых</div>
        </div>

        <div class="amount-card" data-amount="50000">
          <div class="amount-value">50 000 ₽</div>
          <div class="amount-nights">Неделя отдыха</div>
          <div class="amount-note">Premium отпуск</div>
        </div>
      </div>

      <div class="format-selector">
        <h3>Выберите формат сертификата</h3>
        <div class="format-options">
          <label class="format-option">
            <input type="radio" name="format" value="electronic" checked>
            <div class="format-card">
              <span class="format-icon">📧</span>
              <span class="format-name">Электронный</span>
              <span class="format-delivery">Бесплатно, мгновенно</span>
            </div>
          </label>

          <label class="format-option">
            <input type="radio" name="format" value="envelope">
            <div class="format-card">
              <span class="format-icon">💌</span>
              <span class="format-name">В фирменном конверте</span>
              <span class="format-delivery">+ стоимость доставки</span>
            </div>
          </label>

          <label class="format-option">
            <input type="radio" name="format" value="gift_box">
            <div class="format-card">
              <span class="format-icon">🎁</span>
              <span class="format-name">В подарочной коробке</span>
              <span class="format-delivery">+ стоимость доставки</span>
            </div>
          </label>
        </div>
      </div>

      <div class="action-buttons">
        <a href="<?php echo $base; ?>gift-certificate" class="btn btn-primary btn-large">
          Добавить в корзину
        </a>
        <a href="<?php echo $base; ?>gift-certificate" class="btn btn-secondary btn-large">
          Заказ в один клик
        </a>
      </div>
    </section>

    <!-- Where Valid -->
    <section class="where-valid">
      <h2>Где действует сертификат</h2>
      <p class="section-lead">В любом из 50+ глэмпингов по всей России, где рады питомцам</p>

      <div class="glamping-examples">
        <div class="glamping-card">
          <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/glamping-pet-1.jpg" alt="Глэмпинг">
          <h4>Подмосковье</h4>
          <p>15+ локаций в радиусе 100 км от Москвы</p>
        </div>

        <div class="glamping-card">
          <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/glamping-pet-2.jpg" alt="Глэмпинг">
          <h4>Ленинградская область</h4>
          <p>Карельские леса и озёра</p>
        </div>

        <div class="glamping-card">
          <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/glamping-pet-3.jpg" alt="Глэмпинг">
          <h4>Горный Алтай</h4>
          <p>Природа и приключения</p>
        </div>

        <div class="glamping-card">
          <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/glamping-pet-4.jpg" alt="Глэмпинг">
          <h4>Крым</h4>
          <p>Море, горы и лавандовые поля</p>
        </div>
      </div>
    </section>

    <!-- How It Works Brief -->
    <section class="how-it-works-brief">
      <h2>Три простых шага до незабываемого отдыха</h2>

      <div class="steps">
        <div class="step">
          <div class="step-number">1</div>
          <div class="step-content">
            <h3>Выберите и купите</h3>
            <p>Выберите номинал и формат сертификата. Оплатите онлайн любым удобным способом.</p>
          </div>
        </div>

        <div class="step">
          <div class="step-number">2</div>
          <div class="step-content">
            <h3>Получите сертификат</h3>
            <p>На email мгновенно или курьером в красивой упаковке. Сертификат готов к вручению!</p>
          </div>
        </div>

        <div class="step">
          <div class="step-number">3</div>
          <div class="step-content">
            <h3>Выберите глэмпинг</h3>
            <p>Получатель выбирает любой глэмпинг из каталога и бронирует удобные даты.</p>
          </div>
        </div>
      </div>

      <a href="<?php echo $base; ?>gift-certificate/how-it-works" class="btn-link">
        Подробнее о том, как это работает →
      </a>
    </section>

    <!-- Features -->
    <section class="features">
      <h2>Почему стоит выбрать Pet-Friendly сертификат?</h2>

      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">🐕</div>
          <h4>Питомцы приветствуются</h4>
          <p>Все глэмпинги в подборке имеют огороженную территорию и принимают животных без доплаты</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🏡</div>
          <h4>Комфорт для всех</h4>
          <p>Миски, лежанки и специальные удобства для ваших четвероногих друзей</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🌲</div>
          <h4>Простор для прогулок</h4>
          <p>Лес, озёра, горы - идеальные места для активного отдыха с питомцем</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">📍</div>
          <h4>50+ локаций</h4>
          <p>От Подмосковья до Алтая - выбирайте место по душе</p>
        </div>
      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
