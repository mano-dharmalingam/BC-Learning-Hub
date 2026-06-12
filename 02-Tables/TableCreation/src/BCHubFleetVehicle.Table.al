table 50200 "BCHub Fleet Vehicle"
{
    Caption = 'Fleet Vehicle';
    DataClassification = CustomerContent;
    LookupPageId = "BCHub Fleet Vehicle List";
    DrillDownPageId = "BCHub Fleet Vehicle List";

    fields
    {
        field(1; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Registration No."; Code[20])
        {
            Caption = 'Registration No.';
            DataClassification = CustomerContent;
        }
        field(4; Status; Enum "BCHub Vehicle Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(5; "Driver Employee No."; Code[20])
        {
            Caption = 'Driver Employee No.';
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";
        }
        field(6; "Purchase Date"; Date)
        {
            Caption = 'Purchase Date';
            DataClassification = CustomerContent;
        }
        field(7; "Mileage (km)"; Decimal)
        {
            Caption = 'Mileage (km)';
            DecimalPlaces = 0 : 0;
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(8; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(9; "Last Service Date"; Date)
        {
            Caption = 'Last Service Date';
            DataClassification = CustomerContent;
        }
        field(10; Notes; Text[2048])
        {
            Caption = 'Notes';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Vehicle No.") { Clustered = true; }
        key(Status; Status) { }
        key(Driver; "Driver Employee No.") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Vehicle No.", Description, Status) { }
        fieldgroup(Brick; "Vehicle No.", Description, "Registration No.", Status) { }
    }

    trigger OnInsert()
    begin
        if "Purchase Date" = 0D then
            "Purchase Date" := Today();
        Active := true;
    end;
}

enum 50200 "BCHub Vehicle Status"
{
    Extensible = true;
    value(0; Available) { Caption = 'Available'; }
    value(1; InUse)     { Caption = 'In Use'; }
    value(2; Maintenance) { Caption = 'In Maintenance'; }
    value(3; Retired)   { Caption = 'Retired'; }
}