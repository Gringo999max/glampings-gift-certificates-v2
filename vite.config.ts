import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';
import path from 'path';

// Plugin to stub figma:asset imports
const stubFigmaAssets = () => ({
  name: 'stub-figma-assets',
  enforce: 'pre' as const,
  resolveId(id: string) {
    if (id.startsWith('figma:asset/')) {
      return '\0' + id; // Use virtual module convention
    }
  },
  load(id: string) {
    if (id.startsWith('\0figma:asset/')) {
      // Return a data URL for a 1x1 transparent PNG
      return `export default "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII="`;
    }
  }
});

export default defineConfig({
  plugins: [react(), stubFigmaAssets()],
  base: './', // Относительные пути для OpenCart
  resolve: {
    extensions: ['.js', '.jsx', '.ts', '.tsx', '.json'],
    alias: {
      'sonner@2.0.3': 'sonner',
      'react-hook-form@7.55.0': 'react-hook-form',
      '@': path.resolve(__dirname, './src'),
    },
  },
  build: {
    manifest: true, // Generate manifest.json for OpenCart integration
    target: 'esnext',
    outDir: 'dist', // Изменено с 'build' на 'dist'
    assetsDir: 'assets',
    rollupOptions: {
      output: {
        // Code splitting для оптимизации
        manualChunks: {
          'react-vendor': ['react', 'react-dom'],
          'ui-radix': [
            '@radix-ui/react-dialog',
            '@radix-ui/react-select',
            '@radix-ui/react-checkbox',
            '@radix-ui/react-radio-group',
            '@radix-ui/react-tabs'
          ],
          'cart': ['./src/components/CartContext.tsx'],
          'checkout': ['./src/components/CheckoutModal.tsx']
        },
        assetFileNames: 'assets/[name]-[hash][extname]',
        chunkFileNames: 'assets/[name]-[hash].js',
        entryFileNames: 'assets/gift-app-[hash].js'
      }
    },
    minify: 'esbuild', // Быстрее чем terser
    sourcemap: false,
    cssCodeSplit: true
  },
  server: {
    port: 3000,
    open: true,
  },
});
