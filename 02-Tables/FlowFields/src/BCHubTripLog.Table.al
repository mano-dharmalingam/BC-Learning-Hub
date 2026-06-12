table 50202 "BCHub Trip Log"
{
    Caption = 'Trip Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(2; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = CustomerContent;
            TableRelation = "BCHub Fleet Vehicle"."Vehicle No.";
        }
        field(3; "Trip Date"; Date)
        {
            Caption = 'Trip Date';
            DataClassification = CustomerContent;
        }
        field(4; "Distance (km)"; Decimal)
        {
            Caption = 'Distance (km)';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(5; Purpose; Text[100])
        {
            Caption = 'Purpose';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(Vehicle; "Vehicle No.", "Trip Date")
        {
            SumIndexFields = "Distance (km)";
        }
    }
}