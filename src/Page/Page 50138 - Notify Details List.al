page 50017 "Notify Details List"
{
    // version PCPL-EXIM

    CardPageID = "Notify Details Card";
    DataCaptionFields = "Customer No.";
    ModifyAllowed = false;
    PageType = List;
    SourceTable = 50048;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control001)
            {
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = all;
                }
                field(Code; Code)
                {
                    ApplicationArea = all;
                }
                field(Name; Name)
                {
                    ApplicationArea = all;
                }
                field("Address 1"; "Address 1")
                {
                    ApplicationArea = all;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = all;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = all;
                }
                field(City; City)
                {
                    ApplicationArea = all;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = all;
                }
                field("Telephone No."; "Telephone No.")
                {
                    ApplicationArea = all;
                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = all;
                }
                field("E-mail Id"; "E-mail Id")
                {
                    ApplicationArea = all;
                }
                field("Contact Person"; "Contact Person")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Syspart; Links)
            {
                Visible = false;
            }
            systempart(Syspart1; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

