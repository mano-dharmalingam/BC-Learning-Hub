page 50301 "BCHub Fleet Vehicle List"
{
    Caption = 'Fleet Vehicles';
    PageType = List;
    SourceTable = "BCHub Fleet Vehicle";
    CardPageId = "BCHub Fleet Vehicle Card";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(VehicleList)
            {
                field("Vehicle No."; Rec."Vehicle No.")             { ApplicationArea = All; }
                field(Description; Rec.Description)                  { ApplicationArea = All; }
                field("Registration No."; Rec."Registration No.")   { ApplicationArea = All; }
                field(Status; Rec.Status)                            { ApplicationArea = All; }
                field("Driver Employee No."; Rec."Driver Employee No.") { ApplicationArea = All; }
                field("Mileage (km)"; Rec."Mileage (km)")            { ApplicationArea = All; }
                field(Active; Rec.Active)                            { ApplicationArea = All; }
            }
        }
    }
}