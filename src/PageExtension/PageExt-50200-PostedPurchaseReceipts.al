pageextension 50200 "Posted Purchase Receipts_Exim" extends "Posted Purchase Receipts" //OriginalId
{
    layout
    {

    }
    trigger OnOpenPage()
    begin
        SetRange("Import Order", false);
    end;

    trigger OnAfterGetRecord()
    begin
        SetRange("Import Order", false);
    end;

}