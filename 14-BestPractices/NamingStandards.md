# AL Naming Standards

## Object Naming
| Object | Pattern | Example |
|--------|---------|---------|
| Table | [Publisher] [Feature] [Entity] | BCHub Fleet Vehicle |
| Page | [Publisher] [Entity] [PageType] | BCHub Fleet Vehicle Card |
| Codeunit | [Publisher] [Feature] [Role] | BCHub Label Printer |
| Report | [Publisher] [Report Name] | BCHub Vehicle Usage Report |
| Enum | [Publisher] [Entity] [Attribute] | BCHub Vehicle Status |
| Interface | [Publisher] I[Contract] | BCHub INotificationSender |

## Variable Naming
- Records: singular noun matching table — `Customer`, `SalesHeader`
- Boolean: `Active`, `Posted`, `Blocked` (not `IsActive`)
- Loop counter: `i`, `j` for simple; descriptive for complex

## Object ID Ranges
| Range | Use |
|-------|-----|
| 50000–99999 | On-premise customer objects |
| 70000000–74999999 | AppSource apps |