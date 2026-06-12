# ApprovalWorkflow — Architecture

## System Overview
```mermaid
graph TB
    subgraph BC[Business Central]
        A[Custom Tables] --> B[AL Codeunits]
        B --> C[BC Pages/APIs]
    end
    subgraph External
        D[External System]
    end
    C <-->|REST/OData| D
```

## Key Technologies
Events, Approval Entry, Email

## Data Flow
1. External trigger or user action
2. AL validates input
3. Business logic executes
4. Events fire for extensibility
5. Data committed
6. Response returned
