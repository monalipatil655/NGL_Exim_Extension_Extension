pageextension 50199 "Posted Purchase Invoice-Exim" extends "Posted Purchase Invoices" //OriginalId
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