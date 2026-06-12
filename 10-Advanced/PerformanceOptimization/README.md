# Performance Optimization in AL

## 1. SetLoadFields — load only needed fields
```al
Customer.SetLoadFields("No.", Name, "Balance (LCY)");
Customer.FindSet();
```

## 2. Never query inside loops
```al
// BAD: N queries
SalesLine.FindSet();
repeat
    Item.Get(SalesLine."No.");  // 1 query per line!
until SalesLine.Next() = 0;

// GOOD: Use SetLoadFields + work with loaded data
```

## 3. SIFT keys for aggregation
Define SumIndexFields on table keys to make CalcFields instant.

## 4. ModifyAll / DeleteAll
```al
// Instead of loop + Modify:
Rec.ModifyAll(Status, Rec.Status::Closed);
```

## 5. ReadIsolation for reports
```al
Customer.ReadIsolation := IsolationLevel::ReadUncommitted;
```

## References
- [AL Performance Guide](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/performance/performance-developer)