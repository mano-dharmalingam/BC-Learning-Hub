codeunit 50101 "BCHub DataType Demo"
{
    procedure ShowAllTypes()
    var
        MyText   : Text[250];
        MyCode   : Code[20];
        MyBool   : Boolean;
        MyInt    : Integer;
        MyDec    : Decimal;
        MyDate   : Date;
        MyTime   : Time;
        MyDT     : DateTime;
        MyGuid   : Guid;
        MyBigInt : BigInteger;
    begin
        MyText   := 'Business Central Hub';
        MyCode   := 'ITEM-001';        // Auto-uppercased
        MyBool   := true;
        MyInt    := 100;
        MyDec    := 99.95;
        MyDate   := Today();
        MyTime   := Time();
        MyDT     := CurrentDateTime();
        MyGuid   := CreateGuid();
        MyBigInt := 1000000000000;

        Message('Text: %1\nCode: %2\nGuid: %3\nDT: %4',
            MyText, MyCode, MyGuid, MyDT);
    end;

    procedure TypeConversions()
    var
        IntVal  : Integer;
        DecVal  : Decimal;
        TextVal : Text;
        DateVal : Date;
    begin
        IntVal  := 42;
        DecVal  := IntVal;               // Integer to Decimal implicit
        TextVal := Format(IntVal);       // Integer to Text
        DateVal := Today();
        Message('Int: %1, Dec: %2, Text: %3', IntVal, DecVal, TextVal);
    end;
}