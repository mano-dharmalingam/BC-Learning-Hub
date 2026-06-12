# Technical Lead — Interview Q&A

**Q1: CI/CD pipeline for BC AL team?**
> Git: main → develop → feature branches. PR to develop: compile + AL Test Runner via BcContainerHelper in GitHub Actions/Azure DevOps. Merge to main: auto-deploy to Dev, manual approval for UAT/Prod. Code-sign before push. Tag releases with semantic version.

**Q2: Object ID range management?**
> Assign sub-ranges per developer/feature in shared doc. Enforce via PR check scanning new object IDs. For AppSource: request formal range from Microsoft Partner Center (70M+ range).

**Q3: Breaking changes in published API?**
> Never rename entity/field names or remove fields. Add new fields as optional. Breaking change = new API version (v2.0), keep v1.0 running. Deprecate with ObsoleteState = Pending. Give consumers 6+ months migration window.

**Q4: AL code review checklist?**
> - Object IDs in correct range
> - DataClassification on all fields
> - No hardcoded user-visible strings (use labels)
> - SetLoadFields on large reads
> - No queries in loops
> - Error handling with meaningful messages
> - Events exposed for extensibility
> - Upgrade codeunit if schema changed
> - app.json version incremented

**Q5: AL testing strategy?**
> AL Test Codeunits with [Test] procedures. Use LibraryVariableStorage for test isolation. Mock HTTP calls via EventSubscriber. Test upgrade paths in containers. Automate in CI; fail build on failure.