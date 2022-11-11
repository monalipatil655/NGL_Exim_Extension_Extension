tableextension 50160 Sales_Header_Exim extends "Sales Header"
{
    fields
    {
        field(50150; "Delivery Terms Exim"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            OptionCaption = '" ,CIF,FOB,CFR,EX-Works"';
            OptionMembers = " ",CIF,FOB,CFR,"EX-Works";
        }
        field(50151; "Place of Rcpt. By Pre Carrier"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            OptionCaption = '" ,Badlapur,Ambernath,Taloja"';
            OptionMembers = " ",Badlapur,Ambernath,Taloja;
        }
        field(50152; "Final Destination"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50153; "Country of Final Destination"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            TableRelation = "Country/Region";
        }
        field(50154; "Export Under"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            OptionCaption = '" ,Duty Drawback,Advance License"';
            OptionMembers = " ","Duty Drawback","Advance License";
        }
        field(50155; "Our Bank Details"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            TableRelation = "Bank Account";
        }
        field(50156; "Customer Bank Details"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            TableRelation = "Customer Bank Account".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));
        }
        field(50157; "LC Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50158; "LC Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50159; "Insurance Policy No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50160; "Insurance Policy Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50161; "Container No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50162; "Seal No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50163; "Marks & Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50164; "No. of Kind of Packages"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50165; "Pallet Details"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            OptionCaption = 'With Pallets,Without Pallets';
            OptionMembers = "With Pallets","Without Pallets";
        }
        field(50166; "Total Gross Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50167; "Total Tare Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50168; "Total Net Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50169; "Total Real Wt."; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50170; "MFRD BY"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            OptionCaption = 'AOPL,ROPL';
            OptionMembers = AOPL,ROPL;
        }
        field(50171; "Freight Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50172; "Insurance Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50173; "Type of Shipping"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50174; "Other Instruction"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50175; "Other Instruction 2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50176; "1st Notify Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            TableRelation = "Notify Details - EXIM".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));
        }
        field(50177; "2nd Notify Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            TableRelation = "Notify Details - EXIM".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));
        }
        field(50178; "Export Order"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50179; "Country of Origin of Goods"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            OptionCaption = '" ,India"';
            OptionMembers = " ",India;
        }
        field(50180; "Shipment Under"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
            OptionCaption = '" ,LUT"';
            OptionMembers = " ",LUT;
        }
        field(50181; "LUT No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';

            trigger OnValidate();
            begin
                //PCPL-EXIM
                TESTFIELD("Shipment Under", "Shipment Under"::LUT);
                //PCPL-EXIM
            end;
        }
    }
    procedure BEOAssistEdit(OldSH: Record "Sales Header"): Boolean
    var
        Shdr: Record 36;
        recSRS: Record 311;
        NoSeriesMgt: Codeunit 396;
    begin
        //PCPL-EXIM
        WITH Shdr DO BEGIN
            COPY(Rec);
            recSRS.GET;
            recSRS.TESTFIELD("Blanket Export Order Nos.");
            IF NoSeriesMgt.SelectSeries(recSRS."Blanket Export Order Nos.", '', recSRS."Blanket Export Order Nos.") THEN BEGIN
                NoSeriesMgt.SetSeries("No.");
                Rec := Shdr;
                EXIT(TRUE);
            END;
        END;
        //PCPL-EXIM
    end;

    procedure EXOAssistEdit(OLDSHDR: Record "Sales Header"): Boolean
    var
        SLHDR: Record 36;
        recSRS: Record 311;
        NoSeriesMgt: Codeunit 396;
    begin
        //PCPL-EXIM
        WITH SLHDR DO BEGIN
            COPY(Rec);
            recSRS.GET;
            recSRS.TESTFIELD("Export Order Nos.");
            IF NoSeriesMgt.SelectSeries(recSRS."Export Order Nos.", '', recSRS."Export Order Nos.") THEN BEGIN
                NoSeriesMgt.SetSeries("No.");
                Rec := SLHDR;
                EXIT(TRUE);
            END;
        END;
        //PCPL-EXIM

    end;
}