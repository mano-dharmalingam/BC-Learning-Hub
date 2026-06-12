page 50302 "BCHub Vehicle API"
{
    PageType = API;
    APIPublisher = 'bcHub';
    APIGroup = 'fleet';
    APIVersion = 'v1.0';
    EntityName = 'vehicle';
    EntitySetName = 'vehicles';
    SourceTable = "BCHub Fleet Vehicle";
    ODataKeyFields = "Vehicle No.";
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Vehicles)
            {
                field(vehicleNo; Rec."Vehicle No.")       { }
                field(description; Rec.Description)        { }
                field(registrationNo; Rec."Registration No.") { }
                field(status; Rec.Status)                  { }
                field(active; Rec.Active)                  { }
                field(mileageKm; Rec."Mileage (km)")       { }
                field(purchaseDate; Rec."Purchase Date")   { }
                field(lastServiceDate; Rec."Last Service Date") { }
            }
        }
    }
}