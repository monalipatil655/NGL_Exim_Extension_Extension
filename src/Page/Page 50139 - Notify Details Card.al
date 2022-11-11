page 50018 "Notify Details Card"
{
    // version PCPL-EXIM

    Description = 'Notify Details Card';
    SourceTable = 50048;


    layout
    {
        area(content)
        {
            group(General)
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
            }
            group(Communication)
            {
                field("Telephone No."; "Telephone No.")
                {
                }
                field("Fax No."; "Fax No.")
                {
                }
                field("E-mail Id"; "E-mail Id")
                {
                }
                field("Contact Person"; "Contact Person")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(syspart; Links)
            {
                Visible = false;
            }
            systempart(syspart1; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

