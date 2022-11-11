table 50049 "Post Shipment Details - EXIM"
{
    // version PCPL-EXIM

    Permissions = TableData 50049 = rimd;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vessel/Flight No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "BL No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "BL Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Og. Doc. Forwarding Add:"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Document Date")
        {
        }
    }

    fieldgroups
    {
    }
}

