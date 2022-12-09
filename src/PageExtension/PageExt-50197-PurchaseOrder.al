pageextension 50197 "Purchase Order_Exim" extends "Purchase Order List" //OriginalId
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