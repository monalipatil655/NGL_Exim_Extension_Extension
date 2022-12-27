page 50171 "Export Order Items"
{
    PageType = List;
    SourceTable = 37;

    layout
    {
        area(content)
        {
            repeater("---")
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = all;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = all;
                }
                field("No."; "No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
                field("Qty. to Ship"; "Qty. to Ship")
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

