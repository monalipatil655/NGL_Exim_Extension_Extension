pageextension 50194 "Sales Quotes_Ext" extends "Sales Quotes" //OriginalId
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