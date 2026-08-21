# Spec: [EPIC NAME] — Ticket Breakdown

**Source**: [Jira epic key | Confluence page id | local PRD path]
**Created**: [DATE]
**Foundation Type**: [from /directive/foundation.md]

## Epic summary
[2–4 sentences: the outcome this epic delivers.]

## Stories

### S1 — [Story title]
- **Slice**: [the vertical slice this delivers, end to end]
- **Scope**: [what's in]
- **Out of scope**: [what's explicitly not]
- **Files (est.)**: [paths/areas likely touched]
- **Depends on**: [none | S#]
- **Acceptance criteria**:
  - [ ] [Given/When/Then or checkable statement]
- **Jira**: [key once created]

### S2 — [Story title]
[… same shape …]

## Dependency graph
```
S1 ──▶ S3
S2 ──▶ S3
S4 (independent)
```

## Execution waves
- **Wave 1 (parallel)**: S1, S2, S4
- **Wave 2**: S3 (after S1, S2)

## Notes
- [Cross-cutting concerns, risks, sequencing rationale]
