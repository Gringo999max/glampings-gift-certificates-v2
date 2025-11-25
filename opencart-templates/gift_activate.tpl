<?php echo $header; ?>

<!-- Common Styles -->
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<?php
$current_page = 'activate';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="activate-page" style="padding: 40px 0 80px;">
  <div class="container">
    <h1 class="page-title">Активация сертификата</h1>
    <p class="section-lead">
      Введите код вашего сертификата, чтобы начать бронирование
    </p>

    <!-- Activation Form Section -->
    <section style="max-width: 600px; margin: 0 auto 80px;">
      <div style="background: white; padding: 48px 40px; border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.1);">
        <div style="text-align: center; margin-bottom: 32px;">
          <div style="font-size: 64px; margin-bottom: 16px;">🎫</div>
          <h2 style="margin-bottom: 12px;">Активируйте ваш сертификат</h2>
          <p style="color: #6b7280;">
            Код сертификата находится на лицевой стороне или в электронном письме
          </p>
        </div>

        <form>
          <div style="margin-bottom: 24px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Код сертификата *</label>
            <input
              type="text"
              required
              placeholder="XXXX-XXXX-XXXX-XXXX"
              style="width: 100%; padding: 16px 20px; border: 2px solid #e5e7eb; border-radius: 12px; font-size: 18px; font-weight: 600; text-align: center; letter-spacing: 2px; text-transform: uppercase;">
            <p style="color: #9ca3af; font-size: 14px; margin-top: 8px;">
              Введите 16-значный код без пробелов и дефисов
            </p>
          </div>

          <div style="margin-bottom: 32px;">
            <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #111827;">Email *</label>
            <input
              type="email"
              required
              placeholder="ivan@example.com"
              style="width: 100%; padding: 16px 20px; border: 2px solid #e5e7eb; border-radius: 12px; font-size: 16px;">
            <p style="color: #9ca3af; font-size: 14px; margin-top: 8px;">
              На этот email придет подтверждение активации
            </p>
          </div>

          <button type="submit" class="btn btn-primary btn-large" style="width: 100%;">
            Активировать сертификат
          </button>
        </form>

        <div style="margin-top: 32px; padding-top: 32px; border-top: 1px solid #e5e7eb; text-align: center;">
          <p style="color: #6b7280; margin-bottom: 12px;">Не можете найти код?</p>
          <a href="<?php echo $base; ?>gift-certificate/contacts" class="btn-link">
            Связаться со службой поддержки →
          </a>
        </div>
      </div>
    </section>

    <!-- How Activation Works -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Как работает активация</h2>

      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px;">

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="width: 56px; height: 56px; background: #d1fae5; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px;">
            <span style="font-size: 28px; font-weight: 800; color: #065f46;">1</span>
          </div>
          <h4 style="margin-bottom: 12px;">Введите код</h4>
          <p style="color: #6b7280; font-size: 14px; line-height: 1.5;">
            Код из 16 символов находится на вашем сертификате
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="width: 56px; height: 56px; background: #dbeafe; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px;">
            <span style="font-size: 28px; font-weight: 800; color: #1e40af;">2</span>
          </div>
          <h4 style="margin-bottom: 12px;">Проверка</h4>
          <p style="color: #6b7280; font-size: 14px; line-height: 1.5;">
            Система проверит код и покажет номинал сертификата
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="width: 56px; height: 56px; background: #fef3c7; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px;">
            <span style="font-size: 28px; font-weight: 800; color: #92400e;">3</span>
          </div>
          <h4 style="margin-bottom: 12px;">Выбор глэмпинга</h4>
          <p style="color: #6b7280; font-size: 14px; line-height: 1.5;">
            Откроется каталог доступных глэмпингов
          </p>
        </div>

        <div style="text-align: center; padding: 32px 24px; background: white; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="width: 56px; height: 56px; background: #e0e7ff; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px;">
            <span style="font-size: 28px; font-weight: 800; color: #3730a3;">4</span>
          </div>
          <h4 style="margin-bottom: 12px;">Бронирование</h4>
          <p style="color: #6b7280; font-size: 14px; line-height: 1.5;">
            Выберите даты и получите подтверждение
          </p>
        </div>

      </div>
    </section>

    <!-- Certificate Status Check -->
    <section style="background: #f9fafb; padding: 60px 40px; border-radius: 20px; margin-bottom: 80px;">
      <div style="max-width: 600px; margin: 0 auto; text-align: center;">
        <h2 style="margin-bottom: 16px;">Проверить статус сертификата</h2>
        <p style="color: #6b7280; margin-bottom: 32px;">
          Хотите узнать, активирован ли ваш сертификат или проверить остаток средств?
        </p>

        <div style="display: flex; gap: 16px; max-width: 500px; margin: 0 auto;">
          <input
            type="text"
            placeholder="Введите код сертификата"
            style="flex: 1; padding: 14px 20px; border: 2px solid #e5e7eb; border-radius: 12px; font-size: 16px; background: white;">
          <button class="btn btn-secondary">
            Проверить
          </button>
        </div>
      </div>
    </section>

    <!-- Important Information -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Важная информация</h2>

      <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 32px;">

        <div style="background: linear-gradient(135deg, #f0fdf4 0%, #d1fae5 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #10b981;">
          <h3 style="color: #065f46; margin-bottom: 16px; font-size: 22px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 32px;">✅</span>
            Что нужно знать
          </h3>
          <ul style="list-style: none; padding: 0; color: #047857;">
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(16,185,129,0.2);">
              ✓ Срок действия сертификата - 12 месяцев
            </li>
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(16,185,129,0.2);">
              ✓ Активация бесплатная и мгновенная
            </li>
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(16,185,129,0.2);">
              ✓ Можно использовать частями
            </li>
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(16,185,129,0.2);">
              ✓ Остаток сохраняется на балансе
            </li>
            <li style="padding: 12px 0;">
              ✓ Можно доплатить, если не хватает
            </li>
          </ul>
        </div>

        <div style="background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%); padding: 40px; border-radius: 16px; border-left: 4px solid #f59e0b;">
          <h3 style="color: #92400e; margin-bottom: 16px; font-size: 22px; display: flex; align-items: center; gap: 12px;">
            <span style="font-size: 32px;">⚠️</span>
            Важно помнить
          </h3>
          <ul style="list-style: none; padding: 0; color: #78350f;">
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(245,158,11,0.2);">
              • Код активируется только один раз
            </li>
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(245,158,11,0.2);">
              • Не передавайте код третьим лицам
            </li>
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(245,158,11,0.2);">
              • Проверьте email для подтверждения
            </li>
            <li style="padding: 12px 0; border-bottom: 1px solid rgba(245,158,11,0.2);">
              • Бронируйте заранее в высокий сезон
            </li>
            <li style="padding: 12px 0;">
              • Сохраните код до полного использования
            </li>
          </ul>
        </div>

      </div>
    </section>

    <!-- FAQ -->
    <section>
      <h2 style="text-align: center; margin-bottom: 48px;">Частые вопросы об активации</h2>

      <div style="max-width: 800px; margin: 0 auto;">

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Могу ли я активировать сертификат частями?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Активация происходит один раз на полную сумму. Однако вы можете использовать сертификат
            частями для разных бронирований. Неиспользованная сумма сохраняется на вашем балансе.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Что делать, если код не активируется?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Проверьте правильность ввода кода (возможно перепутаны цифра "0" и буква "O").
            Если проблема сохраняется, свяжитесь со службой поддержки по телефону 8 (800) 123-45-67
            или через онлайн-чат. Мы поможем вам в течение 15 минут.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Нужно ли активировать сертификат сразу после покупки?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Нет, срок действия 12 месяцев начинается с даты покупки, а не с момента активации.
            Вы можете активировать сертификат в любое удобное время, когда будете готовы к бронированию.
            Это особенно удобно для подарочных сертификатов.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; margin-bottom: 16px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Могу ли я передать активированный сертификат другому человеку?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Да, после активации сертификат привязывается к email адресу, который можно изменить
            через службу поддержки. Важно: код самого сертификата передавать не рекомендуется,
            так как активация необратима и происходит на тот email, который указан при активации.
          </p>
        </div>

        <div style="background: white; padding: 28px 32px; border-radius: 12px; border-left: 4px solid #10b981; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
          <h4 style="color: #111827; margin-bottom: 12px; font-size: 18px;">
            Что произойдет после успешной активации?
          </h4>
          <p style="color: #6b7280; line-height: 1.6; margin: 0;">
            Вы получите письмо с подтверждением активации и ссылкой на каталог глэмпингов.
            В вашем личном кабинете появится баланс, равный номиналу сертификата. Вы сможете
            сразу выбрать глэмпинг, даты заезда и забронировать отдых. Подтверждение бронирования
            приходит мгновенно.
          </p>
        </div>

      </div>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
