# AGENTS.md — GOC Project Guidelines

## Build commands
- `pnpm install` — Install all dependencies
- `pnpm build` — Build all packages (via Turborepo)
- `pnpm dev` — Start all packages in dev mode
- `pnpm --filter @goc/desktop dev` — Start Electron app only
- `pnpm lint` — Lint all packages
- `pnpm typecheck` — TypeScript type-check all packages
- `cargo build --release` — Build goc-core (from apps/goc-core/)
- `pnpm format` — Format all code with Prettier

## Architecture
- Monorepo: pnpm workspaces + Turborepo
- Desktop: Electron + React + Monaco Editor (electron-vite)
- Backend AI: Rust + Axum (apps/goc-core) — runs as sidecar
- UI packages: goc-theme (tokens), goc-shared (types), goc-ui (components)
- State management: Zustand (stores by domain)
- Styling: Tailwind CSS v4 + CSS variables (data-theme)
- Communication: HTTP REST + SSE (Electron ↔ goc-core)
- Layout: Custom dockable panel system

## Git
- Never commit secrets, keys, or .env files
- Commit messages in English, concise and imperative

## Code style
- TypeScript strict mode
- React functional components with hooks
- No default exports in packages (use named exports)
- Prettier: single quotes, trailing commas, 100 print width
- Rust: edition 2024, standard formatting with `cargo fmt`
