# Senior AL Developer — Interview Q&A

**Q1: Explain SIFT.**
> Sum Index Field Technology. Pre-aggregates values for specific key combinations. FlowField CalcFields reads the SIFT table (O(1)) instead of scanning all records (O(n)). Define with SumIndexFields on a table key.

**Q2: Integration Events vs Business Events?**
> Integration Events: AL-to-AL. [IntegrationEvent] + [EventSubscriber]. No external exposure. Business Events: Exposed to Power Automate. [BusinessEvent]. Appear in the BC connector trigger list.

**Q3: When use SingleInstance codeunit?**
> Shared state within a session — e.g., cache setup table values so read once per session. Never use for user-specific data; all sessions share the same instance.

**Q4: Chain of Command (CoC)?**
> Extend base app method behavior. Your code runs before/after the original without needing an event. Supported on methods marked for extension. Runs: your pre-code → original → your post-code.

**Q5: Bulk insert best practices?**
> Insert(false) to skip trigger; wrap in transaction; use ModifyAll/DeleteAll instead of loops; SetLoadFields on source reads; batch commits every ~500 records.

**Q6: Isolated Storage?**
> Secure per-extension key-value store. Use for API keys, tokens, secrets. IsolatedStorage.Set(key, value, scope) / Get(key, scope, var value). Scope: Module, Company, User.

**Q7: ReadIsolation?**
> Controls SQL isolation: ReadUncommitted = dirty reads, no locks, fastest. Set on record: Rec.ReadIsolation := IsolationLevel::ReadUncommitted. Use for reports/lists only.

**Q8: How to call external REST API safely?**
> HttpClient + HttpRequestMessage. Store auth token in Isolated Storage. Wrap in error handler checking IsSuccessStatusCode(). Log failures. Allowlist endpoint in app.json permissions.