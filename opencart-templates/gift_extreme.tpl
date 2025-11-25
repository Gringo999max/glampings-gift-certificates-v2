<?php echo $header; ?>

<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_certificate_type.css">

<?php
$current_page = 'certificates';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="certificate-type-page extreme">
  <div class="container">

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <span class="badge" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%); color: white;">⚡ Экстремальный отдых</span>
        <h1>Подарочный сертификат<br>на экстремальный отдых</h1>
        <p class="lead">Адреналин, приключения и незабываемые впечатления: зиплайн, рафтинг, скалолазание и многое другое</p>
        <div class="hero-badges">
          <span class="badge-pill">🔥 Экстремальные активности</span>
          <span class="badge-pill">🎿 Для любителей адреналина</span>
          <span class="badge-pill">🗺️ 40+ экстремальных локаций</span>
        </div>
      </div>
      <div class="hero-image">
        <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/extreme-hero.jpg"
             alt="Экстремальный отдых в глэмпинге">
      </div>
    </section>

    <!-- Certificate Selector -->
    <section class="certificate-selector">
      <h2>Выберите номинал сертификата</h2>

      <div class="amount-grid">
        <div class="amount-card" data-amount="10000">
          <div class="amount-value">10 000 ₽</div>
          <div class="amount-nights">1-2 ночи</div>
          <div class="amount-note">Экстрим на выходные</div>
        </div>

        <div class="amount-card popular" data-amount="15000">
          <div class="popular-badge">Популярно</div>
          <div class="amount-value">15 000 ₽</div>
          <div class="amount-nights">2-3 ночи</div>
          <div class="amount-note">Приключенческий тур</div>
        </div>

        <div class="amount-card" data-amount="25000">
          <div class="amount-value">25 000 ₽</div>
          <div class="amount-nights">3-5 ночей</div>
          <div class="amount-note">Экспедиция</div>
        </div>

        <div class="amount-card premium" data-amount="50000">
          <div class="premium-badge">Премиум</div>
          <div class="amount-value">50 000 ₽</div>
          <div class="amount-nights">5-7 ночей</div>
          <div class="amount-note">Экстрим-программа VIP</div>
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
      <p class="section-subtitle">Лучшие экстремальные глэмпинги России</p>

      <div class="glamping-grid">
        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%);"></div>
          <div class="glamping-info">
            <h4>Адреналин Парк</h4>
            <p class="glamping-location">📍 Алтай</p>
            <p class="glamping-features">Зиплайн • Скалодром • Рафтинг</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);"></div>
          <div class="glamping-info">
            <h4>Горные вершины</h4>
            <p class="glamping-location">📍 Кавказ</p>
            <p class="glamping-features">Альпинизм • Треккинг • Парапланеризм</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);"></div>
          <div class="glamping-info">
            <h4>Водная стихия</h4>
            <p class="glamping-location">📍 Карелия</p>
            <p class="glamping-features">Каякинг • Сплавы • Дайвинг</p>
          </div>
        </div>

        <div class="glamping-card">
          <div class="glamping-image" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);"></div>
          <div class="glamping-info">
            <h4>Лесной экстрим</h4>
            <p class="glamping-location">📍 Урал</p>
          <p class="glamping-features">Веревочный парк • Квадроциклы • Пейнтбол</p>
          </div>
        </div>
      </div>

      <div class="view-all-link">
        <a href="<?php echo $base; ?>gift-certificate" class="btn-link">
          Посмотреть все экстремальные глэмпинги (40+) →
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
          <p>Любителю приключений</p>
        </div>
        <div class="step-card">
          <div class="step-number">4</div>
          <h4>Получите адреналин</h4>
          <p>Незабываемые эмоции</p>
        </div>
      </div>
    </section>

    <!-- Features -->
    <section class="features">
      <h2>Что включено</h2>
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">🪂</div>
          <h4>Экстремальные активности</h4>
          <p>Зиплайн, скалолазание, рафтинг, параглайдинг, каньонинг и другие виды активного отдыха</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🎿</div>
          <h4>Зимние виды спорта</h4>
          <p>Горные лыжи, сноуборд, снегоходы, тюбинг, ледолазание в зимний сезон</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🚴</div>
          <h4>Велоэкстрим</h4>
          <p>Маунтинбайк, BMX, даунхилл на специально подготовленных трассах</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🎯</div>
          <h4>Тактические игры</h4>
          <p>Пейнтбол, лазертаг, тир, стрельба из лука под руководством инструкторов</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🛡️</div>
          <h4>Безопасность</h4>
          <p>Профессиональное снаряжение, опытные инструкторы, медицинская страховка</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon">🏕️</div>
          <h4>Комфортный отдых</h4>
          <p>После адреналина - уютное проживание, баня, костер и вкусная еда</p>
        </div>
      </div>
    </section>

    <!-- Perfect For -->
    <section class="perfect-for">
      <h2>Идеально подходит для</h2>
      <div class="occasions-grid">
        <div class="occasion-card">
          <div class="occasion-icon">🎂</div>
          <h4>День рождения экстремала</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🏆</div>
          <h4>Награда за достижения</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">👫</div>
          <h4>Отдых с друзьями</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">💪</div>
          <h4>Проверка на прочность</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">🎉</div>
          <h4>Мальчишник</h4>
        </div>
        <div class="occasion-card">
          <div class="occasion-icon">⚡</div>
          <h4>Просто для адреналина</h4>
        </div>
      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
