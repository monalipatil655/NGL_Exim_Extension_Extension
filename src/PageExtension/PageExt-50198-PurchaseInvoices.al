pageextension 50198 "Purchase Invoices_Exim" extends "Purchase Invoices" //OriginalId
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