# SDLC Integrations (MCP)

[< Back to SDLC README](../README.md) | [All Docs](../../../docs/README.md)

sdlc connects to the platforms where your SDLC actually lives — **Jira**, **Confluence**, and **GitHub** — through the Model Context Protocol (MCP). The `.mcp.json` at the repo root is part of the checked-in AI layer, so every teammate gets the same connections with zero setup.

> Rule of thumb (from Cole Medin): if a platform doesn't have an MCP server, prefer one that does.

## Which skills use which servers

| Server | Used by | For |
|--------|---------|-----|
| Atlassian (Jira) | `prime`, `spec`, `commit` | Read issues/epics; create stories; link tickets |
| Atlassian (Confluence) | `prime`, `spec` | Read PRDs/docs; publish the epic breakdown |
| GitHub | `review`, `commit` | PR diffs, PR creation, review comments |

## Setup

1. `/sdlc:init` scaffolds `.mcp.json` (Atlassian + GitHub) with placeholders if it doesn't exist.
2. Fill in credentials/tokens per each server's docs (do **not** commit secrets — use env references).
3. Restart the session so the MCP servers load. sdlc discovers their tools at runtime (via tool search).

Example shape (`.mcp.json`):
```json
{
  "mcpServers": {
    "atlassian": { "command": "…", "args": ["…"], "env": { "ATLASSIAN_API_TOKEN": "${ATLASSIAN_API_TOKEN}" } },
    "github":    { "command": "…", "args": ["…"], "env": { "GITHUB_TOKEN": "${GITHUB_TOKEN}" } }
  }
}
```
(The exact commands depend on the servers you choose; `init` writes current placeholders and a comment pointing here.)

## Graceful degradation

Every skill works without MCP — it just says what it's skipping:

| Missing | Behavior |
|---------|----------|
| Atlassian | `prime`/`spec` ask you to paste the ticket/PRD or pass a local file; publishing to Confluence and creating Jira stories are reported as **skipped** |
| GitHub | `review` prints the comment instead of posting; `commit` makes the local commit and prints the `gh pr create` command |
| `gh` CLI | `commit` stops after the local commit with the exact push/PR commands to run |

## PR-review GitHub Action (optional)

`/sdlc:review` can write `.github/workflows/claude-review.yml` so every PR is reviewed automatically and gets one comment. It needs an auth token stored as a repo secret. This is the "AI reviews every PR" pattern — it augments the human reviewer and QA, it doesn't replace them.
