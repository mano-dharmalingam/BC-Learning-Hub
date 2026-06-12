# Junior AL Developer — Interview Q&A

**Q1: Difference between Text and Code?**
> Text is variable-length, case-sensitive. Code is always uppercase, trailing spaces trimmed. Use Code for identifiers (No., Item No.), Text for descriptions.

**Q2: FindFirst vs FindSet vs Get?**
> `Get(key)` — one record by PK, errors if missing. `FindFirst()` — first matching record, returns false if none. `FindSet()` — prepares cursor for loop with `repeat...until Next() = 0`.

**Q3: What is a FlowField?**
> Calculated virtual field. Uses CalcFormula (Sum, Count, Exist, Lookup). No DB storage. Must call `CalcFields()` before reading.

**Q4: What is DataClassification?**
> GDPR-required attribute on all custom table fields. Options: CustomerContent, EndUserIdentifiableInformation, SystemMetadata, etc. AppSource validation fails without it.

**Q5: AL loop types?**
> `for i := 1 to n` — fixed count. `foreach x in list` — collection. `while cond` — pre-check. `repeat...until cond` — post-check (always runs once).

**Q6: Temporary table?**
> `var Buf: Record "MyTable" temporary;` — in-memory only, never writes to DB, lost when variable goes out of scope.

**Q7: SetRange vs SetFilter?**
> `SetRange(Field, Value)` — exact match (= or BETWEEN). `SetFilter(Field, '>%1', Value)` — supports operators, wildcards, OR logic.

**Q8: Modify() vs Modify(true)?**
> `Modify(false/omitted)` — skips OnModify trigger. `Modify(true)` — runs trigger. Always pass true unless you specifically need to skip.

**Q9: Error() vs Message()?**
> `Error()` — stops execution, rolls back any uncommitted transaction. `Message()` — informational popup, execution continues.

**Q10: What does NotBlank = true do on a field?**
> Prevents saving the record if the field is empty. Validates at the page level and on Insert/Modify.