codeunit 51503 "BCHub Vehicle Repository"
{
    procedure GetById(VehicleNo: Code[20]; var Vehicle: Record "BCHub Fleet Vehicle"): Boolean
    begin
        exit(Vehicle.Get(VehicleNo));
    end;

    procedure GetActiveVehicles(var Vehicle: Record "BCHub Fleet Vehicle")
    begin
        Vehicle.Reset();
        Vehicle.SetRange(Active, true);
        Vehicle.SetLoadFields("Vehicle No.", Description, Status, "Driver Employee No.");
    end;

    procedure GetByStatus(Status: Enum "BCHub Vehicle Status"; var Vehicle: Record "BCHub Fleet Vehicle")
    begin
        Vehicle.Reset();
        Vehicle.SetRange(Status, Status);
    end;

    procedure Save(var Vehicle: Record "BCHub Fleet Vehicle")
    begin
        if not Vehicle.Find() then Vehicle.Insert(true)
        else Vehicle.Modify(true);
    end;

    procedure CountByStatus(Status: Enum "BCHub Vehicle Status"): Integer
    var
        Vehicle: Record "BCHub Fleet Vehicle";
    begin
        Vehicle.SetRange(Status, Status);
        exit(Vehicle.Count());
    end;
}