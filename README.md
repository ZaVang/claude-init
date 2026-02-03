# ZaVang Claude Plugins

A Claude Code plugin marketplace for project initialization, code review, testing, and more.

## Available Plugins

### claude-init
One-click project initialization with CLAUDE.md templates, directory structure, and built-in agents.

**Features:**
- **Project Initialization**: Generate CLAUDE.md, directory structure, and language-specific configurations
- **Built-in Agents**: Code review, test generation, documentation, architecture analysis, debugging
- **Auto-formatting Hook**: Python files auto-formatted with black + isort
- **Templates**: Customizable project templates for different project types

## Installation

### Option 1: Plugin Marketplace (Recommended)

```bash
# Add this repo as a marketplace
/plugin marketplace add ZaVang/claude-init

# Install the plugin
/plugin install claude-init@zavang-plugins
```

### Option 2: Clone to plugins directory

```bash
# Clone the entire marketplace
git clone https://github.com/ZaVang/claude-init.git ~/.claude/plugins/zavang-plugins

# Restart Claude Code to load the plugins
```

### Option 3: Using --plugin-dir (For development)

```bash
# Clone the repository
git clone https://github.com/ZaVang/claude-init.git

# Start Claude Code with the marketplace
claude --plugin-dir /path/to/claude-init
```

## Quick Start

### Initialize a New Project

```bash
# Interactive mode (recommended)
/claude-init:init-project

# With arguments: <project-name> <language> <project-type>
/claude-init:init-project myapp python api
```

**Supported Languages**: `python`, `typescript`, `general`

**Project Types**: `api`, `cli`, `library`, `web`

### What Gets Created

```
myapp/
├── .claude/
│   ├── CLAUDE.md           # Development conventions
│   └── rules/
│       └── python.md       # Language-specific rules
├── src/
│   ├── api/                # API endpoints
│   ├── schemas/            # Data models (Pydantic)
│   ├── services/           # Business logic
│   └── utils/              # Utilities
├── tests/                  # Test files
├── docs/                   # Documentation
├── .gitignore
└── pyproject.toml          # Python config
```

## Available Commands

| Command | Description |
|---------|-------------|
| `/claude-init:init-project` | Initialize a new project with structure and configs |
| `/claude-init:code-reviewer` | Review code for quality, security, and performance |
| `/claude-init:test-writer` | Generate pytest test cases |
| `/claude-init:doc-writer` | Generate documentation and docstrings |
| `/claude-init:architect` | Analyze project architecture |
| `/claude-init:debugger` | Debug errors and trace issues |

## Agents

### Code Reviewer
Reviews code for:
- Code quality (naming, single responsibility, duplication)
- Security issues (SQL injection, hardcoded secrets)
- Performance (N+1 queries, memory leaks)
- Python best practices (type hints, error handling)

### Test Writer
Generates pytest tests following:
- AAA pattern (Arrange, Act, Assert)
- Coverage for happy path, edge cases, exceptions
- Proper use of fixtures and mocks

### Doc Writer
Creates documentation:
- Google-style docstrings
- Module-level READMEs
- API documentation

### Architect
Analyzes:
- Project structure and organization
- Code architecture and layering
- Design patterns and anti-patterns
- Extensibility and maintainability

### Debugger
Helps with:
- Error stack trace analysis
- Root cause identification
- Fix suggestions with prevention tips

## Hooks

### Python Auto-formatting
Automatically formats Python files on save:
- **black**: Code formatting
- **isort**: Import sorting

## Requirements

For Python formatting hook:
```bash
pip install black isort
```

## Marketplace Structure

```
claude-init/
├── .claude-plugin/
│   └── marketplace.json    # Marketplace manifest
├── plugins/
│   └── claude-init/        # claude-init plugin
│       ├── .claude-plugin/
│       │   └── plugin.json
│       ├── skills/
│       │   └── init-project/
│       │       └── SKILL.md
│       ├── agents/
│       │   ├── code-reviewer/
│       │   ├── test-writer/
│       │   ├── doc-writer/
│       │   ├── architect/
│       │   └── debugger/
│       └── hooks/
│           └── hooks.json
└── README.md
```

## Development

### Local Testing

```bash
claude --plugin-dir /path/to/claude-init
```

### Contributing

1. Fork this repository
2. Create your feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License - see [LICENSE](LICENSE) for details.

## Author

[ZaVang](https://github.com/ZaVang)
