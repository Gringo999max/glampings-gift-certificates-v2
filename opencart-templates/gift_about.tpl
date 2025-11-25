<?php echo $header; ?>

<!-- Common Styles -->
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<?php
$current_page = 'about';
include(DIR_TEMPLATE . 'information/shared/header.tpl');
?>

<main class="about-page" style="padding: 40px 0 80px;">
  <div class="container">
    <h1 class="page-title">О нас</h1>
    <p class="section-lead">
      Мы создаем незабываемые впечатления и помогаем людям дарить эмоции
    </p>

    <!-- Mission Section -->
    <section style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center; margin-bottom: 80px;">
      <div>
        <h2 style="font-size: 40px; margin-bottom: 24px;">Наша миссия</h2>
        <p style="color: #6b7280; font-size: 18px; line-height: 1.8; margin-bottom: 20px;">
          Мы верим, что лучший подарок — это не вещь, а впечатление. Наша миссия — сделать
          отдых на природе доступным и комфортным для каждого, кто мечтает о единении с природой
          без отказа от благ цивилизации.
        </p>
        <p style="color: #6b7280; font-size: 18px; line-height: 1.8;">
          С 2020 года мы помогли более 5000 людям подарить незабываемые впечатления своим близким.
          Каждый наш сертификат — это билет в мир комфортного отдыха на природе.
        </p>
      </div>
      <div style="height: 400px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.15);"></div>
    </section>

    <!-- Stats Section -->
    <section style="background: #f9fafb; padding: 60px 40px; border-radius: 20px; margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Наши достижения</h2>
      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 40px;">
        <div style="text-align: center;">
          <div style="font-size: 56px; font-weight: 800; color: #10b981; margin-bottom: 8px;">5000+</div>
          <p style="color: #6b7280; font-size: 16px;">Счастливых клиентов</p>
        </div>
        <div style="text-align: center;">
          <div style="font-size: 56px; font-weight: 800; color: #10b981; margin-bottom: 8px;">200+</div>
          <p style="color: #6b7280; font-size: 16px;">Партнерских глэмпингов</p>
        </div>
        <div style="text-align: center;">
          <div style="font-size: 56px; font-weight: 800; color: #10b981; margin-bottom: 8px;">4.9</div>
          <p style="color: #6b7280; font-size: 16px;">Средняя оценка</p>
        </div>
        <div style="text-align: center;">
          <div style="font-size: 56px; font-weight: 800; color: #10b981; margin-bottom: 8px;">98%</div>
          <p style="color: #6b7280; font-size: 16px;">Повторных покупок</p>
        </div>
      </div>
    </section>

    <!-- Values Section -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Наши ценности</h2>
      <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 32px;">

        <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 48px; margin-bottom: 20px;">🌿</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Экологичность</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Мы работаем только с глэмпингами, которые заботятся об окружающей среде и минимизируют
            воздействие на природу
          </p>
        </div>

        <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 48px; margin-bottom: 20px;">⭐</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Качество</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Каждый партнерский глэмпинг проходит строгий отбор. Мы лично проверяем уровень комфорта
            и сервиса
          </p>
        </div>

        <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 48px; margin-bottom: 20px;">💚</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Забота о клиентах</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Поддержка 24/7, помощь в выборе, индивидуальный подход. Ваше удовольствие — наша цель
          </p>
        </div>

        <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 48px; margin-bottom: 20px;">🎁</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Эмоции</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Мы дарим не сертификаты, а незабываемые впечатления, которые останутся в сердце навсегда
          </p>
        </div>

        <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 48px; margin-bottom: 20px;">🤝</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Честность</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Прозрачные условия, без скрытых платежей. Что обещаем — то и выполняем
          </p>
        </div>

        <div style="background: white; padding: 40px 32px; border-radius: 16px; border: 2px solid #e5e7eb;">
          <div style="font-size: 48px; margin-bottom: 20px;">🚀</div>
          <h3 style="margin-bottom: 12px; font-size: 20px;">Инновации</h3>
          <p style="color: #6b7280; font-size: 15px; line-height: 1.6;">
            Постоянно развиваемся, внедряем новые технологии для удобства клиентов
          </p>
        </div>

      </div>
    </section>

    <!-- Team Section -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 24px;">Наша команда</h2>
      <p style="text-align: center; color: #6b7280; font-size: 18px; margin-bottom: 48px;">
        Профессионалы, влюбленные в свое дело
      </p>

      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px;">

        <div style="text-align: center;">
          <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 50%; margin: 0 auto 20px; box-shadow: 0 8px 24px rgba(0,0,0,0.12);"></div>
          <h4 style="margin-bottom: 8px;">Александр Иванов</h4>
          <p style="color: #10b981; font-size: 14px; margin-bottom: 8px; font-weight: 600;">Основатель и CEO</p>
          <p style="color: #9ca3af; font-size: 13px;">10 лет в туристическом бизнесе</p>
        </div>

        <div style="text-align: center;">
          <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 50%; margin: 0 auto 20px; box-shadow: 0 8px 24px rgba(0,0,0,0.12);"></div>
          <h4 style="margin-bottom: 8px;">Мария Петрова</h4>
          <p style="color: #10b981; font-size: 14px; margin-bottom: 8px; font-weight: 600;">Директор по развитию</p>
          <p style="color: #9ca3af; font-size: 13px;">Эксперт в сфере гостеприимства</p>
        </div>

        <div style="text-align: center;">
          <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 50%; margin: 0 auto 20px; box-shadow: 0 8px 24px rgba(0,0,0,0.12);"></div>
          <h4 style="margin-bottom: 8px;">Дмитрий Сидоров</h4>
          <p style="color: #10b981; font-size: 14px; margin-bottom: 8px; font-weight: 600;">Руководитель поддержки</p>
          <p style="color: #9ca3af; font-size: 13px;">Всегда на связи для клиентов</p>
        </div>

        <div style="text-align: center;">
          <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 50%; margin: 0 auto 20px; box-shadow: 0 8px 24px rgba(0,0,0,0.12);"></div>
          <h4 style="margin-bottom: 8px;">Елена Смирнова</h4>
          <p style="color: #10b981; font-size: 14px; margin-bottom: 8px; font-weight: 600;">Менеджер партнерств</p>
          <p style="color: #9ca3af; font-size: 13px;">Строит отношения с глэмпингами</p>
        </div>

      </div>
    </section>

    <!-- Story Timeline -->
    <section style="margin-bottom: 80px;">
      <h2 style="text-align: center; margin-bottom: 48px;">Наша история</h2>

      <div style="position: relative; max-width: 800px; margin: 0 auto;">
        <!-- Timeline line -->
        <div style="position: absolute; left: 50%; top: 0; bottom: 0; width: 2px; background: #e5e7eb; transform: translateX(-50%);"></div>

        <!-- 2020 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-bottom: 60px; position: relative;">
          <div style="text-align: right; padding-right: 40px;">
            <h3 style="font-size: 32px; font-weight: 800; color: #10b981; margin-bottom: 8px;">2020</h3>
            <h4 style="margin-bottom: 12px;">Начало пути</h4>
            <p style="color: #6b7280; line-height: 1.6;">
              Запуск проекта с 10 партнерскими глэмпингами. Первые 100 довольных клиентов
            </p>
          </div>
          <div></div>
          <div style="position: absolute; left: 50%; top: 0; width: 16px; height: 16px; background: #10b981; border-radius: 50%; transform: translateX(-50%); border: 4px solid white; box-shadow: 0 2px 8px rgba(16,185,129,0.3);"></div>
        </div>

        <!-- 2021 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-bottom: 60px; position: relative;">
          <div></div>
          <div style="padding-left: 40px;">
            <h3 style="font-size: 32px; font-weight: 800; color: #10b981; margin-bottom: 8px;">2021</h3>
            <h4 style="margin-bottom: 12px;">Масштабирование</h4>
            <p style="color: #6b7280; line-height: 1.6;">
              Расширение сети до 50 глэмпингов по всей России. Запуск мобильного приложения
            </p>
          </div>
          <div style="position: absolute; left: 50%; top: 0; width: 16px; height: 16px; background: #10b981; border-radius: 50%; transform: translateX(-50%); border: 4px solid white; box-shadow: 0 2px 8px rgba(16,185,129,0.3);"></div>
        </div>

        <!-- 2022 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-bottom: 60px; position: relative;">
          <div style="text-align: right; padding-right: 40px;">
            <h3 style="font-size: 32px; font-weight: 800; color: #10b981; margin-bottom: 8px;">2022</h3>
            <h4 style="margin-bottom: 12px;">Признание</h4>
            <p style="color: #6b7280; line-height: 1.6;">
              Победа в номинации "Лучший проект в сфере экотуризма". 2000 клиентов
            </p>
          </div>
          <div></div>
          <div style="position: absolute; left: 50%; top: 0; width: 16px; height: 16px; background: #10b981; border-radius: 50%; transform: translateX(-50%); border: 4px solid white; box-shadow: 0 2px 8px rgba(16,185,129,0.3);"></div>
        </div>

        <!-- 2023 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-bottom: 60px; position: relative;">
          <div></div>
          <div style="padding-left: 40px;">
            <h3 style="font-size: 32px; font-weight: 800; color: #10b981; margin-bottom: 8px;">2023</h3>
            <h4 style="margin-bottom: 12px;">Новые горизонты</h4>
            <p style="color: #6b7280; line-height: 1.6;">
              150 партнерских глэмпингов. Запуск корпоративного направления
            </p>
          </div>
          <div style="position: absolute; left: 50%; top: 0; width: 16px; height: 16px; background: #10b981; border-radius: 50%; transform: translateX(-50%); border: 4px solid white; box-shadow: 0 2px 8px rgba(16,185,129,0.3);"></div>
        </div>

        <!-- 2024 -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; position: relative;">
          <div style="text-align: right; padding-right: 40px;">
            <h3 style="font-size: 32px; font-weight: 800; color: #10b981; margin-bottom: 8px;">2024</h3>
            <h4 style="margin-bottom: 12px;">Сегодня</h4>
            <p style="color: #6b7280; line-height: 1.6;">
              200+ глэмпингов, 5000+ счастливых клиентов. Мы продолжаем расти!
            </p>
          </div>
          <div></div>
          <div style="position: absolute; left: 50%; top: 0; width: 16px; height: 16px; background: #10b981; border-radius: 50%; transform: translateX(-50%); border: 4px solid white; box-shadow: 0 2px 8px rgba(16,185,129,0.3);"></div>
        </div>

      </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
      <h2>Станьте частью нашей истории!</h2>
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
