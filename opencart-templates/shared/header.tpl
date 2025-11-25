<header class="gift-header">
  <div class="container">
    <a href="<?php echo $home_url; ?>" class="logo">
      <img src="<?php echo $base; ?>catalog/view/theme/default/image/gift/logo.png" alt="ГЛЭМПИНГИ.РФ">
    </a>

    <nav class="main-nav">
      <a href="<?php echo $base; ?>gift-certificate"
         class="nav-link <?php echo ($current_page == 'home') ? 'active' : ''; ?>">
        Подарочные сертификаты
      </a>
      <a href="<?php echo $base; ?>gift-certificate/delivery"
         class="nav-link <?php echo ($current_page == 'delivery') ? 'active' : ''; ?>">
        Доставка и оплата
      </a>
      <a href="<?php echo $base; ?>gift-certificate/reviews"
         class="nav-link <?php echo ($current_page == 'reviews') ? 'active' : ''; ?>">
        Отзывы
      </a>
      <a href="<?php echo $base; ?>gift-certificate/how-it-works"
         class="nav-link <?php echo ($current_page == 'how-it-works') ? 'active' : ''; ?>">
        Как это работает
      </a>
      <a href="<?php echo $base; ?>gift-certificate/corporate"
         class="nav-link <?php echo ($current_page == 'corporate') ? 'active' : ''; ?>">
        Корпоративные подарки
      </a>
      <a href="<?php echo $base; ?>gift-certificate/about"
         class="nav-link <?php echo ($current_page == 'about') ? 'active' : ''; ?>">
        О Нас
      </a>
      <a href="<?php echo $base; ?>gift-certificate/contacts"
         class="nav-link <?php echo ($current_page == 'contacts') ? 'active' : ''; ?>">
        Контакты
      </a>
    </nav>

    <div class="header-actions">
      <a href="<?php echo $base; ?>gift-certificate/activate" class="btn-activate">
        Активировать сертификат
      </a>

      <button class="mobile-menu-toggle" onclick="toggleMobileMenu()">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </div>
  </div>

  <!-- Mobile Menu -->
  <div class="mobile-menu" id="mobileMenu">
    <a href="<?php echo $base; ?>gift-certificate">Подарочные сертификаты</a>
    <a href="<?php echo $base; ?>gift-certificate/delivery">Доставка и оплата</a>
    <a href="<?php echo $base; ?>gift-certificate/reviews">Отзывы</a>
    <a href="<?php echo $base; ?>gift-certificate/how-it-works">Как это работает</a>
    <a href="<?php echo $base; ?>gift-certificate/corporate">Корпоративные подарки</a>
    <a href="<?php echo $base; ?>gift-certificate/about">О Нас</a>
    <a href="<?php echo $base; ?>gift-certificate/contacts">Контакты</a>
    <a href="<?php echo $base; ?>gift-certificate/activate" class="mobile-btn-activate">Активировать сертификат</a>
  </div>
</header>

<script>
function toggleMobileMenu() {
  const menu = document.getElementById('mobileMenu');
  menu.classList.toggle('active');
}
</script>
