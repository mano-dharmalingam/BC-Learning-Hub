# RAG — Retrieval-Augmented Generation

## Pattern
```
User Question
     │
     ▼
1. Extract keywords
2. Query BC tables (Item, Customer, G/L, etc.)
3. Format results as context text
4. Build prompt: System + Context + Question
5. Call Azure OpenAI
6. Return grounded answer
```

## Mermaid Diagram
```mermaid
sequenceDiagram
    participant U as User
    participant BC as BC Extension
    participant DB as BC Database
    participant AI as Azure OpenAI

    U->>BC: Ask question
    BC->>DB: Query relevant records
    DB-->>BC: Return data
    BC->>BC: Format as context
    BC->>AI: Prompt (system + context + question)
    AI-->>BC: Completion
    BC-->>U: Grounded answer
```

## Tips
- Keep context under 8,000 tokens
- Pre-filter BC data aggressively
- Show source references for user trust