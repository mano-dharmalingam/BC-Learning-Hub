# BC Integration Patterns

## Pattern 1: Synchronous REST
```mermaid
sequenceDiagram
    participant BC as Business Central
    participant Ext as External System
    BC->>Ext: POST /api/orders
    Ext-->>BC: 200 OK {orderId}
```
Use when: real-time response needed.

## Pattern 2: Async Service Bus
```mermaid
sequenceDiagram
    participant BC as Business Central
    participant SB as Azure Service Bus
    participant Fn as Azure Function
    BC->>SB: Publish message
    SB->>Fn: Trigger
    Fn->>BC: Callback webhook
```
Use when: high volume, long-running processing.

## Pattern 3: Webhook Push
```mermaid
sequenceDiagram
    participant BC as Business Central
    participant App as External App
    Note over BC: Record posted
    BC->>App: POST webhook payload
    App-->>BC: 200 Accepted
```
Use when: external systems react to BC events.

## Pattern 4: OData Pull
Use when: Power BI, Power Apps, reporting tools read BC data.

## Selection Guide
| Scenario | Pattern |
|----------|---------|
| Portal order submission | Synchronous REST |
| Nightly ERP sync | Async Service Bus |
| Invoice posted → notify | Webhook Push |
| Power BI dashboard | OData Pull |