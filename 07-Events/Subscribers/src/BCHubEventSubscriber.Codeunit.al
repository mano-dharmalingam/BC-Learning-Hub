codeunit 50701 "BCHub Event Subscriber"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeInsert', '', false, false)]
    local procedure OnBeforeCustomerInsert(var Rec: Record Customer; var IsHandled: Boolean)
    begin
        if Rec.Name = '' then begin
            IsHandled := true;
            Error('Customer name is required before inserting.');
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterSalesHeaderInsert(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    begin
        if not RunTrigger then exit;
        if Rec."Document Type" = Rec."Document Type"::Order then
            ; // Log new sales order
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"BCHub Event Publisher", 'OnAfterVehicleActivated', '', false, false)]
    local procedure HandleVehicleActivated(var Vehicle: Record "BCHub Fleet Vehicle")
    begin
        Vehicle."Purchase Date" := Today();
        Vehicle.Modify();
    end;
}