---
name: autoupdate
description: One-click upgrade Claude Code to the latest version, then fetch and summarize all release changelogs between the old version and new version, with detailed explanations of core new features.
disable-model-invocation: false
allowed-tools: Bash, WebFetch, WebSearch, Read, Write
---

# Claude Code Auto-Update Skill

Upgrade Claude Code to the latest version and generate a comprehensive changelog report covering every release between the user's current version and the new latest version.

## Workflow

### Step 1: Detect Current Version

Run the following to get the currently installed version:

```bash
claude --version
```

Also try npm to get exact installed package version:

```bash
npm list -g @anthropic-ai/claude-code --depth=0 2>/dev/null || npx --yes npm-check-updates -g @anthropic-ai/claude-code 2>/dev/null | head -5
```

Parse and store the current version string (e.g., `1.2.3`).

### Step 2: Fetch Latest Version from npm Registry

```bash
npm view @anthropic-ai/claude-code version
```

Compare with current version. If already at latest, inform the user and offer to still show recent changelogs (last 3–5 releases). Ask:

> "You're already on the latest version (X.Y.Z). Would you like to see the recent changelog anyway?"

### Step 3: Fetch All Release Notes Between Versions

Use WebFetch to retrieve the official GitHub releases page:

```
https://github.com/anthropics/claude-code/releases
```

Alternatively fetch the raw CHANGELOG or RELEASE NOTES if available. Collect every release tag between `current_version` (exclusive) and `latest_version` (inclusive).

**Strategy:**
1. First try: `https://github.com/anthropics/claude-code/releases` — parse release list
2. Fallback: Use WebSearch for `site:github.com anthropics claude-code releases changelog`
3. For each version tag, fetch individual release notes from:
   `https://github.com/anthropics/claude-code/releases/tag/v<VERSION>`

### Step 4: Perform the Upgrade

Before upgrading, display a summary of what will happen and ask for confirmation:

```
Current version:  v<CURRENT>
Latest version:   v<LATEST>
Releases to skip: <N> versions

Upgrade now? [Y/n]
```

If confirmed, run the upgrade:

```bash
npm update -g @anthropic-ai/claude-code
```

If `npm` is not available or fails, try:

```bash
npm install -g @anthropic-ai/claude-code@latest
```

Verify the upgrade succeeded:

```bash
claude --version
```

### Step 5: Generate Changelog Report

Using the `changelog-analyst` agent (or inline analysis), generate a structured report.

**Report format:**

---

## Claude Code Update Report

**Upgraded:** `v<OLD>` → `v<NEW>`
**Releases covered:** <N> versions
**Date:** <today>

---

### Version-by-Version Summary

For each release between old and new (chronological, oldest first):

```
## v<VERSION> — <release date>

**Summary:** <1–2 sentence overview of this release's theme>

### New Features
- <feature name>: <brief description>
- ...

### Improvements
- ...

### Bug Fixes
- ...

### Breaking Changes (if any)
- ...
```

---

### Core Feature Deep-Dives

For any features flagged as **major** or **core** across all releases, expand with a detailed explanation:

```
## Deep Dive: <Feature Name>

**Introduced in:** v<VERSION>

**What it is:**
<2–4 paragraphs explaining the feature in depth — what problem it solves,
how it works, how users interact with it, and any configuration options.>

**Example usage:**
<code snippet or command example if applicable>

**Why it matters:**
<Explain the impact on developer workflow or Claude Code capability.>
```

Apply deep-dive treatment to features such as (but not limited to):
- New slash commands or agents
- MCP server changes
- Memory / context improvements
- Hooks system changes
- Model upgrades or new model support
- Permission system changes
- IDE integrations
- Performance improvements affecting large codebases

---

### What's Next

If release notes mention upcoming features or roadmap items, list them here.

---

## Output

Save the report to a file: `~/.claude/update-report-v<OLD>-to-v<NEW>.md`

Then print the full report to the terminal for immediate reading.

Finish with:

```
✓ Claude Code upgraded to v<NEW>
✓ Report saved to ~/.claude/update-report-v<OLD>-to-v<NEW>.md
```

## Error Handling

- If npm upgrade fails due to permissions: suggest `sudo npm install -g @anthropic-ai/claude-code@latest` and explain the risk
- If GitHub releases are unreachable: use WebSearch to find changelogs from other sources (official docs, blog posts)
- If version parsing fails: ask the user to manually provide their current version
- If no internet: perform upgrade only, skip changelog report, notify user
