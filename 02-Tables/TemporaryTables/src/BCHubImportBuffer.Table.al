table 50203 "BCHub Import Buffer"
{
    Caption = 'Import Buffer';
    TableType = Temporary;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)      { Caption = 'Line No.'; DataClassification = CustomerContent; }
        field(2; "Customer No."; Code[20]) { Caption = 'Customer No.'; DataClassification = CustomerContent; }
        field(3; "Customer Name"; Text[100]) { Caption = 'Customer Name'; DataClassification = CustomerContent; }
        field(4; Amount; Decimal)          { Caption = 'Amount'; DataClassification = CustomerContent; }
        field(5; "Has Error"; Boolean)     { Caption = 'Has Error'; DataClassification = CustomerContent; }
        field(6; "Error Text"; Text[500])  { Caption = 'Error Text'; DataClassification = CustomerContent; }
        field(7; Processed; Boolean)       { Caption = 'Processed'; DataClassification = CustomerContent; }
    }

    keys
    {
        key(PK; "Line No.") { Clustered = true; }
        key(Errors; "Has Error") { }
    }
}