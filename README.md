# TeamSwarm

Autonomous task execution system for AI agents. Multiple AI agents work in parallel across workspaces, driven by Intent-Driven Development (IDD).

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/ArcBlock/useteamswarm/main/install.sh | sh
```

Or download a binary directly from the [Releases](https://github.com/ArcBlock/useteamswarm/releases) page.

### Supported platforms

| Platform | Binary |
|----------|--------|
| macOS Apple Silicon | `teamswarm-darwin-arm64` |
| macOS Intel | `teamswarm-darwin-x64` |
| Linux x64 | `teamswarm-linux-x64` |

## Quick Start

```bash
# Add a workspace
teamswarm add ~/work/my-project

# Open Web UI
teamswarm web

# Start headless worker
teamswarm work
```

## Usage

```
teamswarm [command] [options]

Commands:
  web                 Open Web UI
  work                Start headless worker mode (Agent SDK)
  add <folder>        Add a workspace
  remove <name>       Remove a workspace
  list                List configured workspaces
  status              Show daemon + agent status
  start [workspace]   Start agent
  stop                Stop the daemon
  kick <task>         Execute a specific task
  approve <task>      Approve a review task
  reject <task>       Reject a review task
  logs <task>         Show agent output
```

## Requirements

- Claude API key (set `ANTHROPIC_API_KEY`)
- Claude Code CLI (`@anthropic-ai/claude-code`)

## License

Copyright (c) 2026 ArcBlock Inc. All rights reserved.
