# Solution Architect — Interview Q&A

**Q1: Multi-tenant ISV extension design?**
> All config in BC tables (never files). Isolated Storage (Module scope) for secrets — isolated per tenant. No global variables for tenant state. Clear upgrade codeunits with UpgradeTag checks. OnInstallAppPerCompany for per-company init. Events for customer extensibility. Versioned APIs.

**Q2: Synchronous REST vs async Service Bus?**
> REST: immediate response, user waits, tight coupling, simpler error handling. Use for real-time lookups, small payloads. Service Bus: fire-and-forget, decoupled, scalable, BC doesn't wait. Requires retry logic, dead-letter queue, idempotent consumers. Use for high-volume sync, long-running processing, multi-system fan-out.

**Q3: Performance for 500K record report?**
> ProcessingOnly = true (no render). SetLoadFields. ReadUncommitted. Batch via Task Scheduler. Use Query object for joins instead of nested loops. Profile with BC Performance Profiler. Consider moving aggregation to Query with SIFT keys.

**Q4: Upgrade codeunit design?**
> Must be idempotent. Check UpgradeTag.HasUpgradeTag() before migrating. SetUpgradeTag() when done. Never Error() inside — catch and log. Test: install old version → upgrade in container.

**Q5: Extension dependency and decoupling strategy?**
> Define Integration Events — let others subscribe. Use Interfaces for swappable implementations. Avoid AppInfo.IsInstalled() checks — brittle. Publish symbol packages for downstream ISVs. Never change event signatures — add new events. Document your event catalog.