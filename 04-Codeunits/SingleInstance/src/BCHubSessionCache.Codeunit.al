codeunit 50401 "BCHub Session Cache"
{
    SingleInstance = true;

    var
        SetupLoaded         : Boolean;
        CachedCompanyName   : Text[30];
        CacheDict           : Dictionary of [Text, Text];

    procedure GetCompanyName(): Text[30]
    begin
        EnsureLoaded();
        exit(CachedCompanyName);
    end;

    procedure SetCacheValue(Key: Text; Value: Text)
    begin
        if CacheDict.ContainsKey(Key) then CacheDict.Set(Key, Value)
        else CacheDict.Add(Key, Value);
    end;

    procedure GetCacheValue(Key: Text): Text
    begin
        if CacheDict.ContainsKey(Key) then exit(CacheDict.Get(Key));
        exit('');
    end;

    procedure InvalidateCache()
    begin
        SetupLoaded := false;
        Clear(CacheDict);
    end;

    local procedure EnsureLoaded()
    var
        CompInfo: Record "Company Information";
    begin
        if SetupLoaded then exit;
        if CompInfo.Get() then CachedCompanyName := CompInfo.Name;
        SetupLoaded := true;
    end;
}