page 50167 "Packing List List"
{
    CardPageID = "Packing List Header";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = 50054;
    ApplicationArea = All;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater("---")
            {
                field("No."; "No.")
                {
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field(Status; Status)
                {
                }
                field("SO NO."; "SO NO.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        RecUser.RESET;
        RecUser.SETRANGE(RecUser."User ID", USERID);
        IF RecUser.FINDFIRST THEN BEGIN
            TmpLocCode := RecUser."Location Code";
        END;

        IF TmpLocCode <> '' THEN BEGIN
            FILTERGROUP(2);
            SETFILTER("Location Code", TmpLocCode);
            FILTERGROUP(0);
        END;
    end;

    var
        RecUser: Record 91;
        TmpLocCode: Text;
}

