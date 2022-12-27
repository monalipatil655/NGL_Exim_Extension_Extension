table 50054 "Packing List Header"
{
    //DrillDownPageID = 33001102;
    //LookupPageID = 33001102;

    fields
    {
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Active);
                IF ("Sell-to Customer No." <> xRec."Sell-to Customer No.") AND
                   (xRec."Sell-to Customer No." <> '') THEN BEGIN
                    blnConfirmed := CONFIRM(MS33000991, FALSE, FIELDCAPTION("Sell-to Customer No."));
                    IF blnConfirmed THEN BEGIN
                        recPackingListLine.SETRANGE("Document No.", "No.");
                        IF recPackingListLine.FIND('-') THEN
                            ERROR(MS33000992, FIELDCAPTION("Sell-to Customer No."));
                    END ELSE BEGIN
                        Rec := xRec;
                        EXIT;
                    END;
                END;

                recCustomer.GET("Sell-to Customer No.");

                recCustomer.CheckBlockedCustOnDocs(recCustomer, 1, FALSE, FALSE);
                recCustomer.TESTFIELD("Gen. Bus. Posting Group");

                "Sell-to Customer Name" := recCustomer.Name;
                "Sell-to Customer Name 2" := recCustomer."Name 2";
                "Sell-to Address" := recCustomer.Address;
                "Sell-to Address 2" := recCustomer."Address 2";
                "Sell-to City" := recCustomer.City;
                "Sell-to Post Code" := recCustomer."Post Code";
                "Sell-to County" := recCustomer.County;
                "Sell-to Country Code" := recCustomer."Country/Region Code";
                State := recCustomer."State Code";
                "VAT Registration No." := recCustomer."VAT Registration No.";

                IF (recCustomer."Bill-to Customer No." <> '') THEN
                    VALIDATE("Bill-to Customer No.", recCustomer."Bill-to Customer No.")
                ELSE
                    IF ("Bill-to Customer No." = "Sell-to Customer No.") THEN
                        VALIDATE("Bill-to Customer No.", "Sell-to Customer No.");

                VALIDATE("Ship-to Code", '');
            end;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';

            // trigger OnValidate()
            // begin
            //     IF ("No." <> xRec."No.") THEN BEGIN
            //         fctGetEximSetup;
            //         //cduNoSeriesMgt.TestManual(recEximSetup."Packing List Nos.");  //PCPL-25/191222
            //         "No. Series" := '';
            //     END;
            // end;   //PCPL-25/271222
        }
        field(4; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                IF recCustomer.GET("Bill-to Customer No.") THEN BEGIN
                    "Bill-to Name" := recCustomer.Name;
                    "Bill-to Name 2" := recCustomer."Name 2";
                    "Bill-to Address" := recCustomer.Address;
                    "Bill-to Address 2" := recCustomer."Address 2";
                    "Bill-to City" := recCustomer.City;
                    "Bill-to Post Code" := recCustomer."Post Code";
                    "Bill-to County" := recCustomer.County;
                    "Bill-to Country Code" := recCustomer."Country/Region Code";
                END;
            end;
        }
        field(5; "Bill-to Name"; Text[50])
        {
            Caption = 'Bill-to Name';
        }
        field(6; "Bill-to Name 2"; Text[30])
        {
            Caption = 'Bill-to Name 2';
        }
        field(7; "Bill-to Address"; Text[80])
        {
            Caption = 'Bill-to Address';
        }
        field(8; "Bill-to Address 2"; Text[60])
        {
            Caption = 'Bill-to Address 2';
        }
        field(9; "Bill-to City"; Text[30])
        {
            Caption = 'Bill-to City';
        }
        field(10; "Bill-to Contact"; Text[30])
        {
            Caption = 'Bill-to Contact';
        }
        field(11; "Your Reference"; Text[30])
        {
            Caption = 'Your Reference';
        }
        field(12; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));

            trigger OnValidate()
            begin
                IF ("Ship-to Code" <> '') THEN BEGIN
                    IF recShipToAddr.GET("Sell-to Customer No.", "Ship-to Code") THEN BEGIN
                        "Ship-to Name" := recShipToAddr.Name;
                        "Ship-to Name 2" := recShipToAddr."Name 2";
                        "Ship-to Address" := recShipToAddr.Address;
                        "Ship-to Address 2" := recShipToAddr."Address 2";
                        "Ship-to City" := recShipToAddr.City;
                        "Ship-to Post Code" := recShipToAddr."Post Code";
                        "Ship-to County" := recShipToAddr.County;
                        VALIDATE("Ship-to Country Code", recShipToAddr."Country/Region Code");
                        "Shipment Method Code" := recShipToAddr."Shipment Method Code";
                        "Shipping Agent Code" := recShipToAddr."Shipping Agent Code";
                        "Shipping Agent Service Code" := recShipToAddr."Shipping Agent Service Code";
                    END;
                END ELSE BEGIN
                    IF recCustomer.GET("Sell-to Customer No.") THEN BEGIN
                        "Ship-to Name" := recCustomer.Name;
                        "Ship-to Name 2" := recCustomer."Name 2";
                        "Ship-to Address" := recCustomer.Address;
                        "Ship-to Address 2" := recCustomer."Address 2";
                        "Ship-to City" := recCustomer.City;
                        "Ship-to Post Code" := recCustomer."Post Code";
                        "Ship-to County" := recCustomer.County;
                        VALIDATE("Ship-to Country Code", recCustomer."Country/Region Code");
                        "Shipment Method Code" := recCustomer."Shipment Method Code";
                        "Shipping Agent Code" := recCustomer."Shipping Agent Code";
                        "Shipping Agent Service Code" := recCustomer."Shipping Agent Service Code";
                    END;
                END;
            end;
        }
        field(13; "Ship-to Name"; Text[50])
        {
            Caption = 'Ship-to Name';
        }
        field(14; "Ship-to Name 2"; Text[30])
        {
            Caption = 'Ship-to Name 2';
        }
        field(15; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
        }
        field(16; "Ship-to Address 2"; Text[100])
        {
            Caption = 'Ship-to Address 2';
        }
        field(17; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
        }
        field(18; "Ship-to Contact"; Text[30])
        {
            Caption = 'Ship-to Contact';
        }
        field(19; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(21; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(22; "Posting Description"; Text[50])
        {
            Caption = 'Posting Description';
        }
        field(23; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(25; "Payment Discount %"; Decimal)
        {
            Caption = 'Payment Discount %';
            DecimalPlaces = 0 : 5;
        }
        field(26; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
        }
        field(27; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(28; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(29; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(30; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(31; "Customer Posting Group"; Code[10])
        {
            Caption = 'Customer Posting Group';
            Editable = false;
            TableRelation = "Customer Posting Group";
        }
        field(32; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(33; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            MinValue = 0;
        }
        field(34; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
        }
        field(35; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';
        }
        field(37; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';
        }
        field(40; "Customer Disc. Group"; Code[10])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
        field(41; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(43; "Salesperson Code"; Code[10])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(44; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(46; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
        }
        field(47; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(51; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
        }
        field(52; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(53; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';
        }
        field(55; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account";
        }
        field(56; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(70; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(73; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(74; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(75; "EU 3-Party Trade"; Boolean)
        {
            Caption = 'EU 3-Party Trade';
        }
        field(76; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(77; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(78; "VAT Country Code"; Code[10])
        {
            Caption = 'VAT Country Code';
            TableRelation = "Country/Region";
        }
        field(79; "Sell-to Customer Name"; Text[50])
        {
            Caption = 'Sell-to Customer Name';
        }
        field(80; "Sell-to Customer Name 2"; Text[30])
        {
            Caption = 'Sell-to Customer Name 2';
        }
        field(81; "Sell-to Address"; Text[80])
        {
            Caption = 'Sell-to Address';
        }
        field(82; "Sell-to Address 2"; Text[60])
        {
            Caption = 'Sell-to Address 2';
        }
        field(83; "Sell-to City"; Text[30])
        {
            Caption = 'Sell-to City';
        }
        field(84; "Sell-to Contact"; Text[30])
        {
            Caption = 'Sell-to Contact';
        }
        field(85; "Bill-to Post Code"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(86; "Bill-to County"; Text[30])
        {
            Caption = 'Bill-to County';
        }
        field(87; "Bill-to Country Code"; Code[10])
        {
            Caption = 'Bill-to Country Code';
            TableRelation = "Country/Region";
        }
        field(88; "Sell-to Post Code"; Code[20])
        {
            Caption = 'Sell-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(89; "Sell-to County"; Text[30])
        {
            Caption = 'Sell-to County';
        }
        field(90; "Sell-to Country Code"; Code[10])
        {
            Caption = 'Sell-to Country Code';
            TableRelation = "Country/Region";
        }
        field(91; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(92; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(93; "Ship-to Country Code"; Code[10])
        {
            Caption = 'Ship-to Country Code';
            TableRelation = "Country/Region";
        }
        field(94; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Bank Account';
            OptionMembers = "G/L Account","Bank Account";
        }
        field(97; "Exit Point"; Code[10])
        {
            Caption = 'Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(98; Correction; Boolean)
        {
            Caption = 'Correction';
        }
        field(99; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(100; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(101; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(102; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(104; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(105; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(106; "Package Tracking No."; Text[30])
        {
            Caption = 'Package Tracking No.';
        }
        field(109; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(110; "Order No. Series"; Code[10])
        {
            Caption = 'Order No. Series';
            TableRelation = "No. Series";
        }
        field(112; "User ID"; Code[20])
        {
            Caption = 'User ID';
            // TableRelation = Table 2000000002; //PCPL-25/191222
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                LoginMgt: Codeunit 418;
            begin
            end;
        }
        field(113; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(114; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(115; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(116; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(119; "VAT Base Discount %"; Decimal)
        {
            Caption = 'VAT Base Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5050; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(5052; "Sell-to Contact No."; Code[20])
        {
            Caption = 'Sell-to Contact No.';
            TableRelation = Contact;
        }
        field(5053; "Bill-to Contact No."; Code[20])
        {
            Caption = 'Bill-to Contact No.';
            TableRelation = Contact;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5790; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
        }
        field(5791; "Promised Delivery Date"; Date)
        {
            Caption = 'Promised Delivery Date';
        }
        field(5792; "Shipping Time"; DateFormula)
        {
            Caption = 'Shipping Time';
        }
        field(5793; "Outbound Whse. Handling Time"; DateFormula)
        {
            Caption = 'Outbound Whse. Handling Time';
        }
        field(5794; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
        }
        field(13703; "Ship-to Courier Zone"; Code[2])
        {
        }
        field(13706; "Excise Bus. Posting Group"; Code[10])
        {
        }
        field(13707; "Excise Registration No."; Text[20])
        {
        }
        field(13732; "TAX Registration No."; Text[20])
        {
        }
        field(13733; "TAX Country Code"; Code[10])
        {
        }
        field(13737; "Form Code"; Code[10])
        {
            //TableRelation = "Form Codes";     //PCPL-25/191222
        }
        field(13738; "Form No."; Code[10])
        {
            //TableRelation = "Tax Forms Details";  //PCPL-25/191222
        }
        field(13751; "Transit Document"; Boolean)
        {
        }
        field(13752; State; Code[10])
        {
            TableRelation = State;
        }
        field(13753; "LC No."; Code[20])
        {
            // TableRelation = "LC Detail"."No." WHERE ("Transaction Type"=CONST(Sale),
            //                                        "Issued To/Received From"=FIELD("Sell-to Customer No."),
            //                                        Closed=CONST(No),
            //                                         Released=CONST(Yes));
        }
        field(13790; Structure; Code[10])
        {
            //TableRelation = "Structure Header";     //PCPL-25/191222

            trigger OnValidate()
            var
            // StrDetails: Record 13793;        //PCPL-25/191222
            // StrOrderDetails: Record 13794;   //PCPL-25/191222
            // StrOrderLines: Record 13795; //PCPL-25/191222
            // SaleLines: Record 37;    //PCPL-25/191222
            begin
            end;
        }
        field(16383; "Company Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(50000; Marks; Text[250])
        {
        }
        field(50001; "SO NO."; Code[20])
        {
        }
        field(60001; "Place of Receipt Pre-Carriage"; Text[50])
        {
        }
        field(33000990; "Export Document"; Boolean)
        {
        }
        field(33000991; "Pricing Date"; Date)
        {
        }
        field(33000992; "Commission %"; Decimal)
        {
        }
        field(33000993; "Exchange Rate"; Integer)
        {
        }
        field(33000994; "Allow Commission"; Boolean)
        {
        }
        field(33000995; "Export Obligation Date"; Date)
        {
            Editable = false;
        }
        field(33000996; Port; Code[10])
        {
        }
        field(33000997; "Port of Discharge"; Code[10])
        {
        }
        field(33000998; "Final Destination"; Code[50])
        {
            TableRelation = "Post Code".City;
        }
        field(33000999; "Pre-Carriage"; Option)
        {
            OptionCaption = 'By Sea,By Air,By Rail';
            OptionMembers = "By Sea","By Air","By Rail";
        }
        field(33001000; Carriage; Option)
        {
            OptionCaption = 'By Sea,By Air,By Rail';
            OptionMembers = "By Sea","By Air","By Rail";
        }
        field(33001001; "Country of Origin of Goods"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(33001002; "Country of Final Destination"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(33001003; "Export Shipment Method"; Option)
        {
            OptionCaption = 'FOB,CIF,C&F';
            OptionMembers = FOB,CIF,"C&F";
        }
        field(33001004; "Export Shipment Type"; Option)
        {
            OptionCaption = 'FOB,CIF,C&F';
            OptionMembers = FOB,CIF,"C&F";
        }
        field(33001005; "Vessel/Flight No."; Code[20])
        {
        }
        field(33001006; "UT1 Serial No."; Code[20])
        {
            Editable = true;
        }
        field(33001007; "ARE-1 No."; Code[20])
        {
            Editable = true;
        }
        field(33001008; "CT-2 No."; Code[20])
        {
            Editable = true;
        }
        field(33001009; "AR-3A No."; Code[20])
        {
            Editable = true;
        }
        field(33001010; "ARE Posting"; Boolean)
        {
        }
        field(33001011; "Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(33001012; "Customer Bank Account"; Code[10])
        {
            TableRelation = "Customer Bank Account".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));
        }
        field(33001013; "Bill-To Bank Account"; Code[10])
        {
            TableRelation = "Customer Bank Account".Code WHERE("Customer No." = FIELD("Bill-to Customer No."));
        }
        field(33001014; "Packing List No."; Code[20])
        {
        }
        field(33001015; "Export Type"; Option)
        {
            OptionMembers = Normal,Deemed;

            trigger OnValidate()
            var
                PurchHeader: Record 38;
            begin
            end;
        }
        field(33001016; Status; Option)
        {
            OptionCaption = 'Active,Expired,Shipped';
            OptionMembers = Active,Expired,Shipped;
        }
        field(99008509; "Date Sent"; Date)
        {
            Caption = 'Date Sent';
        }
        field(99008510; "Time Sent"; Time)
        {
            Caption = 'Time Sent';
        }
        field(99008515; "BizTalk Shipment Notification"; Boolean)
        {
            Caption = 'BizTalk Shipment Notification';
        }
        field(99008519; "Customer Order No."; Code[20])
        {
            Caption = 'Customer Order No.';
        }
        field(99008521; "BizTalk Document Sent"; Boolean)
        {
            Caption = 'BizTalk Document Sent';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        IF (Status <> Status::Active) THEN
            ERROR(MS33000990);
    end;

    trigger OnInsert()
    begin
        "Posting Date" := WORKDATE;

        IF ("No." = '') THEN BEGIN
            fctGetEximSetup;
            //recEximSetup.TESTFIELD("Packing List Nos.");    //PCPL-25/191222
            //cduNoSeriesMgt.InitSeries(recEximSetup."Packing List Nos.",xRec."No. Series",0D,"No.","No. Series"); 33000990
        END;
    end;

    var
        blnConfirmed: Boolean;
        recPackingListLine: Record 50053;
        recCustomer: Record 18;
        recShipToAddr: Record 222;
        blnHasEximSetup: Boolean;
        //recEximSetup: Record 33000990;        //PCPL-25/191222
        cduNoSeriesMgt: Codeunit 396;
        MS33000990: Label 'Only Active Packing Lists can be deleted.';
        MS33000991: Label 'Do you want to change %1?';
        MS33000992: Label 'You cannot reset %1 because the document still has one or more lines.';

    [Scope('Internal')]
    procedure fctGetEximSetup()
    begin
        IF NOT blnHasEximSetup THEN BEGIN
            //recEximSetup.GET;       //PCPL-25/191222
            blnHasEximSetup := TRUE;
        END;
    end;

    [Scope('Internal')]
    procedure fctAssistEdit(): Boolean
    begin
        fctGetEximSetup;
        //recEximSetup.TESTFIELD("Packing List Nos.");     //PCPL-25//161222
        // IF cduNoSeriesMgt.SelectSeries(recEximSetup."Packing List Nos.",xRec."No. Series","No. Series") THEN BEGIN   //PCPL-25/191222
        //   cduNoSeriesMgt.SetSeries("No.");   //PCPL-25/191222
        //   EXIT(TRUE);    //PCPL-25/191222
        // END;
    end;
}

