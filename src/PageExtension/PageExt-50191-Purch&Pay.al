pageextension 50191 "Purch & Payable Exim" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Number Series")
        {
            group(EXIM)
            {
                field("Import Order Nos."; "Import Order Nos.")
                {
                    ApplicationArea = all;
                }
                field("Blanket Import Order Nos."; "Blanket Import Order Nos.")
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