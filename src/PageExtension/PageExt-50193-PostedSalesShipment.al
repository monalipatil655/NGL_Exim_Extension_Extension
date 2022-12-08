pageextension 50193 "Posted Sales Shipment_Ext" extends "Posted Sales Shipments" //OriginalId
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