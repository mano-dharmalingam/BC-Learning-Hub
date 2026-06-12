# Deployment Architecture

## SaaS (BC Online)
```mermaid
graph TB
    subgraph Azure
        subgraph BC[BC Online Tenant]
            App[AL Extension]
            DB[(BC Database)]
        end
        OAI[Azure OpenAI]
        SB[Service Bus]
        Blob[Blob Storage]
    end
    Browser --> BC
    App --> OAI
    App --> SB
    App --> Blob
```

## On-Premises
```mermaid
graph TB
    subgraph Server[On-Prem Server]
        BCServer[BC Server]
        SQL[(SQL Server)]
    end
    Client --> BCServer
    BCServer --> SQL
```

## Multi-Tenant ISV
Single .app file deployed across N tenants.
Each tenant data isolated in separate BC company/database.
Use Isolated Storage (Module scope) for per-tenant secrets.