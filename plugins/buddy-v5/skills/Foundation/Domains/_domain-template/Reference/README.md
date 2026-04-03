# Reference Materials

This directory contains domain-specific reference documentation loaded on-demand by workflows.

## Adding Reference Materials

1. Place `.md` files in this directory
2. Register them in `../profile.md` under the **Reference Materials** table
3. Set the `Load When` column to indicate which workflow phases should load the file:
   - `Spec` — Loaded during specification generation
   - `Plan` — Loaded during implementation planning
   - `Tasks` — Loaded during task breakdown
   - `Implementation` — Loaded during task execution
   - `Docs` — Loaded during documentation generation

## Guidelines

- Keep files focused on a single topic
- Include practical code examples
- Reference materials are loaded on-demand to avoid context bloat
- The `Best Practices Summary` in profile.md should contain a distilled version for quick reference
