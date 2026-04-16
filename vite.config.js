import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0',
    port: 3000,
    allowedHosts: ['ab588abc4e9ca443eb697288f0819c3a-1968593748.ap-south-1.elb.amazonaws.com']
  }
})
