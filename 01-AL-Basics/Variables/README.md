# AL Variables

## Objective
Understand how to declare and use variables in AL.

## Business Scenario
A developer needs to store customer name, balance, and status for processing.

## Concepts Covered
- var keyword
- Local vs global scope
- Pascal case naming

## AL Code Example
```al
codeunit 50100 "BCHub Variable Demo"
{
    procedure DemonstrateVariables()
    var
        CustomerName : Text[100];
        Balance      : Decimal;
        IsActive     : Boolean;
        EntryNo      : Integer;
        CreatedDate  : Date;
    begin
        CustomerName := 
```

## Step-by-Step Explanation
'

## Screenshots
> Add screenshots here after running in BC sandbox.

## References
- [Microsoft AL Documentation](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-programming-in-al)
- [BC Developer Docs](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-dev-overview)