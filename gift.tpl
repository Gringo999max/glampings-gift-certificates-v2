<?php echo $header; ?>

<!-- React SPA Container -->
<div id="root"></div>

<!-- Vite Build Assets -->
<?php
// Путь к папке с билдом React приложения
$dist_path = DIR_APPLICATION . '../catalog/view/theme/default/dist/';
$dist_url = $config->get('config_url') . 'catalog/view/theme/default/dist/';

// Читаем manifest.json для получения хешированных имен файлов
$manifest_file = $dist_path . 'manifest.json';
if (file_exists($manifest_file)) {
    $manifest = json_decode(file_get_contents($manifest_file), true);

    // Загружаем основной JS файл
    if (isset($manifest['index.html']['file'])) {
        echo '<script type="module" src="' . $dist_url . $manifest['index.html']['file'] . '"></script>';
    }

    // Загружаем основной CSS файл
    if (isset($manifest['index.html']['css'])) {
        foreach ($manifest['index.html']['css'] as $css_file) {
            echo '<link rel="stylesheet" href="' . $dist_url . $css_file . '">';
        }
    }
} else {
    // Fallback: загружаем файлы без manifest (для разработки)
    echo '<script type="module" src="' . $dist_url . 'assets/gift-app.js"></script>';
    echo '<link rel="stylesheet" href="' . $dist_url . 'assets/index.css">';
}
?>

<!-- OpenCart данные для React приложения -->
<script>
// Передаем данные из OpenCart в React
window.OPENCART_CONFIG = {
    baseUrl: '<?php echo $config->get("config_url"); ?>',
    currency: '<?php echo $currency; ?>',
    language: '<?php echo $config->get("config_language"); ?>',
    customerLoggedIn: <?php echo $customer->isLogged() ? 'true' : 'false'; ?>,
    customerId: <?php echo $customer->isLogged() ? $customer->getId() : 'null'; ?>,
    customerName: '<?php echo $customer->isLogged() ? $customer->getFirstName() . " " . $customer->getLastName() : ""; ?>',
    customerEmail: '<?php echo $customer->isLogged() ? $customer->getEmail() : ""; ?>',
    customerTelephone: '<?php echo $customer->isLogged() ? $customer->getTelephone() : ""; ?>',
    apiEndpoint: '<?php echo $config->get("config_url") . "index.php?route=gift/checkout"; ?>'
};
</script>

<?php echo $footer; ?>
