<?php echo $header; ?>

<!-- Common Styles -->
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<?php
$current_page = 'corporate';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="corporate-page" style="padding: 40px 0 80px;">
  <div class="container">

    <!-- Hero Section -->
    <section style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center; margin-bottom: 80px; padding: 40px 0;">
      <div>
        <span style="display: inline-block; padding: 8px 16px; background: #dbeafe; color: #1e40af; border-radius: 24px; font-size: 14px; font-weight: 600; margin-bottom: 16px;">
          B2B РЕШЕНИЯ
        </span>
        <h1 style="font-size: 52px; line-height: 1.1; margin: 16px 0 20px; color: #111827;">
          Корпоративные подарочные сертификаты
        </h1>
        <p style="font-size: 20px; color: #6b7280; margin-bottom: 32px; line-height: 1.6;">
          Укрепляйте команду и мотивируйте сотрудников с помощью уникальных впечатлений от отдыха в глэмпингах
        </p>
        <div style="display: flex; gap: 12px; flex-wrap: wrap; margin-bottom: 32px;">
          <span style="padding: 10px 20px; background: #f3f4f6; border-radius: 24px; font-size: 15px; color: #4b5563; font-weight: 500;">
            ✓ Персональный менеджер
          </span>
          <span style="padding: 10px 20px; background: #f3f4f6; border-radius: 24px; font-size: 15px; color: #4b5563; font-weight: 500;">
            ✓ Скидки от 10%
          </span>
          <span style="padding: 10px 20px; background: #f3f4f6; border-radius: 24px; font-size: 15px; color: #4b5563; font-weight: 500;">
            ✓ Оплата по счету
          </span>
        </div>
        <div style="display: flex; gap: 16px;">
          <a href="#request-form" class="btn btn-primary btn-large">
            Оставить заявку
          </a>
          <a href="<?php echo $base; ?>gift-certificate/contacts" class="btn btn-secondary btn-large">
            Связаться с нами
          </a>
        </div>
      </div>
      <div style="height: 500px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.15);"></div>
    </section>

    <!-- Benefits Section -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Почему компании выбирают нас</h2>

      <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 32px;">

        <div style="text-align: center; padding: 40px 32px; background: white; border: 2px solid #e5e7eb; border-radius: 16px; transition: all 0.3s ease;">
          <div style="font-size: 56px; margin-bottom: 20px;">🎯</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Уникальная мотивация</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Сертификаты на отдых гораздо эффективнее денежных премий. Сотрудники получают незабываемые впечатления и благодарны компании
          </p>
        </div>

        <div style="text-align: center; padding: 40px 32px; background: white; border: 2px solid #e5e7eb; border-radius: 16px; transition: all 0.3s ease;">
          <div style="font-size: 56px; margin-bottom: 20px;">💼</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Простота закупки</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Один договор, одна заявка, один счет. Работа с юридическими лицами, НДС, полный пакет документов
          </p>
        </div>

        <div style="text-align: center; padding: 40px 32px; background: white; border: 2px solid #e5e7eb; border-radius: 16px; transition: all 0.3s ease;">
          <div style="font-size: 56px; margin-bottom: 20px;">⚡</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Быстрая доставка</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Курьерская доставка по Москве за 2 часа. По России - 2-3 дня. Электронные сертификаты - мгновенно
          </p>
        </div>

        <div style="text-align: center; padding: 40px 32px; background: white; border: 2px solid #e5e7eb; border-radius: 16px; transition: all 0.3s ease;">
          <div style="font-size: 56px; margin-bottom: 20px;">🎨</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Брендирование</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Разработаем индивидуальный дизайн с вашим логотипом и корпоративными цветами. Персонализация каждого сертификата
          </p>
        </div>

        <div style="text-align: center; padding: 40px 32px; background: white; border: 2px solid #e5e7eb; border-radius: 16px; transition: all 0.3s ease;">
          <div style="font-size: 56px; margin-bottom: 20px;">💰</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Выгодные условия</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Скидки от 10% при заказе от 10 сертификатов. Индивидуальные условия для крупных заказов. Программа лояльности
          </p>
        </div>

        <div style="text-align: center; padding: 40px 32px; background: white; border: 2px solid #e5e7eb; border-radius: 16px; transition: all 0.3s ease;">
          <div style="font-size: 56px; margin-bottom: 20px;">📊</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Отчетность</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.5;">
            Личный кабинет с аналитикой использования сертификатов. Отчеты по активациям и бронированиям
          </p>
        </div>

      </div>
    </section>

    <!-- Use Cases Section -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Для каких целей подходит</h2>

      <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 32px;">

        <div style="background: linear-gradient(135deg, #f0fdf4 0%, #d1fae5 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #10b981;">
          <h3 style="color: #065f46; margin-bottom: 16px; font-size: 24px;">🎉 Корпоративные подарки</h3>
          <p style="color: #047857; line-height: 1.6; margin-bottom: 16px;">
            На Новый год, 8 марта, 23 февраля, день компании. Универсальный подарок, который понравится всем сотрудникам
          </p>
          <ul style="list-style: none; padding: 0; color: #065f46;">
            <li style="padding: 8px 0;">✓ Подарки для сотрудников</li>
            <li style="padding: 8px 0;">✓ Презенты для партнеров</li>
            <li style="padding: 8px 0;">✓ Поощрение клиентов</li>
          </ul>
        </div>

        <div style="background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #3b82f6;">
          <h3 style="color: #1e40af; margin-bottom: 16px; font-size: 24px;">🏆 Мотивация и награды</h3>
          <p style="color: #1e3a8a; line-height: 1.6; margin-bottom: 16px;">
            Премии за достижения, бонусы лучшим сотрудникам, призы за выполнение KPI. Эффективнее денежных выплат
          </p>
          <ul style="list-style: none; padding: 0; color: #1e40af;">
            <li style="padding: 8px 0;">✓ Премии и бонусы</li>
            <li style="padding: 8px 0;">✓ Конкурсы и соревнования</li>
            <li style="padding: 8px 0;">✓ Юбилеи сотрудников</li>
          </ul>
        </div>

        <div style="background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #f59e0b;">
          <h3 style="color: #92400e; margin-bottom: 16px; font-size: 24px;">🤝 Тимбилдинг</h3>
          <p style="color: #78350f; line-height: 1.6; margin-bottom: 16px;">
            Корпоративные выезды, тимбилдинги на природе. Сертификаты для организации командных мероприятий
          </p>
          <ul style="list-style: none; padding: 0; color: #92400e;">
            <li style="padding: 8px 0;">✓ Командные выезды</li>
            <li style="padding: 8px 0;">✓ Стратегические сессии</li>
            <li style="padding: 8px 0;">✓ Корпоративные праздники</li>
          </ul>
        </div>

        <div style="background: linear-gradient(135deg, #fce7f3 0%, #fbcfe8 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #ec4899;">
          <h3 style="color: #9f1239; margin-bottom: 16px; font-size: 24px;">💝 HR-программы</h3>
          <p style="color: #881337; line-height: 1.6; margin-bottom: 16px;">
            Социальный пакет, компенсация отпуска, программы well-being. Забота о сотрудниках через впечатления
          </p>
          <ul style="list-style: none; padding: 0; color: #9f1239;">
            <li style="padding: 8px 0;">✓ Социальный пакет</li>
            <li style="padding: 8px 0;">✓ Программы wellness</li>
            <li style="padding: 8px 0;">✓ Адаптация новичков</li>
          </ul>
        </div>

      </div>
    </section>

    <!-- Pricing Section -->
    <section style="background: #f9fafb; padding: 60px 40px; border-radius: 20px; margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Корпоративные тарифы</h2>

      <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 32px;">

        <div style="background: white; padding: 40px 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08); text-align: center;">
          <h3 style="margin-bottom: 8px; font-size: 24px;">Старт</h3>
          <div style="font-size: 48px; font-weight: 800; color: #10b981; margin: 20px 0;">-10%</div>
          <p style="color: #6b7280; margin-bottom: 24px;">От 10 сертификатов</p>
          <ul style="list-style: none; padding: 0; text-align: left; margin-bottom: 32px;">
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Скидка 10%</li>
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Оплата по счету</li>
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Полный пакет документов</li>
            <li style="padding: 12px 0; color: #4b5563;">✓ Стандартная доставка</li>
          </ul>
          <a href="#request-form" class="btn btn-secondary" style="width: 100%;">Оставить заявку</a>
        </div>

        <div style="background: white; padding: 40px 32px; border-radius: 16px; box-shadow: 0 8px 24px rgba(16,185,129,0.15); text-align: center; border: 2px solid #10b981; position: relative;">
          <span style="position: absolute; top: -12px; left: 50%; transform: translateX(-50%); background: #10b981; color: white; padding: 4px 16px; border-radius: 12px; font-size: 12px; font-weight: 700;">ПОПУЛЯРНЫЙ</span>
          <h3 style="margin-bottom: 8px; font-size: 24px;">Бизнес</h3>
          <div style="font-size: 48px; font-weight: 800; color: #10b981; margin: 20px 0;">-15%</div>
          <p style="color: #6b7280; margin-bottom: 24px;">От 50 сертификатов</p>
          <ul style="list-style: none; padding: 0; text-align: left; margin-bottom: 32px;">
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Скидка 15%</li>
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Персональный менеджер</li>
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Брендирование</li>
            <li style="padding: 12px 0; color: #4b5563;">✓ Приоритетная доставка</li>
          </ul>
          <a href="#request-form" class="btn btn-primary" style="width: 100%;">Оставить заявку</a>
        </div>

        <div style="background: white; padding: 40px 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08); text-align: center;">
          <h3 style="margin-bottom: 8px; font-size: 24px;">Премиум</h3>
          <div style="font-size: 48px; font-weight: 800; color: #10b981; margin: 20px 0;">-20%</div>
          <p style="color: #6b7280; margin-bottom: 24px;">От 100 сертификатов</p>
          <ul style="list-style: none; padding: 0; text-align: left; margin-bottom: 32px;">
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Скидка 20%</li>
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Выделенный менеджер</li>
            <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">✓ Индивидуальный дизайн</li>
            <li style="padding: 12px 0; color: #4b5563;">✓ Личный кабинет с аналитикой</li>
          </ul>
          <a href="#request-form" class="btn btn-secondary" style="width: 100%;">Оставить заявку</a>
        </div>

      </div>
    </section>

    <!-- Clients Section -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 24px;">Нам доверяют</h2>
      <p style="text-align: center; color: #6b7280; font-size: 18px; margin-bottom: 48px;">
        Более 500 компаний уже используют наши сертификаты для мотивации сотрудников
      </p>

      <div style="display: grid; grid-template-columns: repeat(5, 1fr); gap: 32px;">
        <div style="background: white; padding: 40px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); display: flex; align-items: center; justify-content: center;">
          <span style="font-size: 24px; font-weight: 700; color: #9ca3af;">Company 1</span>
        </div>
        <div style="background: white; padding: 40px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); display: flex; align-items: center; justify-content: center;">
          <span style="font-size: 24px; font-weight: 700; color: #9ca3af;">Company 2</span>
        </div>
        <div style="background: white; padding: 40px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); display: flex; align-items: center; justify-content: center;">
          <span style="font-size: 24px; font-weight: 700; color: #9ca3af;">Company 3</span>
        </div>
        <div style="background: white; padding: 40px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); display: flex; align-items: center; justify-content: center;">
          <span style="font-size: 24px; font-weight: 700; color: #9ca3af;">Company 4</span>
        </div>
        <div style="background: white; padding: 40px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); display: flex; align-items: center; justify-content: center;">
          <span style="font-size: 24px; font-weight: 700; color: #9ca3af;">Company 5</span>
        </div>
      </div>
    </section>

    <!-- Request Form Section -->
    <section id="request-form" style="background: linear-gradient(135deg, #f0fdf4 0%, #dbeafe 100%); padding: 60px 40px; border-radius: 20px;">
      <div style="max-width: 600px; margin: 0 auto;">
        <h2 style="text-align: center; margin-bottom: 16px;">Оставьте заявку</h2>
        <p style="text-align: center; color: #6b7280; margin-bottom: 40px;">
          Наш менеджер свяжется с вами в течение 30 минут и подготовит индивидуальное предложение
        </p>

        <form style="background: white; padding: 40px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Название компании *</label>
            <input type="text" required style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;">
          </div>

          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Контактное лицо *</label>
            <input type="text" required style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;">
          </div>

          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Телефон *</label>
            <input type="tel" required style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;">
          </div>

          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Email *</label>
            <input type="email" required style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;">
          </div>

          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Количество сертификатов</label>
            <select style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;">
              <option>10-50</option>
              <option>50-100</option>
              <option>100-200</option>
              <option>Более 200</option>
            </select>
          </div>

          <div style="margin-bottom: 32px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Комментарий</label>
            <textarea rows="4" style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;"></textarea>
          </div>

          <button type="submit" class="btn btn-primary btn-large" style="width: 100%;">
            Отправить заявку
          </button>

          <p style="text-align: center; font-size: 13px; color: #9ca3af; margin-top: 16px;">
            Нажимая кнопку, вы соглашаетесь с политикой конфиденциальности
          </p>
        </form>
      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
