# Error Handling Patterns

## Error vs Message vs Confirm
```al
Error('Customer %1 is blocked.', CustomerNo);       // Stops execution
Message('Processing complete: %1 records.', Count); // Informational
if not Confirm('Delete %1 records?', false, Count) then exit;
```

## TryFunction (BC 2020+)
```al
[TryFunction]
local procedure TryGetCustomer(No: Code[20]; var Cust: Record Customer): Boolean
begin
    Cust.Get(No);
end;

if not TryGetCustomer('C001', Customer) then
    Error('Customer not found.');
```

## Bulk Import Pattern
```al
procedure ProcessImport(var Buffer: Record "BCHub Import Buffer" temporary)
var
    ErrorText : Text;
begin
    Buffer.Reset();
    if Buffer.FindSet(true) then
        repeat
            if not ValidateLine(Buffer, ErrorText) then begin
                Buffer."Has Error" := true;
                Buffer."Error Text" := CopyStr(ErrorText, 1, 500);
                Buffer.Modify();
            end;
        until Buffer.Next() = 0;
    Message('Validation complete.');
end;
```