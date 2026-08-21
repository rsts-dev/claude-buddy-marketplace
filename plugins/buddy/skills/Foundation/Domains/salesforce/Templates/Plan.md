---
description: "Salesforce (SFDX) implementation plan template"
---

# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]`
**Spec**: [link]
**Created**: [DATE]
**Status**: Draft
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

---

## Technical Context *(mandatory)*

### Platform Stack
- **API Version**: [sourceApiVersion from sfdx-project.json]
- **UI**: [LWC / Aura]
- **Automation**: [Flow-first / Apex]
- **Deploy**: Salesforce CLI (`sf project deploy`)
- **Test**: Apex tests [+ LWC Jest]

### Existing Patterns
[Existing objects, service/selector/trigger-handler patterns, LWC conventions this should follow]

### Dependencies
[New packages, permission sets, or metadata required, with justification]

---

## Foundation Check *(mandatory)*

| Principle | Status | Notes |
|-----------|--------|-------|
| Bulkification (no SOQL/DML in loops) | Compliant / Needs Justification | [details] |
| LWC over Aura for new UI | Compliant / Needs Justification | [details] |
| Declarative-first automation | Compliant / Needs Justification | [details] |
| Apex coverage ≥75% | Compliant / Needs Justification | [details] |

---

## Implementation Phases *(mandatory)*

### Phase 0: Research *(if needed)*
- [Unknowns: limits, packaging, integration approach]

### Phase 1: Data Model & Security
- [Custom objects/fields, relationships]
- [Permission sets, sharing, FLS]

### Phase 2: Automation & Logic
- [Flows first; Apex trigger handlers / service classes where needed]
- [TDD: Apex test classes before/with implementation]

### Phase 3: UI
- [LWC components; Jest tests]

### Phase 4: Integration & Polish
- [Callouts / Platform Events; edge cases; docs]

---

## Testing Strategy *(mandatory)*
- **Apex Unit Tests**: [classes, ≥75% coverage, positive/negative/bulk]
- **LWC Jest**: [components to cover]
- **Manual/UAT**: [scratch org validation steps]

---

## Complexity Tracking
- New metadata: ~[estimate] (Apex classes, LWC, objects, Flows)
- Test code: ~[estimate]
- Governor-limit exposure: [notes]

---

## Execution Status
- [ ] Spec loaded and understood
- [ ] Data model + security designed
- [ ] Foundation check passed
- [ ] Automation approach chosen (declarative vs Apex)
- [ ] Testing strategy planned
