codeunit 50105 "BCHub Loop Demo"
{
    procedure AllLoopTypes()
    var
        i       : Integer;
        Total   : Decimal;
        Names   : List of [Text[50]];
        Name    : Text[50];
        Counter : Integer;
        Value   : Integer;
    begin
        // FOR loop
        Total := 0;
        for i := 1 to 100 do
            Total += i;
        Message('Sum 1-100: %1', Total);

        // FOREACH loop
        Names.Add('Alice'); Names.Add('Bob'); Names.Add('Charlie');
        foreach Name in Names do
            Message('Hello %1', Name);

        // WHILE loop
        Counter := 0;
        while Counter < 5 do
            Counter += 1;

        // REPEAT-UNTIL (always runs at least once)
        Value := 1;
        repeat
            Value *= 2;
        until Value > 1000;
        Message('First power of 2 over 1000: %1', Value);
    end;

    procedure RecordLoop()
    var
        Customer : Record Customer;
        Count    : Integer;
    begin
        Count := 0;
        Customer.SetRange(Blocked, Customer.Blocked::" ");
        if Customer.FindSet() then
            repeat
                Count += 1;
            until Customer.Next() = 0;
        Message('Active customers: %1', Count);
    end;
}