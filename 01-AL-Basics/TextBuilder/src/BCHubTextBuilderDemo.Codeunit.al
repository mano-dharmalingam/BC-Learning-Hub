codeunit 50107 "BCHub TextBuilder Demo"
{
    procedure BuildCsvReport()
    var
        TB      : TextBuilder;
        Cust    : Record Customer;
        CsvText : Text;
    begin
        TB.AppendLine('CustomerNo,Name,City,Balance');

        Cust.SetRange(Blocked, Cust.Blocked::" ");
        if Cust.FindSet() then
            repeat
                TB.Append(Cust."No."); TB.Append(',');
                TB.Append(Cust.Name.Replace(',', ' ')); TB.Append(',');
                TB.Append(Cust.City); TB.Append(',');
                TB.AppendLine(Format(Cust."Balance (LCY)", 0, '<Precision,2:2><Standard Format,0>'));
            until Cust.Next() = 0;

        CsvText := TB.ToText();
        Message('CSV size: %1 chars', StrLen(CsvText));
    end;
}