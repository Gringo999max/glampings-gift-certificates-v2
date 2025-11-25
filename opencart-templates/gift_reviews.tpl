<?php echo $header; ?>

<!-- React App Container with route attribute -->
<div id="root" data-route="<?php echo isset($react_route) ? $react_route : '/'; ?>"></div>

<!-- Load React Bundle from manifest.json -->
<?php
$base_url = $this->config->get('config_url');
$manifest_path = DIR_APPLICATION . '../catalog/view/javascript/gift-app/manifest.json';

if (file_exists($manifest_path)) {
    // Read manifest.json for file hashes (cache busting)
    $manifest = json_decode(file_get_contents($manifest_path), true);

    if (isset($manifest['index.html'])) {
        $entry = $manifest['index.html'];

        // Load CSS files
        if (isset($entry['css'])) {
            foreach ($entry['css'] as $css) {
                echo '<link rel="stylesheet" href="' . $base_url . 'catalog/view/javascript/gift-app/' . $css . '">' . "\n";
            }
        }

        // Load main JS file
        if (isset($entry['file'])) {
            echo '<script type="module" src="' . $base_url . 'catalog/view/javascript/gift-app/' . $entry['file'] . '"></script>' . "\n";
        }
    }
} else {
    // Fallback if manifest.json doesn't exist (should not happen in production)
    echo '<link rel="stylesheet" href="' . $base_url . 'catalog/view/javascript/gift-app/assets/index.css">' . "\n";
    echo '<script type="module" src="' . $base_url . 'catalog/view/javascript/gift-app/assets/index.js"></script>' . "\n";
}
?>

<?php echo $footer; ?>
