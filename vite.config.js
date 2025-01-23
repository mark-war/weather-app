import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { viteStaticCopy } from "vite-plugin-static-copy";

export default defineConfig({
  plugins: [
    react(),
    viteStaticCopy({
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
