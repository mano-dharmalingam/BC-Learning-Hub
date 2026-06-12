interface "BCHub INotificationSender"
{
    procedure Send(Recipient: Text; Subject: Text; Body: Text): Boolean;
    procedure GetChannelName(): Text;
}

codeunit 51000 "BCHub Email Sender" implements "BCHub INotificationSender"
{
    procedure Send(Recipient: Text; Subject: Text; Body: Text): Boolean
    begin
        // Send via BC email module
        exit(true);
    end;

    procedure GetChannelName(): Text
    begin
        exit('Email');
    end;
}

codeunit 51001 "BCHub Teams Sender" implements "BCHub INotificationSender"
{
    procedure Send(Recipient: Text; Subject: Text; Body: Text): Boolean
    begin
        // POST to Teams incoming webhook URL
        exit(true);
    end;

    procedure GetChannelName(): Text
    begin
        exit('Microsoft Teams');
    end;
}

enum 51000 "BCHub Notification Channel" implements "BCHub INotificationSender"
{
    Extensible = true;
    value(0; Email) { Caption = 'Email'; Implementation = "BCHub INotificationSender" = "BCHub Email Sender"; }
    value(1; Teams) { Caption = 'Teams'; Implementation = "BCHub INotificationSender" = "BCHub Teams Sender"; }
}

codeunit 51002 "BCHub Notification Dispatcher"
{
    procedure Notify(Channel: Enum "BCHub Notification Channel"; Recipient: Text; Subject: Text; Body: Text)
    var
        Sender: Interface "BCHub INotificationSender";
    begin
        Sender := Channel;
        if not Sender.Send(Recipient, Subject, Body) then
            Error('Failed to send via %1', Sender.GetChannelName());
    end;
}