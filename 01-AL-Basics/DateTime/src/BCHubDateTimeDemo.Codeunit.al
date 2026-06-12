codeunit 50108 "BCHub DateTime Demo"
{
    procedure DateCalculations()
    var
        OrderDate : Date;
        DueDate   : Date;
        FiscalEnd : Date;
        Days      : Integer;
        Yr, Mo, Dy: Integer;
    begin
        OrderDate := Today();
        DueDate   := CalcDate('<+30D>', OrderDate);
        FiscalEnd := CalcDate('<CY>', Today());

        Yr   := Date2DMY(OrderDate, 3);
        Mo   := Date2DMY(OrderDate, 2);
        Dy   := Date2DMY(OrderDate, 1);
        Days := DueDate - OrderDate;

        Message('Today: %1\nDue (+30d): %2\nYear end: %3',
            OrderDate, DueDate, FiscalEnd);
    end;

    procedure FormatDates()
    var
        d : Date;
    begin
        d := Today();
        Message('Default: %1\nISO: %2\nCustom: %3',
            Format(d),
            Format(d, 0, '<Year4>-<Month,2>-<Day,2>'),
            Format(d, 0, '<Day,2>/<Month,2>/<Year4>'));
    end;
}