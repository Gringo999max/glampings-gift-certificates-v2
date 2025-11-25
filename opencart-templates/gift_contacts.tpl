<?php echo $header; ?>

<!-- Common Styles -->
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<?php
$current_page = 'contacts';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="contacts-page" style="padding: 40px 0 80px;">
  <div class="container">
    <h1 class="page-title">Контакты</h1>
    <p class="section-lead">
      Мы всегда рады помочь вам с выбором идеального подарка
    </p>

    <!-- Contact Info Grid -->
    <section style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 32px; margin-bottom: 80px;">

      <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb; text-align: center;">
        <div style="font-size: 48px; margin-bottom: 20px;">📞</div>
        <h3 style="margin-bottom: 16px;">Телефон</h3>
        <p style="color: #6b7280; margin-bottom: 12px;">Горячая линия 24/7</p>
        <a href="tel:+78001234567" style="color: #10b981; font-size: 20px; font-weight: 700; text-decoration: none;">
          8 (800) 123-45-67
        </a>
        <p style="color: #9ca3af; font-size: 14px; margin-top: 8px;">Звонок бесплатный по России</p>
      </div>

      <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb; text-align: center;">
        <div style="font-size: 48px; margin-bottom: 20px;">✉️</div>
        <h3 style="margin-bottom: 16px;">Email</h3>
        <p style="color: #6b7280; margin-bottom: 12px;">Ответим в течение часа</p>
        <a href="mailto:info@glampingi.rf" style="color: #10b981; font-size: 18px; font-weight: 600; text-decoration: none;">
          info@glampingi.rf
        </a>
        <p style="color: #9ca3af; font-size: 14px; margin-top: 8px;">Пн-Вс 9:00 - 21:00 МСК</p>
      </div>

      <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb; text-align: center;">
        <div style="font-size: 48px; margin-bottom: 20px;">💬</div>
        <h3 style="margin-bottom: 16px;">Онлайн-чат</h3>
        <p style="color: #6b7280; margin-bottom: 12px;">Мгновенная помощь</p>
        <button class="btn btn-primary" style="margin-top: 8px;">
          Начать чат
        </button>
        <p style="color: #9ca3af; font-size: 14px; margin-top: 8px;">Среднее время ответа 2 мин</p>
      </div>

    </section>

    <!-- Contact Form & Info -->
    <section style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; margin-bottom: 80px;">

      <!-- Contact Form -->
      <div>
        <h2 style="margin-bottom: 24px;">Напишите нам</h2>
        <p style="color: #6b7280; margin-bottom: 32px; line-height: 1.6;">
          Заполните форму и мы свяжемся с вами в ближайшее время. Обычно отвечаем в течение часа.
        </p>

        <form style="background: white; padding: 40px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Ваше имя *</label>
            <input type="text" required style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;" placeholder="Иван Иванов">
          </div>

          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Email *</label>
            <input type="email" required style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;" placeholder="ivan@example.com">
          </div>

          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Телефон</label>
            <input type="tel" style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;" placeholder="+7 (999) 123-45-67">
          </div>

          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Тема обращения</label>
            <select style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;">
              <option>Выбор сертификата</option>
              <option>Вопрос по оплате</option>
              <option>Статус заказа</option>
              <option>Активация сертификата</option>
              <option>Корпоративный заказ</option>
              <option>Другое</option>
            </select>
          </div>

          <div style="margin-bottom: 32px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Сообщение *</label>
            <textarea rows="5" required style="width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 8px; font-size: 16px;" placeholder="Опишите ваш вопрос..."></textarea>
          </div>

          <button type="submit" class="btn btn-primary btn-large" style="width: 100%;">
            Отправить сообщение
          </button>

          <p style="text-align: center; font-size: 13px; color: #9ca3af; margin-top: 16px;">
            Нажимая кнопку, вы соглашаетесь с политикой конфиденциальности
          </p>
        </form>
      </div>

      <!-- Additional Info -->
      <div>
        <h2 style="margin-bottom: 24px;">Дополнительная информация</h2>

        <!-- Office Address -->
        <div style="background: white; padding: 32px; border-radius: 12px; margin-bottom: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="margin-bottom: 16px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 24px;">🏢</span>
            Офис в Москве
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin-bottom: 12px;">
            г. Москва, ул. Тверская, д. 1, офис 100<br>
            м. Тверская (5 мин пешком)
          </p>
          <p style="color: #9ca3af; font-size: 14px;">
            Пн-Пт: 10:00 - 19:00<br>
            Сб-Вс: выходной
          </p>
          <a href="#" class="btn-link" style="display: inline-block; margin-top: 12px;">
            Проложить маршрут →
          </a>
        </div>

        <!-- Working Hours -->
        <div style="background: white; padding: 32px; border-radius: 12px; margin-bottom: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="margin-bottom: 16px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 24px;">⏰</span>
            Режим работы поддержки
          </h4>
          <div style="color: #6b7280; line-height: 2;">
            <div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #f3f4f6;">
              <span>Понедельник - Пятница:</span>
              <span style="font-weight: 600; color: #111827;">9:00 - 21:00</span>
            </div>
            <div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #f3f4f6;">
              <span>Суббота - Воскресенье:</span>
              <span style="font-weight: 600; color: #111827;">10:00 - 20:00</span>
            </div>
            <div style="display: flex; justify-content: space-between; padding: 8px 0;">
              <span>Горячая линия:</span>
              <span style="font-weight: 600; color: #10b981;">24/7</span>
            </div>
          </div>
        </div>

        <!-- Social Media -->
        <div style="background: white; padding: 32px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="margin-bottom: 16px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 24px;">📱</span>
            Социальные сети
          </h4>
          <p style="color: #6b7280; margin-bottom: 16px;">
            Следите за нашими новостями и акциями
          </p>
          <div style="display: flex; gap: 12px; flex-wrap: wrap;">
            <a href="#" class="social-link">Telegram</a>
            <a href="#" class="social-link">WhatsApp</a>
            <a href="#" class="social-link">VK</a>
            <a href="#" class="social-link">Instagram</a>
          </div>
        </div>

      </div>

    </section>

    <!-- Map Section -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Как нас найти</h2>
      <div style="width: 100%; height: 400px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.15); display: flex; align-items: center; justify-content: center; color: white; font-size: 24px; font-weight: 600;">
        [Яндекс.Карты - интеграция]
      </div>
    </section>

    <!-- FAQ Section -->
    <section>
      <h2 style="text-align: center; margin-bottom: 48px;">Частые вопросы</h2>

      <div style="max-width: 800px; margin: 0 auto;">

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Как быстро вы отвечаете на обращения?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            В рабочее время мы отвечаем в течение 30 минут через онлайн-чат и в течение часа на email.
            В нерабочее время ответ может занять до 2-3 часов. Горячая линия работает круглосуточно.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Могу ли я приехать в офис для оформления заказа?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Да, конечно! Наш офис в Москве работает с понедельника по пятницу с 10:00 до 19:00.
            Мы рекомендуем предварительно записаться по телефону, чтобы менеджер мог подготовить
            для вас подборку лучших предложений.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Есть ли скидки для постоянных клиентов?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Да! При покупке второго сертификата вы получаете скидку 5%, при покупке третьего - 10%.
            Также у нас действует программа лояльности: за каждую покупку начисляются бонусы,
            которыми можно оплатить до 30% следующего заказа.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Как связаться с вами по поводу корпоративного заказа?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Для корпоративных клиентов у нас есть отдельный отдел. Напишите на corporate@glampingi.rf
            или позвоните по телефону 8 (800) 123-45-68 (доб. 2). Также вы можете оставить заявку
            на <a href="<?php echo $base; ?>gift-certificate/corporate" style="color: #10b981;">странице для бизнеса</a>.
          </p>
        </div>

      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
