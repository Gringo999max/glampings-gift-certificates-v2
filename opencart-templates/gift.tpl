<?php echo $header; ?>

<!-- Common Styles -->
<link rel="stylesheet" href="<?php echo $base; ?>catalog/view/theme/default/stylesheet/gift_common.css">

<!-- React App Container -->
<div id="root"></div>

<!-- React Bundle (from npm run build) -->
<?php
// Read manifest.json to get correct file names with hashes
$manifest_path = DIR_APPLICATION . '../catalog/view/javascript/gift-app/manifest.json';
if (file_exists($manifest_path)) {
    $manifest = json_decode(file_get_contents($manifest_path), true);

    // Load CSS
    if (isset($manifest['index.css'])) {
        echo '<link rel="stylesheet" href="' . $base . 'catalog/view/javascript/gift-app/' . $manifest['index.css']['file'] . '">';
    }

    // Load JS
    if (isset($manifest['index.html'])) {
        foreach ($manifest['index.html']['css'] as $css) {
            echo '<link rel="stylesheet" href="' . $base . 'catalog/view/javascript/gift-app/' . $css . '">';
        }
        echo '<script type="module" src="' . $base . 'catalog/view/javascript/gift-app/' . $manifest['index.html']['file'] . '"></script>';
    }
} else {
    // Fallback if manifest doesn't exist
    echo '<link rel="stylesheet" href="' . $base . 'catalog/view/javascript/gift-app/assets/index.css">';
    echo '<script type="module" src="' . $base . 'catalog/view/javascript/gift-app/assets/index.js"></script>';
}
?>

<?php echo $footer; ?>
