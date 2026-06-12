codeunit 50800 "BCHub Http Client"
{
    procedure GetJsonFromUrl(Url: Text): Text
    var
        Client   : HttpClient;
        Request  : HttpRequestMessage;
        Response : HttpResponseMessage;
        Body     : Text;
    begin
        Request.Method('GET');
        Request.SetRequestUri(Url);
        Request.GetHeaders().Add('Accept', 'application/json');

        if not Client.Send(Request, Response) then
            Error('HTTP request failed for: %1', Url);

        if not Response.IsSuccessStatusCode() then
            Error('API returned %1 for: %2', Response.HttpStatusCode(), Url);

        Response.Content().ReadAs(Body);
        exit(Body);
    end;

    procedure PostJson(Url: Text; JsonBody: Text; BearerToken: Text): Text
    var
        Client   : HttpClient;
        Request  : HttpRequestMessage;
        Response : HttpResponseMessage;
        Content  : HttpContent;
        Headers  : HttpHeaders;
        Body     : Text;
    begin
        Content.WriteFrom(JsonBody);
        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');

        Request.Method('POST');
        Request.SetRequestUri(Url);
        if BearerToken <> '' then
            Request.GetHeaders().Add('Authorization', 'Bearer ' + BearerToken);
        Request.Content(Content);

        if not Client.Send(Request, Response) then
            Error('POST failed to: %1', Url);

        Response.Content().ReadAs(Body);
        if not Response.IsSuccessStatusCode() then
            Error('API error %1: %2', Response.HttpStatusCode(), Body);
        exit(Body);
    end;

    procedure GetBearerToken(TenantId: Text; ClientId: Text; ClientSecret: Text; Scope: Text): Text
    var
        Client   : HttpClient;
        Request  : HttpRequestMessage;
        Response : HttpResponseMessage;
        Content  : HttpContent;
        JsonObj  : JsonObject;
        Token    : JsonToken;
        FormBody : Text;
        Body     : Text;
    begin
        FormBody := 'grant_type=client_credentials' +
                    '&client_id=' + ClientId +
                    '&client_secret=' + ClientSecret +
                    '&scope=' + Scope;

        Content.WriteFrom(FormBody);
        Request.Method('POST');
        Request.SetRequestUri(StrSubstNo('https://login.microsoftonline.com/%1/oauth2/v2.0/token', TenantId));
        Request.Content(Content);

        Client.Send(Request, Response);
        Response.Content().ReadAs(Body);
        JsonObj.ReadFrom(Body);
        JsonObj.SelectToken('access_token', Token);
        exit(Token.AsValue().AsText());
    end;
}