# Reference Materials — Spring Boot Domain

This domain ships lightweight guidance and defers project scaffolding to the official generator skill.

## Official Spring Boot generator (install via `/setup:springboot`)

[`jdubois/dr-jskill`](https://github.com/jdubois/dr-jskill) — Julien Dubois' **Dr JSkill**, a Spring Boot 4.x project generator (Java 25, PostgreSQL, Docker, optional Vue/React/Angular frontends). Install it with the `setup` plugin:

```
/setup:springboot
```

Use it to scaffold new Spring Boot projects following Julien Dubois' best practices; this domain then supplies the foundation, detection, and spec/plan/tasks/docs templates for ongoing work.

## When referenced

- **Spec / Plan**: this README + `profile.md` best practices are sufficient.
- **Implementation**: use Dr JSkill (via `/setup:springboot`) for scaffolding; follow the layering and testing principles in `profile.md` / `analyze.md`.
- **Docs**: use the `Docs.md` template's architecture + api-reference sections.

Add local reference `.md` files here (e.g. project-specific patterns) and register them in `../profile.md` for on-demand loading.
