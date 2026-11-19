# God of Cod — GOC

**A suprema IDE para desenvolvedores avançados.**

God of Cod (GOC) é uma IDE desktop de próxima geração com IA integrada, design premium e compatibilidade com extensões VS Code.

## Stack

| Camada | Tecnologia |
|---|---|
| Desktop | Electron + React + Monaco Editor |
| Linguagem UI | TypeScript |
| Estilização | Tailwind CSS v4 + CSS Variables |
| Backend IA | Rust + Axum (`goc-core`) |
| Banco de Dados | SQLite |
| Build | pnpm + Turborepo + electron-vite |
| Terminal | xterm.js |
| Layout | Custom dockable panel system |

## Estrutura

```
god-of-cod/
├── apps/
│   ├── desktop/          # Electron app (main, preload, renderer)
│   └── goc-core/         # Rust backend (Axum server, LLM routing)
├── packages/
│   ├── goc-ui/           # Component library (Button, Icon, Input, etc.)
│   ├── goc-theme/        # Design tokens, themes (dark/light/silver)
│   ├── goc-shared/       # Shared types, constants
│   ├── goc-editor/       # Monaco Editor wrapper
│   ├── goc-explorer/     # File tree component
│   ├── goc-terminal/     # Integrated terminal (xterm.js)
│   ├── goc-ai-panel/     # Chat UI for GOC Copilot
│   ├── goc-git/          # Git integration (pending)
│   ├── goc-debug/        # Debugger integration (pending)
│   ├── goc-extension-host/ # VS Code extension host (pending)
│   └── goc-settings/     # Settings management (pending)
├── themes/
│   └── goc-dark-silver/  # Premium dark/silver theme
└── scripts/              # Build and utility scripts
```

## Pré-requisitos

- **Node.js** >= 20
- **pnpm** >= 9
- **Rust** (for goc-core) — install via [rustup.rs](https://rustup.rs)
- **Windows 10/11**, macOS, or Linux

## Quick Start

```bash
# 1. Install dependencies
pnpm install

# 2. Build goc-core (Rust backend)
cd apps/goc-core
cargo build --release
cd ../..

# 3. Build all packages
pnpm build

# 4. Start dev mode
pnpm --filter @goc/desktop dev
```

## Scripts

| Command | Description |
|---|---|
| `pnpm dev` | Start all packages in dev mode |
| `pnpm build` | Build all packages |
| `pnpm lint` | Lint all packages |
| `pnpm typecheck` | Type-check all packages |
| `pnpm clean` | Clean all build outputs |
| `pnpm format` | Format code with Prettier |

## Features

- **3 temas premium**: Dark, Light, Silver
- **GOC Copilot**: Chat lateral com IA integrada
- **goc-core**: Backend Rust local para IA (proxy, RAG, indexação)
- **Terminal integrado**: xterm.js com tema sincronizado
- **Explorador de arquivos**: Árvore de arquivos com contexto
- **Suporte a múltiplos provedores LLM**: OpenAI, Anthropic, Google Gemini, OpenRouter
- **Compatibilidade VS Code**: Extensões built-in, suporte futuro a `.vsix`

## GOC Core

O `goc-core` é o backend local de IA escrito em Rust. Ele gerencia:
- Roteamento de modelos de linguagem
- Streaming de respostas via SSE
- Indexação de código do projeto
- SQLite para histórico e embeddings
- API REST na porta 9870

### Variáveis de Ambiente

| Variável | Default | Descrição |
|---|---|---|
| `GOC_CORE_PORT` | `9870` | Porta do servidor |
| `GOC_DATA_DIR` | `%LOCALAPPDATA%/goc-core` | Diretório de dados |
| `ANTHROPIC_API_KEY` | — | API key para Anthropic |
| `OPENAI_API_KEY` | — | API key para OpenAI |
| `OPENROUTER_API_KEY` | — | API key para OpenRouter |

## Roadmap

- [x] Monorepo com pnpm + Turborepo
- [x] GOC Theme system (dark/light/silver)
- [x] GOC UI component library
- [x] Monaco Editor wrapper
- [x] Layout shell (activity bar, sidebars, status bar)
- [x] File explorer
- [x] Integrated terminal
- [x] GOC Copilot (chat + SSE streaming)
- [x] goc-core backend (Rust + Axum)
- [x] Electron shell
- [ ] Git integration (goc-git)
- [ ] Debugger (goc-debug)
- [ ] VS Code extension host
- [ ] Full LLM provider implementations
- [ ] Code indexing and RAG
- [ ] Agent system
- [ ] Settings UI

## Licença

Proprietário — God of Cod. Todos os direitos reservados.
