page 50170 "Export Order Selection"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = 36;
    SourceTableView = SORTING("Document Type", "No.")
                      ORDER(Ascending)
                      WHERE("Export Order" = CONST(TRUE),
                            Status = CONST(Released));

    layout
    {
        area(content)
        {
            repeater("---")
            {
                field("No."; "No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    var
        codPackingListNo: Code[20];
        recSalesHeader: Record 36;
    //cduExim: Codeunit 33001004;

    [Scope('Internal')]
    procedure fctSetPackingListNo(pcodCode: Code[20])
    begin
        codPackingListNo := pcodCode;
    end;

    [Scope('Internal')]
    procedure fctGetSelection(var precSalesHeader: Record 36)
    begin
        CurrPage.SETSELECTIONFILTER(precSalesHeader);
    end;
}

