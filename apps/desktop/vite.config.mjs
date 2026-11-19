import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';
import { fileURLToPath } from 'url';

const __dirname = resolve(fileURLToPath(import.meta.url), '..');

export default defineConfig({
  plugins: [react()],
  root: 'src/renderer',
  server: {
    port: 5173,
    strictPort: true,
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src', 'renderer'),
    },
  },
  build: {
    outDir: resolve(__dirname, 'dist'),
  },
});
