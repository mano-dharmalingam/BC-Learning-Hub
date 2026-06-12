codeunit 50100 "BCHub Variable Demo"
{
    procedure DemonstrateVariables()
    var
        CustomerName : Text[100];
        Balance      : Decimal;
        IsActive     : Boolean;
        EntryNo      : Integer;
        CreatedDate  : Date;
        Description  : Text;
    begin
        CustomerName := 'Contoso Ltd.';
        Balance      := 12500.75;
        IsActive     := true;
        EntryNo      := 1001;
        CreatedDate  := Today();
        Description  := 'New customer onboarded via portal.';

        if IsActive then
            Message('Customer: %1\nBalance: %2\nEntry: %3',
                CustomerName, Balance, EntryNo);
    end;
}