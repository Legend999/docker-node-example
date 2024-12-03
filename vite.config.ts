import react from '@vitejs/plugin-react';
import {defineConfig} from 'vite';

export default defineConfig({
  plugins: [react()],
  server: {
    strictPort: true,
    host: '0.0.0.0',
  },
});
