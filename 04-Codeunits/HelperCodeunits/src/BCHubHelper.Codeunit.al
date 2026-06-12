codeunit 50400 "BCHub Helper"
{
    procedure IsValidEmail(Email: Text): Boolean
    begin
        exit(Email.Contains('@') and Email.Contains('.') and (StrPos(Email, '@') > 1));
    end;

    procedure SafeDivide(Numerator: Decimal; Denominator: Decimal): Decimal
    begin
        if Denominator = 0 then exit(0);
        exit(Numerator / Denominator);
    end;

    procedure TruncateText(InputText: Text; MaxLength: Integer): Text
    begin
        if StrLen(InputText) <= MaxLength then exit(InputText);
        exit(CopyStr(InputText, 1, MaxLength - 3) + '...');
    end;

    procedure DateToISO8601(d: Date): Text
    begin
        exit(Format(d, 0, '<Year4>-<Month,2>-<Day,2>'));
    end;

    procedure GetCompanyName(): Text[30]
    var
        CompInfo: Record "Company Information";
    begin
        if CompInfo.Get() then exit(CompInfo.Name);
        exit('');
    end;
}