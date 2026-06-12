/// <summary>
/// Calls Azure OpenAI GPT-4o. Store API key in Isolated Storage.
/// </summary>
codeunit 51100 "BCHub Azure OpenAI"
{
    procedure AskGPT(SystemPrompt: Text; UserMessage: Text): Text
    var
        Client   : HttpClient;
        Request  : HttpRequestMessage;
        Response : HttpResponseMessage;
        Content  : HttpContent;
        Headers  : HttpHeaders;
        JsonReq  : JsonObject;
        Messages : JsonArray;
        SysMsg, UserMsg : JsonObject;
        ReqBody  : Text;
        ResBody  : Text;
        ResJson  : JsonObject;
        Token    : JsonToken;
    begin
        SysMsg.Add('role', 'system');
        SysMsg.Add('content', SystemPrompt);
        Messages.Add(SysMsg);

        UserMsg.Add('role', 'user');
        UserMsg.Add('content', UserMessage);
        Messages.Add(UserMsg);

        JsonReq.Add('messages', Messages);
        JsonReq.Add('max_tokens', 1000);
        JsonReq.Add('temperature', 0.7);
        JsonReq.WriteTo(ReqBody);

        Content.WriteFrom(ReqBody);
        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');

        Request.Method('POST');
        Request.SetRequestUri(GetEndpoint());
        Request.GetHeaders().Add('api-key', GetApiKey());
        Request.Content(Content);

        if not Client.Send(Request, Response) then
            Error('OpenAI request failed.');

        Response.Content().ReadAs(ResBody);
        if not Response.IsSuccessStatusCode() then
            Error('OpenAI API error %1: %2', Response.HttpStatusCode(), ResBody);

        ResJson.ReadFrom(ResBody);
        ResJson.SelectToken('choices[0].message.content', Token);
        exit(Token.AsValue().AsText());
    end;

    local procedure GetApiKey(): Text
    var
        IStore : Codeunit "Isolated Storage";
        Key    : Text;
    begin
        if IStore.Get('BCHUB_OPENAI_KEY', DataScope::Module, Key) then exit(Key);
        Error('Azure OpenAI key not configured. Go to BCHub Setup.');
    end;

    local procedure GetEndpoint(): Text
    begin
        exit('https://YOUR_RESOURCE.openai.azure.com/openai/deployments/gpt-4o/chat/completions?api-version=2024-02-01');
    end;
}