interface "BCHub IReportGenerator"
{
    procedure Generate(DocumentNo: Code[20]): Text;
    procedure GetReportName(): Text;
}

codeunit 51500 "BCHub PDF Generator" implements "BCHub IReportGenerator"
{
    procedure Generate(DocumentNo: Code[20]): Text
    begin
        exit(StrSubstNo('PDF generated for %1', DocumentNo));
    end;
    procedure GetReportName(): Text
    begin
        exit('PDF Generator');
    end;
}

codeunit 51501 "BCHub Excel Generator" implements "BCHub IReportGenerator"
{
    procedure Generate(DocumentNo: Code[20]): Text
    begin
        exit(StrSubstNo('Excel generated for %1', DocumentNo));
    end;
    procedure GetReportName(): Text
    begin
        exit('Excel Generator');
    end;
}

enum 51500 "BCHub Report Output Type" implements "BCHub IReportGenerator"
{
    Extensible = true;
    value(0; PDF)   { Caption = 'PDF';   Implementation = "BCHub IReportGenerator" = "BCHub PDF Generator"; }
    value(1; Excel) { Caption = 'Excel'; Implementation = "BCHub IReportGenerator" = "BCHub Excel Generator"; }
}

codeunit 51502 "BCHub Report Factory"
{
    procedure CreateGenerator(OutputType: Enum "BCHub Report Output Type"): Interface "BCHub IReportGenerator"
    var
        Generator: Interface "BCHub IReportGenerator";
    begin
        Generator := OutputType;
        exit(Generator);
    end;
}