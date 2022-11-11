table 50047 "Packing List - Details"
{
    // version PCPL-EXIM

    DrillDownPageID = 50016;
    LookupPageID = 50016;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Lot No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Bag No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total Qty. Bags"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Total Gross Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Total Pallets Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Total Tare Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Total Net Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Purity %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Total Real Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Item No.", "Lot No.", "Document Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

