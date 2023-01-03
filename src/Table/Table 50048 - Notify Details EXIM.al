table 50048 "Notify Details - EXIM"
{
    // version PCPL-EXIM

    DrillDownPageID = 50017;
    LookupPageID = 50017;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Address 1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Post Code"; Code[20])
        {
            CaptionML = ENU = 'Post Code',
                        ENN = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST()) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                //PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(7; City; Text[30])
        {
            CaptionML = ENU = 'City',
                        ENN = 'City';
            TableRelation = IF ("Country/Region Code" = CONST()) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                //PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(8; "Country/Region Code"; Code[10])
        {
            CaptionML = ENU = 'Country/Region Code',
                        ENN = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(9; "Telephone No."; Text[20])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(10; "Fax No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "E-mail Id"; Text[20])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(12; "Contact Person"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record 225;
}

