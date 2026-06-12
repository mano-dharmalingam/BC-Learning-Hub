codeunit 50700 "BCHub Event Publisher"
{
    [IntegrationEvent(false, false)]
    procedure OnBeforeVehicleActivated(var Vehicle: Record "BCHub Fleet Vehicle"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterVehicleActivated(var Vehicle: Record "BCHub Fleet Vehicle")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnTripLogged(VehicleNo: Code[20]; DistanceKm: Decimal; TripDate: Date)
    begin
    end;

    [BusinessEvent(false)]
    procedure OnVehicleStatusChanged(VehicleNo: Code[20]; NewStatus: Enum "BCHub Vehicle Status")
    begin
    end;
}