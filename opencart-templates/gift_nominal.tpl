<?php echo $header; ?>

<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_certificate_type.css">

<?php
$current_page = 'certificates';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="certificate-type-page nominal">
  <div class="container">

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <span class="badge" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white;">💎 Сертификат по номиналу</span>
        <h1>Подарочный сертификат<br>на любую сумму</h1>
        <p class="lead">Универсальный сертификат на сумму по вашему выбору - получатель сам решит, куда и когда поехать</p>
        <div class="hero-badges">
          <span class="badge-pill">💰 Любая сумма от 5000₽</span>
          <span class="badge-pill">🗺️ 200+ глэмпингов</span>
          <span class="badge-pill">🎯 Максимальная свобода выбора</span>
        </div>
      </div>
      <div class="hero-image">
        <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/nominal-hero.jpg"
             alt="Подарочный сертификат на любую сумму">
      </div>
    </section>

    <!-- Certificate Selector -->
    <section class="certificate-selector">
      <h2>Выберите номинал сертификата</h2>

      <div class="amount-grid">
        <div class="amount-card" data-amount="5000">
          <div class="amount-value">5 000 ₽</div>
          <div class="amount-nights">Мини-сертификат</div>
          <div class="amount-note">Доплата или скромный подарок</div>
        </div>

        <div class="amount-card" data-amount="10000">
          <div class="amount-value">10 000 ₽</div>
          <div class="amount-nights">Стандартный</div>
          <div class="amount-note">1-2 ночи в глэмпинге</div>
        </div>

        <div class="amount-card popular" data-amount="15000">
          <div class="popular-badge">Популярно</div>
          <div class="amount-value">15 000 ₽</div>
          <div class="amount-nights">Оптимальный</div>
          <div class="amount-note">2-3 ночи с комфортом</div>
        </div>

        <div class="amount-card" data-amount="25000">
          <div class="amount-value">25 000 ₽</div>
          <div class="amount-nights">Расширенный</div>
          <div class="amount-note">Полноценный отпуск</div>
        </div>
      </div>

      <!-- Custom Amount -->
      <div class="custom-amount-section" style="margin: 40px 0; padding: 40px; background: #f9fafb; border-radius: 16px;">
        <h3 style="text-align: center; margin-bottom: 24px;">Или введите свою сумму</h3>
        <div style="max-width: 400px; margin: 0 auto;">
          <div style="position: relative;">
            <input
              type="number"
              min="5000"
              step="1000"
              placeholder="Введите сумму от 5 000₽"
              style="width: 100%; padding: 16px 20px; padding-right: 60px; border: 2px solid #e5e7eb; border-radius: 12px; font-size: 20px; font-weight: 600; text-align: center;">
            <span style="position: absolute; right: 20px; top: 50%; transform: translateY(-50%); font-size: 20px; font-weight: 600; color: #6b7280;">₽</span>
          </div>
          <p style="color: #6b7280; font-size: 14px; text-align: center; margin-top: 12px;">
            Минимальная сумма: 5 000₽ • Кратность: 1 000₽
          </p>
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

    <!-- Advantages Section -->
    <section style="background: #f9fafb; padding: 60px 40px; border-radius: 20px; margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Преимущества номинального сертификата</h2>

      <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 32px;">

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 56px; margin-bottom: 20px;">🎯</div>
          <h4 style="margin-bottom: 12px;">Свобода выбора</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Получатель сам выбирает глэмпинг, тип отдыха и даты - максимальная гибкость
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 56px; margin-bottom: 20px;">💰</div>
          <h4 style="margin-bottom: 12px;">Точная сумма</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Выберите любую сумму, которая вам удобна - от 5000₽ без ограничения сверху
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 56px; margin-bottom: 20px;">🌍</div>
          <h4 style="margin-bottom: 12px;">Все локации</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Действует во всех 200+ партнерских глэмпингах по всей России
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 56px; margin-bottom: 20px;">📅</div>
          <h4 style="margin-bottom: 12px;">Гибкие даты</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Используйте когда удобно - сертификат действует 12 месяцев
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 56px; margin-bottom: 20px;">🔄</div>
          <h4 style="margin-bottom: 12px;">Частичное использование</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Можно использовать по частям - остаток сохраняется на балансе
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 56px; margin-bottom: 20px;">➕</div>
          <h4 style="margin-bottom: 12px;">Доплата</h4>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Если сумма не покрывает выбранный глэмпинг - просто доплатите разницу
          </p>
        </div>

      </div>
    </section>

    <!-- How It Works Brief -->
    <section class="how-it-works-brief">
      <h2>Как это работает</h2>
      <div class="steps-grid">
        <div class="step-card">
          <div class="step-number">1</div>
          <h4>Выберите сумму</h4>
          <p>Любую от 5000₽ или введите свою</p>
        </div>
        <div class="step-card">
          <div class="step-number">2</div>
          <h4>Оформите заказ</h4>
          <p>И выберите формат получения</p>
        </div>
        <div class="step-card">
          <div class="step-number">3</div>
          <h4>Подарите</h4>
          <p>Сертификат близкому человеку</p>
        </div>
        <div class="step-card">
          <div class="step-number">4</div>
          <h4>Активируйте</h4>
          <p>Выберите любой глэмпинг из 200+</p>
        </div>
      </div>
    </section>

    <!-- Use Cases -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Идеально подходит для</h2>

      <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 32px;">

        <div style="background: linear-gradient(135deg, #f0fdf4 0%, #d1fae5 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #10b981;">
          <h3 style="color: #065f46; margin-bottom: 16px; font-size: 22px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 32px;">🎁</span>
            Когда не знаете предпочтения
          </h3>
          <p style="color: #047857; line-height: 1.6;">
            Не уверены, какой тип отдыха понравится? Номинальный сертификат - универсальное решение.
            Получатель сам выберет то, что ему по душе: романтику, экстрим, семейный отдых или релакс.
          </p>
        </div>

        <div style="background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #3b82f6;">
          <h3 style="color: #1e40af; margin-bottom: 16px; font-size: 22px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 32px;">💼</span>
            Корпоративные подарки
          </h3>
          <p style="color: #1e3a8a; line-height: 1.6;">
            Идеально для массовых корпоративных заказов. Все сертификаты одного номинала, но каждый
            сотрудник выбирает отдых по своему вкусу. Справедливо и удобно.
          </p>
        </div>

        <div style="background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #f59e0b;">
          <h3 style="color: #92400e; margin-bottom: 16px; font-size: 22px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 32px;">🎯</span>
            Точный бюджет
          </h3>
          <p style="color: #78350f; line-height: 1.6;">
            Нужна определенная сумма? Просто введите ее. Хотите подарить ровно 17 500₽? Пожалуйста!
            Никаких ограничений по номиналам - только ваш бюджет.
          </p>
        </div>

        <div style="background: linear-gradient(135deg, #fce7f3 0%, #fbcfe8 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #ec4899;">
          <h3 style="color: #9f1239; margin-bottom: 16px; font-size: 22px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 32px;">👥</span>
            Складчина на подарок
          </h3>
          <p style="color: #881337; line-height: 1.6;">
            Коллеги скидываются на подарок коллеге? Номинальный сертификат - лучшее решение.
            Соберите нужную сумму, закажите сертификат - получатель выберет отдых сам.
          </p>
        </div>

      </div>
    </section>

    <!-- FAQ -->
    <section>
      <h2 style="text-align: center; margin-bottom: 48px;">Часто задаваемые вопросы</h2>

      <div style="max-width: 800px; margin: 0 auto;">

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Какая минимальная и максимальная сумма?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Минимальная сумма - 5000₽. Максимальной суммы нет - вы можете выбрать любой номинал.
            Сумма должна быть кратна 1000₽ (например, 7000₽, 12500₽ не подойдет).
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Чем отличается от тематических сертификатов?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Тематические сертификаты (Pet-Friendly, Романтик и т.д.) дают доступ к определенной категории
            глэмпингов. Номинальный сертификат универсален - действует везде, на любой тип отдыха.
            Максимальная свобода выбора!
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Можно ли объединить несколько сертификатов?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Да! При бронировании вы можете использовать несколько сертификатов одновременно.
            Например, если есть два сертификата по 10000₽ - можете забронировать глэмпинг на 20000₽.
            Удобно для дорогих направлений.
          </p>
        </div>

      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
