codeunit 50102 "BCHub Array Demo"
{
    procedure MonthlySalesAnalysis()
    var
        MonthlySales : array[12] of Decimal;
        MaxSales     : Decimal;
        PeakMonth    : Integer;
        i            : Integer;
    begin
        MonthlySales[1]  := 45000; MonthlySales[2]  := 38000;
        MonthlySales[3]  := 52000; MonthlySales[4]  := 61000;
        MonthlySales[5]  := 57000; MonthlySales[6]  := 49000;
        MonthlySales[7]  := 43000; MonthlySales[8]  := 55000;
        MonthlySales[9]  := 67000; MonthlySales[10] := 72000;
        MonthlySales[11] := 80000; MonthlySales[12] := 91000;

        MaxSales := 0;
        for i := 1 to ArrayLen(MonthlySales) do
            if MonthlySales[i] > MaxSales then begin
                MaxSales  := MonthlySales[i];
                PeakMonth := i;
            end;

        Message('Peak Month: %1\nSales: %2', PeakMonth, MaxSales);
    end;
}