codeunit 50109 "BCHub File Demo"
{
    procedure ExportCsvFile()
    var
        TempBlob  : Codeunit "Temp Blob";
        OutStream : OutStream;
        InStream  : InStream;
        FileName  : Text;
        TB        : TextBuilder;
        Customer  : Record Customer;
    begin
        TB.AppendLine('No.,Name,City,Balance');
        Customer.SetRange(Blocked, Customer.Blocked::" ");
        if Customer.FindSet() then
            repeat
                TB.Append(Customer."No."); TB.Append(',');
                TB.Append(Customer.Name); TB.Append(',');
                TB.Append(Customer.City); TB.Append(',');
                TB.AppendLine(Format(Customer."Balance (LCY)"));
            until Customer.Next() = 0;

        TempBlob.CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(TB.ToText());
        TempBlob.CreateInStream(InStream);
        FileName := 'Customers_' + Format(Today(), 0, '<Year4><Month,2><Day,2>') + '.csv';
        DownloadFromStream(InStream, 'Export', '', 'CSV|*.csv', FileName);
    end;
}