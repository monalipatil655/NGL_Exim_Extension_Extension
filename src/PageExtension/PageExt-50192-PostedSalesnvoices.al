pageextension 50192 "Posted Sales Invoice_EXT" extends "Posted Sales Invoices" //OriginalId
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