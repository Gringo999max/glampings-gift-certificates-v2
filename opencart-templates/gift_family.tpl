<?php echo $header; ?>

<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_certificate_type.css">

<?php
$current_page = 'certificates';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="certificate-type-page family">
  <div class="container">

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <span class="badge" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); color: white;">👨‍👩‍👧‍👦 Семейный отдых</span>
        <h1>Подарочный сертификат<br>на семейный отдых</h1>
        <p class="lead">Глэмпинги с детскими площадками, активностями для всей семьи и безопасной территорией</p>
        <div class="hero-badges">
          <span class="badge-pill">👨‍👩‍👧 Для всей семьи</span>
          <span class="badge-pill">🎮 Детские развлечения</span>
          <span class="badge-pill">🗺️ 60+ семейных мест</span>
        </div>
      </div>
      <div class="hero-image">
        <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/family-hero.jpg"
             alt="Семейный отдых в глэмпинге">
      </div>
    </section>

    <!-- Certificate Selector -->
    <section class="certificate-selector">
      <h2>Выберите номинал сертификата</h2>

      <div class="amount-grid">
        <div class="amount-card" data-amount="10000">
          <div class="amount-value">10 000 ₽</div>
          <div class="amount-nights">1-2 ночи</div>
          <div class="amount-note">Выходные с детьми</div>
        </div>

        <div class="amount-card popular" data-amount="15000">
          <div class="popular-badge">Популярно</div>
          <div class="amount-value">15 000 ₽</div>
          <div class="amount-nights">2-3 ночи</div>
          <div class="amount-note">Семейные каникулы</div>
        </div>

        <div class="amount-card" data-amount="25000">
          <div class="amount-value">25 000 ₽</div>
          <div class="amount-nights">3-5 ночей</div>
          <div class="amount-note">Полноценный отпуск</div>
        </div>

        <div class="amount-card premium" data-amount="50000">
          <div class="premium-badge">Премиум</div>
          <div class="amount-value">50 000 ₽</div>
          <div class="amount-nights">5-7 ночей</div>
          <div class="amount-note">Большая семья</div>
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
      <p class="section-subtitle">Лучшие семейные глэмпинги России</p>

      <div class="glamping-grid">
        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);"></div>
          <div class="glamping-info">
            <h4>Семейное гнездышко</h4>
            <p class="glamping-location">📍 Подмосковье</p>
            <p class="glamping-features">Детская площадка • Аниматоры • Батут</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);"></div>
          <div class="glamping-info">
            <h4>Лесное приключение</h4>
            <p class="glamping-location">📍 Карелия</p>
            <p class="glamping-features">Веревочный парк • Квесты • Мастер-классы</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);"></div>
          <div class="glamping-info">
            <h4>Сказочная деревня</h4>
            <p class="glamping-location">📍 Суздаль</p>
            <p class="glamping-features">Контактный зоопарк • Ферма • Прогулки</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);"></div>
          <div class="glamping-info">
            <h4>Морские каникулы</h4>
            <p class="glamping-location">📍 Краснодарский край</p>
            <p class="glamping-features">Пляж • Бассейн • Детский клуб</p>
          </div>
        </div>
      </div>

      <div class="view-all-link">
        <a href="<?php echo $base; ?>gift-certificate" class="btn-link">
          Посмотреть все семейные глэмпинги (60+) →
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
          <p>Семье или друзьям</p>
        </div>
        <div class="step-card">
          <div class="step-number">4</div>
          <h4>Наслаждайтесь</h4>
          <p>Семейным отдыхом на природе</p>
        </div>
      </div>
    </section>

    <!-- Features -->
    <section class="features">
      <h2>Что включено</h2>
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">🏡</div>
          <h4>Просторное жилье</h4>
          <p>Большие глэмпинги с несколькими спальнями, кухней и гостиной для всей семьи</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🎪</div>
          <h4>Детские активности</h4>
          <p>Игровые площадки, батуты, бассейны, мастер-классы для детей всех возрастов</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🐴</div>
          <h4>Общение с животными</h4>
          <p>Контактные зоопарки, фермы, прогулки на лошадях, кормление животных</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🍽️</div>
          <h4>Детское меню</h4>
          <p>Здоровое питание для детей, возможность самостоятельного приготовления еды</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🛡️</div>
          <h4>Безопасность</h4>
          <p>Огороженная территория, видеонаблюдение, медпункт, опытный персонал</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🌳</div>
          <h4>Природа и активности</h4>
          <p>Велосипеды, самокаты, походы, рыбалка, сбор ягод и грибов</p>
        </div>
      </div>
    </section>

    <!-- Perfect For -->
    <section class="perfect-for">
      <h2>Идеально подходит для</h2>
      <div class="occasions-grid">
        <div class="occasion-card">
          <div class="occasion-icon">🎂</div>
          <h4>День рождения ребенка</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🎒</div>
          <h4>Каникулы и праздники</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">👨‍👩‍👧‍👦</div>
          <h4>Семейные торжества</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🏖️</div>
          <h4>Летний отдых</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">👪</div>
          <h4>Выходные с детьми</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🎁</div>
          <h4>Подарок молодой семье</h4>
        </div>
      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
