# Performance Guidelines

## SetLoadFields
```al
Customer.SetLoadFields("No.", Name, "Balance (LCY)");  // Load only 3 fields
Customer.FindSet();
```

## Avoid N+1 Queries
Never call Get() or FindFirst() inside a FindSet() loop.
Pre-load or restructure your query.

## SIFT
Add `SumIndexFields` to table keys used by FlowFields.
CalcFields on a SIFT field = instant; without SIFT = full table scan.

## ModifyAll
```al
// One SQL UPDATE instead of N individual Modify() calls
Rec.ModifyAll(Status, Rec.Status::Closed);
```

## ReadIsolation
```al
Customer.ReadIsolation := IsolationLevel::ReadUncommitted;
// Fastest reads; no locks; for reports/lists only
```