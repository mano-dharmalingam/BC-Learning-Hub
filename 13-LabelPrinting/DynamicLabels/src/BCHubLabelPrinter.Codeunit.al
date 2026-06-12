codeunit 51300 "BCHub Label Printer"
{
    procedure PrintItemLabel(ItemNo: Code[20]; Qty: Decimal; PrinterUrl: Text)
    var
        Item : Record Item;
        ZPL  : TextBuilder;
        Text : Text;
    begin
        Item.Get(ItemNo);

        ZPL.AppendLine('^XA');
        ZPL.AppendLine('^PW609');
        ZPL.AppendLine('^LL406');
        ZPL.AppendLine('^FO10,10^GB589,386,3^FS');
        // Barcode
        ZPL.AppendLine('^FO30,20^BCN,70,Y,N,N^FD' + Item."No." + '^FS');
        // Description
        ZPL.AppendLine('^FO30,110^A0N,30,25^FD' + CopyStr(Item.Description, 1, 30) + '^FS');
        // UOM
        ZPL.AppendLine('^FO30,155^A0N,25,20^FDUOM: ' + Item."Base Unit of Measure" + '^FS');
        // Qty
        ZPL.AppendLine('^FO30,190^A0N,25,20^FDQTY: ' + Format(Qty, 0, '<Integer>') + '^FS');
        // Date
        ZPL.AppendLine('^FO30,225^A0N,20,18^FDPrinted: ' + Format(Today()) + '^FS');
        // QR Code
        ZPL.AppendLine('^FO380,130^BQN,2,4^FDH,' + Item."No." + '^FS');
        ZPL.AppendLine('^XZ');

        SendToPrinter(ZPL.ToText(), PrinterUrl);
    end;

    procedure PrintShippingLabel(SalesOrderNo: Code[20]; PrinterUrl: Text)
    var
        SalesHeader : Record "Sales Header";
        ZPL         : TextBuilder;
    begin
        SalesHeader.Get(SalesHeader."Document Type"::Order, SalesOrderNo);

        ZPL.AppendLine('^XA');
        ZPL.AppendLine('^PW812^LL1218');
        ZPL.AppendLine('^FO20,20^A0N,25,20^FDFROM: Your Company^FS');
        ZPL.AppendLine('^FO20,120^GB772,3,3^FS');
        ZPL.AppendLine('^FO20,130^A0N,25,20^FDSHIP TO:^FS');
        ZPL.AppendLine('^FO20,160^A0N,35,30^FD' + CopyStr(SalesHeader."Ship-to Name", 1, 25) + '^FS');
        ZPL.AppendLine('^FO20,200^A0N,28,24^FD' + CopyStr(SalesHeader."Ship-to Address", 1, 35) + '^FS');
        ZPL.AppendLine('^FO20,235^A0N,28,24^FD' + SalesHeader."Ship-to City" + ' ' + SalesHeader."Ship-to Post Code" + '^FS');
        ZPL.AppendLine('^FO20,320^BCN,100,Y,N,N^FD' + SalesOrderNo + '^FS');
        ZPL.AppendLine('^FO600,300^BQN,2,6^FDHA,' + SalesOrderNo + '^FS');
        ZPL.AppendLine('^XZ');

        SendToPrinter(ZPL.ToText(), PrinterUrl);
    end;

    local procedure SendToPrinter(ZPLText: Text; PrinterUrl: Text)
    var
        Client   : HttpClient;
        Request  : HttpRequestMessage;
        Response : HttpResponseMessage;
        Content  : HttpContent;
        Headers  : HttpHeaders;
    begin
        if PrinterUrl = '' then begin
            Message('ZPL Preview:\n%1', CopyStr(ZPLText, 1, 500));
            exit;
        end;

        Content.WriteFrom(ZPLText);
        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/plain');

        Request.Method('POST');
        Request.SetRequestUri(PrinterUrl);
        Request.Content(Content);

        if Client.Send(Request, Response) then begin
            if not Response.IsSuccessStatusCode() then
                Message('Printer warning: %1', Response.HttpStatusCode());
        end else
            Error('Cannot reach printer: %1', PrinterUrl);
    end;
}