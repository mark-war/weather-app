import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import VitePluginStaticCopy from "vite-plugin-static-copy";

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    VitePluginStaticCopy({
      targets: [
        {
          src: "web.config", // Path to web.config in your source folder
          dest: "", // Destination directory (root of dist)
        },
      ],
    }),
  ],
  build: {
    outDir: "dist",
  },
});
