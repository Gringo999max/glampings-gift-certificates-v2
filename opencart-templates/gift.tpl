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

    // Vite generates manifest with index.html as entry point
    if (isset($manifest['index.html'])) {
        $entry = $manifest['index.html'];

        // Load CSS files
        if (isset($entry['css'])) {
            foreach ($entry['css'] as $css) {
                echo '<link rel="stylesheet" href="' . $base . 'catalog/view/javascript/gift-app/' . $css . '">';
            }
        }

        // Load main JS file
        if (isset($entry['file'])) {
            echo '<script type="module" src="' . $base . 'catalog/view/javascript/gift-app/' . $entry['file'] . '"></script>';
        }
    }
} else {
    // Fallback if manifest doesn't exist - автоматический поиск файлов
    $assets_dir = DIR_APPLICATION . '../catalog/view/javascript/gift-app/assets/';
    if (is_dir($assets_dir)) {
        $files = scandir($assets_dir);
        foreach ($files as $file) {
            if (preg_match('/^gift-app-[a-f0-9]+\.js$/', $file)) {
                echo '<script type="module" src="' . $base . 'catalog/view/javascript/gift-app/assets/' . $file . '"></script>';
                break;
            }
        }
    }
}
?>

<?php echo $footer; ?>
