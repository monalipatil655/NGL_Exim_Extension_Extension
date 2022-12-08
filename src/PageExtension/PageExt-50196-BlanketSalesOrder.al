pageextension 50196 "Blanket Sales Orders_Ext" extends "Blanket Sales Orders" //OriginalId
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