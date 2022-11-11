pageextension 50190 "Sales&Rec_Exim" extends "Sales & Receivables Setup"
{
    layout
    {

        addafter("Number Series")
        {
            group(EXIM)
            {
                field("Export Order Nos."; "Export Order Nos.")
                {
                    ApplicationArea = all;
                }
                field("Blanket Export Order Nos."; "Blanket Export Order Nos.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}