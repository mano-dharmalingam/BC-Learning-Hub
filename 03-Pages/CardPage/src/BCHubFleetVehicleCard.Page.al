page 50300 "BCHub Fleet Vehicle Card"
{
    Caption = 'Fleet Vehicle Card';
    PageType = Card;
    SourceTable = "BCHub Fleet Vehicle";
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Vehicle No."; Rec."Vehicle No.") { ApplicationArea = All; }
                field(Description; Rec.Description)     { ApplicationArea = All; }
                field("Registration No."; Rec."Registration No.") { ApplicationArea = All; }
                field(Status; Rec.Status)               { ApplicationArea = All; }
                field(Active; Rec.Active)               { ApplicationArea = All; }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Driver Employee No."; Rec."Driver Employee No.") { ApplicationArea = All; }
                field("Purchase Date"; Rec."Purchase Date")             { ApplicationArea = All; }
                field("Last Service Date"; Rec."Last Service Date")     { ApplicationArea = All; }
                field("Mileage (km)"; Rec."Mileage (km)")               { ApplicationArea = All; }
            }
            group(Notes)
            {
                Caption = 'Notes';
                field(Notes; Rec.Notes) { ApplicationArea = All; MultiLine = true; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ServiceRecord)
            {
                Caption = 'Record Service';
                ApplicationArea = All;
                Image = Repair;
                trigger OnAction()
                begin
                    Rec."Last Service Date" := Today();
                    Rec.Modify();
                    Message('Service date updated to %1', Today());
                end;
            }
        }
    }
}