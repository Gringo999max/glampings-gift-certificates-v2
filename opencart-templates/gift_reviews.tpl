<?php echo $header; ?>

<!-- Common Styles -->
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<?php
$current_page = 'reviews';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="reviews-page">
  <div class="container">
    <h1 class="page-title">Отзывы наших клиентов</h1>
    <p class="section-lead">
      Более 5000 довольных клиентов уже подарили незабываемые впечатления с нашими сертификатами
    </p>

    <!-- Statistics Section -->
    <section class="stats-section" style="margin-bottom: 80px;">
      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px;">
        <div style="text-align: center; padding: 32px; background: white; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="font-size: 48px; font-weight: 800; color: #10b981; margin-bottom: 8px;">5000+</div>
          <div style="color: #6b7280; font-size: 16px;">Довольных клиентов</div>
        </div>
        <div style="text-align: center; padding: 32px; background: white; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="font-size: 48px; font-weight: 800; color: #10b981; margin-bottom: 8px;">4.9</div>
          <div style="color: #6b7280; font-size: 16px;">Средняя оценка</div>
        </div>
        <div style="text-align: center; padding: 32px; background: white; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="font-size: 48px; font-weight: 800; color: #10b981; margin-bottom: 8px;">98%</div>
          <div style="color: #6b7280; font-size: 16px;">Рекомендуют друзьям</div>
        </div>
        <div style="text-align: center; padding: 32px; background: white; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="font-size: 48px; font-weight: 800; color: #10b981; margin-bottom: 8px;">1200+</div>
          <div style="color: #6b7280; font-size: 16px;">Отзывов</div>
        </div>
      </div>
    </section>

    <!-- Reviews Grid -->
    <section class="reviews-grid" style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Что говорят наши клиенты</h2>

      <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 32px;">

        <!-- Review Card 1 -->
        <div style="background: white; padding: 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="display: flex; gap: 8px; margin-bottom: 16px;">
            <span style="color: #f59e0b; font-size: 20px;">⭐⭐⭐⭐⭐</span>
          </div>
          <p style="color: #111827; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
            "Подарили маме сертификат на Pet-Friendly глэмпинг на день рождения. Она была в восторге!
            Уехала на выходные с любимой собакой, вернулась счастливая и полная впечатлений.
            Электронный сертификат пришел моментально, дизайн красивый. Обязательно закажем еще!"
          </p>
          <div style="display: flex; align-items: center; gap: 12px;">
            <div style="width: 48px; height: 48px; border-radius: 50%; background: #d1fae5; display: flex; align-items: center; justify-content: center; font-weight: 700; color: #065f46;">
              АМ
            </div>
            <div>
              <div style="font-weight: 600; color: #111827;">Анна Михайлова</div>
              <div style="font-size: 14px; color: #9ca3af;">Москва • Декабрь 2024</div>
            </div>
          </div>
        </div>

        <!-- Review Card 2 -->
        <div style="background: white; padding: 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="display: flex; gap: 8px; margin-bottom: 16px;">
            <span style="color: #f59e0b; font-size: 20px;">⭐⭐⭐⭐⭐</span>
          </div>
          <p style="color: #111827; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
            "Корпоративный заказ на 50 сертификатов. Все прошло идеально! Менеджер помог с выбором,
            сделали персональные дизайны для каждого сотрудника. Доставка вовремя, упаковка премиум.
            Команда осталась довольна, многие уже съездили и делятся фото. Спасибо!"
          </p>
          <div style="display: flex; align-items: center; gap: 12px;">
            <div style="width: 48px; height: 48px; border-radius: 50%; background: #dbeafe; display: flex; align-items: center; justify-content: center; font-weight: 700; color: #1e40af;">
              ДП
            </div>
            <div>
              <div style="font-weight: 600; color: #111827;">Дмитрий Петров</div>
              <div style="font-size: 14px; color: #9ca3af;">HR-директор, Санкт-Петербург</div>
            </div>
          </div>
        </div>

        <!-- Review Card 3 -->
        <div style="background: white; padding: 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="display: flex; gap: 8px; margin-bottom: 16px;">
            <span style="color: #f59e0b; font-size: 20px;">⭐⭐⭐⭐⭐</span>
          </div>
          <p style="color: #111827; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
            "Заказал романтический сертификат на годовщину свадьбы. Жена была в шоке от красоты глэмпинга!
            Провели незабываемые выходные в домике с панорамными окнами. Завтраки в постель, закаты у костра,
            джакузи под звездами. Это лучший подарок, который я когда-либо дарил!"
          </p>
          <div style="display: flex; align-items: center; gap: 12px;">
            <div style="width: 48px; height: 48px; border-radius: 50%; background: #fce7f3; display: flex; align-items: center; justify-content: center; font-weight: 700; color: #9f1239;">
              ИС
            </div>
            <div>
              <div style="font-weight: 600; color: #111827;">Игорь Смирнов</div>
              <div style="font-size: 14px; color: #9ca3af;">Казань • Ноябрь 2024</div>
            </div>
          </div>
        </div>

        <!-- Review Card 4 -->
        <div style="background: white; padding: 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="display: flex; gap: 8px; margin-bottom: 16px;">
            <span style="color: #f59e0b; font-size: 20px;">⭐⭐⭐⭐⭐</span>
          </div>
          <p style="color: #111827; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
            "Семейный отдых с двумя детьми. Выбрали глэмпинг с детской площадкой и мастер-классами.
            Дети в восторге, мы с мужем отдохнули. Природа, чистый воздух, активности для всей семьи.
            Сертификат использовать очень удобно, просто показали код при заселении. Вернемся еще!"
          </p>
          <div style="display: flex; align-items: center; gap: 12px;">
            <div style="width: 48px; height: 48px; border-radius: 50%; background: #fef3c7; display: flex; align-items: center; justify-content: center; font-weight: 700; color: #92400e;">
              ОК
            </div>
            <div>
              <div style="font-weight: 600; color: #111827;">Ольга Козлова</div>
              <div style="font-size: 14px; color: #9ca3af;">Екатеринбург • Октябрь 2024</div>
            </div>
          </div>
        </div>

        <!-- Review Card 5 -->
        <div style="background: white; padding: 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="display: flex; gap: 8px; margin-bottom: 16px;">
            <span style="color: #f59e0b; font-size: 20px;">⭐⭐⭐⭐⭐</span>
          </div>
          <p style="color: #111827; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
            "Экстремальный отдых с друзьями - это было безумно круто! Зиплайн, скалолазание, рафтинг.
            Адреналин зашкаливал! Глэмпинг комфортный, после активных дней было где отдохнуть.
            Сертификат действует год, успели использовать дважды. Однозначно рекомендую!"
          </p>
          <div style="display: flex; align-items: center; gap: 12px;">
            <div style="width: 48px; height: 48px; border-radius: 50%; background: #e0e7ff; display: flex; align-items: center; justify-content: center; font-weight: 700; color: #3730a3;">
              МР
            </div>
            <div>
              <div style="font-weight: 600; color: #111827;">Максим Романов</div>
              <div style="font-size: 14px; color: #9ca3af;">Новосибирск • Сентябрь 2024</div>
            </div>
          </div>
        </div>

        <!-- Review Card 6 -->
        <div style="background: white; padding: 32px; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="display: flex; gap: 8px; margin-bottom: 16px;">
            <span style="color: #f59e0b; font-size: 20px;">⭐⭐⭐⭐⭐</span>
          </div>
          <p style="color: #111827; font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
            "Релакс и SPA - именно то, что нужно было после тяжелого года. Массажи, йога, медитации,
            вегетарианская кухня. Полная перезагрузка! Сертификат пришел в красивой подарочной коробке,
            презентация на высшем уровне. Чувствую себя новым человеком. Спасибо за заботу!"
          </p>
          <div style="display: flex; align-items: center; gap: 12px;">
            <div style="width: 48px; height: 48px; border-radius: 50%; background: #d1fae5; display: flex; align-items: center; justify-content: center; font-weight: 700; color: #065f46;">
              ЕВ
            </div>
            <div>
              <div style="font-weight: 600; color: #111827;">Елена Волкова</div>
              <div style="font-size: 14px; color: #9ca3af;">Москва • Август 2024</div>
            </div>
          </div>
        </div>

      </div>
    </section>

    <!-- Video Reviews Section -->
    <section class="video-reviews" style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Видеоотзывы</h2>
      <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px;">

        <div style="background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="width: 100%; height: 200px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center;">
            <div style="width: 64px; height: 64px; background: rgba(255,255,255,0.9); border-radius: 50%; display: flex; align-items: center; justify-content: center; cursor: pointer;">
              <span style="font-size: 24px;">▶️</span>
            </div>
          </div>
          <div style="padding: 20px;">
            <h4 style="margin-bottom: 8px;">Семья Ивановых</h4>
            <p style="color: #6b7280; font-size: 14px;">Отдых с детьми в глэмпинге</p>
          </div>
        </div>

        <div style="background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="width: 100%; height: 200px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); display: flex; align-items: center; justify-content: center;">
            <div style="width: 64px; height: 64px; background: rgba(255,255,255,0.9); border-radius: 50%; display: flex; align-items: center; justify-content: center; cursor: pointer;">
              <span style="font-size: 24px;">▶️</span>
            </div>
          </div>
          <div style="padding: 20px;">
            <h4 style="margin-bottom: 8px;">Влюбленная пара</h4>
            <p style="color: #6b7280; font-size: 14px;">Романтический уикенд</p>
          </div>
        </div>

        <div style="background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 16px rgba(0,0,0,0.08);">
          <div style="width: 100%; height: 200px; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); display: flex; align-items: center; justify-content: center;">
            <div style="width: 64px; height: 64px; background: rgba(255,255,255,0.9); border-radius: 50%; display: flex; align-items: center; justify-content: center; cursor: pointer;">
              <span style="font-size: 24px;">▶️</span>
            </div>
          </div>
          <div style="padding: 20px;">
            <h4 style="margin-bottom: 8px;">Компания друзей</h4>
            <p style="color: #6b7280; font-size: 14px;">Экстремальные приключения</p>
          </div>
        </div>

      </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
      <h2>Станьте частью нашей счастливой семьи!</h2>
      <p style="font-size: 18px; color: #6b7280; margin-bottom: 32px;">
        Подарите близким незабываемые впечатления
      </p>
      <a href="<?php echo $base; ?>gift-certificate" class="btn btn-primary btn-large">
        Выбрать сертификат
      </a>
    </section>

  </div>
</main>

<?php include(DIR_TEMPLATE . 'information/shared/footer.tpl'); ?>

<?php echo $footer; ?>
