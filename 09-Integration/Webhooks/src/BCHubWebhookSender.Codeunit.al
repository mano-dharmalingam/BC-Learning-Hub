codeunit 50901 "BCHub Webhook Sender"
{
    procedure SendWebhook(WebhookUrl: Text; EventName: Text; Payload: JsonObject)
    var
        Client   : HttpClient;
        Request  : HttpRequestMessage;
        Response : HttpResponseMessage;
        Content  : HttpContent;
        Headers  : HttpHeaders;
        Body     : Text;
        Envelope : JsonObject;
    begin
        Envelope.Add('event', EventName);
        Envelope.Add('timestamp', Format(CurrentDateTime(), 0,
            '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z'));
        Envelope.Add('data', Payload);
        Envelope.WriteTo(Body);

        Content.WriteFrom(Body);
        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');

        Request.Method('POST');
        Request.SetRequestUri(WebhookUrl);
        Request.Content(Content);
        Client.Send(Request, Response);
    end;
}