codeunit 50106 "BCHub JSON Demo"
{
    procedure ParseOrderJson()
    var
        JsonObj   : JsonObject;
        JsonArr   : JsonArray;
        LineToken : JsonToken;
        ArrToken  : JsonToken;
        OrderNo   : Text;
        Amount    : Decimal;
        Payload   : Text;
        i         : Integer;
    begin
        Payload := '{"orderNo":"SO-001","amount":1500.00,"lines":[{"item":"A1","qty":5}]}';
        JsonObj.ReadFrom(Payload);

        JsonObj.SelectToken('orderNo', LineToken);
        OrderNo := LineToken.AsValue().AsText();

        JsonObj.SelectToken('amount', LineToken);
        Amount := LineToken.AsValue().AsDecimal();

        JsonObj.SelectToken('lines', ArrToken);
        JsonArr := ArrToken.AsArray();

        Message('Order: %1\nAmount: %2\nLines: %3', OrderNo, Amount, JsonArr.Count());
    end;

    procedure BuildJson()
    var
        RootObj  : JsonObject;
        LinesArr : JsonArray;
        LineObj  : JsonObject;
        Output   : Text;
    begin
        RootObj.Add('orderNo', 'SO-002');
        RootObj.Add('amount', 2750.50);
        RootObj.Add('posted', false);

        LineObj.Add('itemNo', 'ITEM-001');
        LineObj.Add('quantity', 10);
        LinesArr.Add(LineObj);
        RootObj.Add('lines', LinesArr);

        RootObj.WriteTo(Output);
        Message('JSON: %1', Output);
    end;
}