pageextension 50195 "Sales Invoice_Ext" extends "Sales Invoice List" //OriginalId
{
    layout
    {

    }

    trigger OnOpenPage()
    begin
        SetRange("Export Order", false);
    end;

    trigger OnAfterGetRecord()
    begin
        SetRange("Export Order", false);
    end;
}