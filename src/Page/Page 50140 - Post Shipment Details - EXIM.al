page 50132 "Post Shipment Details - EXIM"
{
    // version PCPL-EXIM

    PageType = CardPart;
    SourceTable = 50049;
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Post Shipment Details - EXIM")
            {
                field("Document No."; "Document No.")
                {
                    Enabled = false;
                }
                field("Document Date"; "Document Date")
                {
                    Editable = false;
                }
                field("Vessel/Flight No."; "Vessel/Flight No.")
                {
                    ApplicationArea = all;
                }
                field("BL No."; "BL No.")
                {
                    ApplicationArea = all;
                }
                field("BL Date"; "BL Date")
                {
                    ApplicationArea = all;
                }
            }
            group("Remittance Details")
            {
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = all;
                }
                field("Og. Doc. Forwarding Add:"; "Og. Doc. Forwarding Add:")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

