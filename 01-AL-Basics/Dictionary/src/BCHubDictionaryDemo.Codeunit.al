codeunit 50104 "BCHub Dictionary Demo"
{
    procedure TaxRateLookup()
    var
        TaxRates    : Dictionary of [Code[10], Decimal];
        CountryCode : Code[10];
        Countries   : List of [Code[10]];
        Rate        : Decimal;
    begin
        TaxRates.Add('GB', 20.0);
        TaxRates.Add('DE', 19.0);
        TaxRates.Add('US', 0.0);
        TaxRates.Add('FR', 20.0);
        TaxRates.Add('NL', 21.0);

        CountryCode := 'DE';
        if TaxRates.ContainsKey(CountryCode) then
            Message('Rate for %1: %2%%', CountryCode, TaxRates.Get(CountryCode));

        Countries := TaxRates.Keys();
        foreach CountryCode in Countries do begin
            Rate := TaxRates.Get(CountryCode);
            // process Rate
        end;
        Message('Countries configured: %1', TaxRates.Count());
    end;
}