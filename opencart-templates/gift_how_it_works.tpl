<?php echo $header; ?>

<!-- Common Styles -->
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<?php
$current_page = 'how-it-works';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="how-it-works-page" style="padding: 40px 0 80px;">
  <div class="container">
    <h1 class="page-title">Как это работает</h1>
    <p class="section-lead">
      Простой процесс от покупки до незабываемого отдыха всего за 4 шага
    </p>

    <!-- Main Steps Section -->
    <section style="background: #f9fafb; padding: 60px 40px; border-radius: 20px; margin-bottom: 80px;">
      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 40px; position: relative;">

        <!-- Connecting Line -->
        <div style="position: absolute; top: 32px; left: 12.5%; right: 12.5%; height: 4px; background: linear-gradient(90deg, #10b981 0%, #10b981 33%, #10b981 66%, #10b981 100%); z-index: 0;"></div>

        <!-- Step 1 -->
        <div style="text-align: center; position: relative; z-index: 1;">
          <div style="width: 64px; height: 64px; background: #10b981; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: 800; margin: 0 auto 24px; box-shadow: 0 4px 16px rgba(16, 185, 129, 0.3); border: 4px solid #f9fafb;">
            1
          </div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Выбор сертификата</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Выберите тип отдыха, номинал и формат получения (электронный, в конверте или подарочной коробке)
          </p>
        </div>

        <!-- Step 2 -->
        <div style="text-align: center; position: relative; z-index: 1;">
          <div style="width: 64px; height: 64px; background: #10b981; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: 800; margin: 0 auto 24px; box-shadow: 0 4px 16px rgba(16, 185, 129, 0.3); border: 4px solid #f9fafb;">
            2
          </div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Оформление заказа</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Заполните форму, добавьте персональное поздравление и оплатите удобным способом
          </p>
        </div>

        <!-- Step 3 -->
        <div style="text-align: center; position: relative; z-index: 1;">
          <div style="width: 64px; height: 64px; background: #10b981; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: 800; margin: 0 auto 24px; box-shadow: 0 4px 16px rgba(16, 185, 129, 0.3); border: 4px solid #f9fafb;">
            3
          </div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Получение сертификата</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Электронный сертификат приходит мгновенно на email. Физический доставляется курьером или почтой
          </p>
        </div>

        <!-- Step 4 -->
        <div style="text-align: center; position: relative; z-index: 1;">
          <div style="width: 64px; height: 64px; background: #10b981; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: 800; margin: 0 auto 24px; box-shadow: 0 4px 16px rgba(16, 185, 129, 0.3); border: 4px solid #f9fafb;">
            4
          </div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Использование</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Активируйте сертификат на сайте, выберите глэмпинг и даты. Бронирование подтверждается автоматически
          </p>
        </div>

      </div>
    </section>

    <!-- Detailed Process -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Подробнее о каждом шаге</h2>

      <div style="display: flex; flex-direction: column; gap: 48px;">

        <!-- Detail 1 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;">
          <div>
            <span style="display: inline-block; padding: 8px 16px; background: #d1fae5; color: #065f46; border-radius: 24px; font-size: 14px; font-weight: 600; margin-bottom: 16px;">
              ШАГ 1
            </span>
            <h3 style="font-size: 32px; margin-bottom: 20px;">Выбор идеального сертификата</h3>
            <p style="color: #6b7280; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
              У нас есть 6 типов сертификатов на любой вкус: от романтических до экстремальных.
              Выбирайте номинал от 10 000₽ до 50 000₽ или закажите сертификат на любую сумму.
            </p>
            <ul style="list-style: none; padding: 0;">
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                ✓ Более 200 глэмпингов по всей России
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                ✓ Персонализация дизайна сертификата
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                ✓ Возможность добавить личное поздравление
              </li>
              <li style="padding: 12px 0; color: #4b5563;">
                ✓ Срок действия 12 месяцев с даты покупки
              </li>
            </ul>
          </div>
          <div style="height: 400px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.15);"></div>
        </div>

        <!-- Detail 2 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;">
          <div style="height: 400px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.15);"></div>
          <div>
            <span style="display: inline-block; padding: 8px 16px; background: #dbeafe; color: #1e40af; border-radius: 24px; font-size: 14px; font-weight: 600; margin-bottom: 16px;">
              ШАГ 2
            </span>
            <h3 style="font-size: 32px; margin-bottom: 20px;">Простое оформление заказа</h3>
            <p style="color: #6b7280; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
              Интуитивная форма заказа занимает всего 2 минуты. Укажите данные получателя,
              выберите способ доставки и оплатите любым удобным способом.
            </p>
            <ul style="list-style: none; padding: 0;">
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                💳 Оплата картой любого банка
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                🔒 Безопасность платежей гарантирована
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                📧 Автоматическое подтверждение на email
              </li>
              <li style="padding: 12px 0; color: #4b5563;">
                📱 Чек и счет для юридических лиц
              </li>
            </ul>
          </div>
        </div>

        <!-- Detail 3 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;">
          <div>
            <span style="display: inline-block; padding: 8px 16px; background: #fef3c7; color: #92400e; border-radius: 24px; font-size: 14px; font-weight: 600; margin-bottom: 16px;">
              ШАГ 3
            </span>
            <h3 style="font-size: 32px; margin-bottom: 20px;">Получение сертификата</h3>
            <p style="color: #6b7280; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
              Выберите удобный способ получения: моментально на email, курьерская доставка
              или самовывоз из нашего офиса. Упаковка премиум-класса для физических сертификатов.
            </p>
            <ul style="list-style: none; padding: 0;">
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                📧 Электронный - мгновенно и бесплатно
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                🚚 Курьер - доставка за 2-4 часа (Москва)
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                📮 Почта России - по всей стране за 3-7 дней
              </li>
              <li style="padding: 12px 0; color: #4b5563;">
                🎁 Красивая подарочная упаковка в комплекте
              </li>
            </ul>
          </div>
          <div style="height: 400px; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.15);"></div>
        </div>

        <!-- Detail 4 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;">
          <div style="height: 400px; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.15);"></div>
          <div>
            <span style="display: inline-block; padding: 8px 16px; background: #e0e7ff; color: #3730a3; border-radius: 24px; font-size: 14px; font-weight: 600; margin-bottom: 16px;">
              ШАГ 4
            </span>
            <h3 style="font-size: 32px; margin-bottom: 20px;">Активация и использование</h3>
            <p style="color: #6b7280; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
              Активируйте сертификат на нашем сайте, введя уникальный код. Выберите глэмпинг из каталога,
              укажите желаемые даты и получите мгновенное подтверждение бронирования.
            </p>
            <ul style="list-style: none; padding: 0;">
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                🔑 Уникальный код активации на каждом сертификате
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                📅 Бронирование онлайн 24/7
              </li>
              <li style="padding: 12px 0; border-bottom: 1px solid #e5e7eb; color: #4b5563;">
                ✅ Мгновенное подтверждение
              </li>
              <li style="padding: 12px 0; color: #4b5563;">
                📞 Поддержка клиентов по любым вопросам
              </li>
            </ul>
          </div>
        </div>

      </div>
    </section>

    <!-- FAQ Section -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Часто задаваемые вопросы</h2>

      <div style="max-width: 800px; margin: 0 auto;">

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Как долго действует сертификат?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Стандартный срок действия сертификата - 12 месяцев с даты покупки. Вы можете использовать его
            в любое время в течение этого периода. При необходимости срок можно продлить, связавшись с нашей
            службой поддержки.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Можно ли обменять или вернуть сертификат?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Неиспользованный сертификат можно обменять на другой номинал или тип в течение 14 дней с момента
            покупки. Возврат денежных средств возможен в течение 7 дней при условии, что сертификат не был
            активирован.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Что делать, если номинала сертификата не хватает?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Вы можете доплатить разницу при бронировании. Также можно использовать несколько сертификатов
            одновременно для одного бронирования. Если номинал больше стоимости проживания, остаток сохраняется
            на балансе для следующих бронирований.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Можно ли подарить сертификат другому человеку?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Да, сертификаты свободно передаются. При активации получатель указывает свои данные.
            Вы также можете оформить сертификат сразу на имя получателя и добавить персональное поздравление.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Как происходит бронирование глэмпинга?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            После активации сертификата вы получаете доступ к каталогу глэмпингов. Выберите понравившийся,
            укажите даты и количество гостей. Система проверит доступность и мгновенно подтвердит бронирование.
            Все детали придут на email.
          </p>
        </div>

      </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
      <h2>Готовы подарить незабываемые впечатления?</h2>
      <p style="font-size: 18px; color: #6b7280; margin-bottom: 32px;">
        Процесс простой, быстрый и понятный. Начните прямо сейчас!
      </p>
      <div style="display: flex; gap: 16px; justify-content: center;">
        <a href="<?php echo $base; ?>gift-certificate" class="btn btn-primary btn-large">
          Выбрать сертификат
        </a>
        <a href="<?php echo $base; ?>gift-certificate/contacts" class="btn btn-secondary btn-large">
          Задать вопрос
        </a>
      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
