import { defineConfig } from "vite";
import inject from "@rollup/plugin-inject";
import path from "path";

export default defineConfig({
    // ...
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "./src/js/main.js"),
        },
    },
    build: {
        outDir: "./dist",
        rollupOptions: {
            input: {
                main: path.resolve(__dirname, "./index.html"),
                login: path.resolve(__dirname, "./login.html"),
            },
        },
    },
    plugins: [
        inject({
            $: "jquery",
            jQuery: "jquery",
        }),
    ],
    server: {
        port: 8081,
    },
});
