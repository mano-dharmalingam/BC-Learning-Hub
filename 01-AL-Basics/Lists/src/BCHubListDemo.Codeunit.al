codeunit 50103 "BCHub List Demo"
{
    procedure CollectOverdueCustomers()
    var
        OverdueCustNos : List of [Code[20]];
        CustLedgEntry  : Record "Cust. Ledger Entry";
        CustNo         : Code[20];
    begin
        CustLedgEntry.SetRange(Open, true);
        CustLedgEntry.SetFilter("Due Date", '<%1', Today());
        if CustLedgEntry.FindSet() then
            repeat
                if not OverdueCustNos.Contains(CustLedgEntry."Customer No.") then
                    OverdueCustNos.Add(CustLedgEntry."Customer No.");
            until CustLedgEntry.Next() = 0;

        Message('%1 overdue customers found.', OverdueCustNos.Count());

        foreach CustNo in OverdueCustNos do
            ; // Process each
    end;

    procedure ListOperationsDemo()
    var
        Names : List of [Text[100]];
        Name  : Text[100];
    begin
        Names.Add('Alice');
        Names.Add('Bob');
        Names.Add('Charlie');
        Names.Remove('Bob');
        Message('Count: %1, First: %2', Names.Count(), Names.Get(1));
    end;
}