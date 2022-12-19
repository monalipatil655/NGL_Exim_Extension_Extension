table 50053 "Packing List Line"
{

    fields
    {
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge";
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(8; "Posting Group"; Code[10])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = IF (Type = CONST(Item)) "Inventory Posting Group"
            ELSE
            IF (Type = CONST("Fixed Asset")) "FA Posting Group";
        }
        field(10; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
            Description = '//PCpl-25 size increase by 50 to 100';
        }
        field(12; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
        }
        field(13; "Unit of Measure"; Text[10])
        {
            Caption = 'Unit of Measure';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(22; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
        }
        field(23; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';
        }
        field(25; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(27; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(32; "Allow Invoice Disc."; Boolean)
        {
            Caption = 'Allow Invoice Disc.';
            InitValue = true;
        }
        field(34; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            DecimalPlaces = 0 : 5;
        }
        field(35; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DecimalPlaces = 0 : 5;
        }
        field(36; "Units per Parcel"; Decimal)
        {
            Caption = 'Units per Parcel';
            DecimalPlaces = 0 : 5;
        }
        field(37; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DecimalPlaces = 0 : 5;
        }
        field(38; "Appl.-to Item Entry"; Integer)
        {
            Caption = 'Appl.-to Item Entry';
        }
        field(39; "Item Shpt. Entry No."; Integer)
        {
            Caption = 'Item Shpt. Entry No.';
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(42; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
        }
        field(45; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(46; "Appl.-to Job Entry"; Integer)
        {
            Caption = 'Appl.-to Job Entry';
        }
        field(47; "Phase Code"; Code[10])
        {
            Caption = 'Phase Code';
            //TableRelation = Table161;  //PCPL-25/191222
        }
        field(48; "Task Code"; Code[10])
        {
            Caption = 'Task Code';
            //TableRelation = Table162; //PCPL-25/191222
        }
        field(49; "Step Code"; Code[10])
        {
            Caption = 'Step Code';
            //TableRelation = Table163;     //PCPL-25/191222
        }
        field(50; "Job Applies-to ID"; Code[20])
        {
            Caption = 'Job Applies-to ID';
        }
        field(51; "Apply and Close (Job)"; Boolean)
        {
            Caption = 'Apply and Close (Job)';
        }
        field(52; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
        }
        field(58; "Qty. Shipped Not Invoiced"; Decimal)
        {
            Caption = 'Qty. Shipped Not Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(61; "Quantity Invoiced"; Decimal)
        {
            Caption = 'Quantity Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(65; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(66; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
        }
        field(68; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(71; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
        }
        field(72; "Purch. Order Line No."; Integer)
        {
            Caption = 'Purch. Order Line No.';
        }
        field(73; "Drop Shipment"; Boolean)
        {
            Caption = 'Drop Shipment';
        }
        field(74; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(75; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(77; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(78; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(79; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(80; "Attached to Line No."; Integer)
        {
            Caption = 'Attached to Line No.';
            TableRelation = "Sales Shipment Line"."Line No." WHERE("Document No." = FIELD("Document No."));
        }
        field(81; "Exit Point"; Code[10])
        {
            Caption = 'Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(82; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(83; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(85; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(86; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(87; "Tax Group Code"; Code[10])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(89; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(90; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(91; "Currency Code"; Code[10])
        {
            CalcFormula = Lookup("Sales Shipment Header"."Currency Code" WHERE("No." = FIELD("Document No.")));
            Caption = 'Currency Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(97; "Blanket Order No."; Code[20])
        {
            Caption = 'Blanket Order No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST("Blanket Order"));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(98; "Blanket Order Line No."; Integer)
        {
            Caption = 'Blanket Order Line No.';
            TableRelation = "Sales Line"."Line No." WHERE("Document Type" = CONST("Blanket Order"),
                                                           "Document No." = FIELD("Blanket Order No."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(99; "VAT Base Amount"; Decimal)
        {
            Caption = 'VAT Base Amount';
            Editable = false;
        }
        field(100; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            Editable = false;
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST(Item)) "Item Variant".Code WHERE("Item No." = FIELD("No."));
        }
        field(5403; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Code"),
                                            "Item Filter" = FIELD("No."),
                                            "Variant Filter" = FIELD("Variant Code"));
        }
        field(5404; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."))
            ELSE
            "Unit of Measure";
        }
        field(5415; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5461; "Qty. Invoiced (Base)"; Decimal)
        {
            Caption = 'Qty. Invoiced (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5600; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
        }
        field(5602; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            TableRelation = "Depreciation Book";
        }
        field(5605; "Depr. until FA Posting Date"; Boolean)
        {
            Caption = 'Depr. until FA Posting Date';
        }
        field(5612; "Duplicate in Depreciation Book"; Code[10])
        {
            Caption = 'Duplicate in Depreciation Book';
            TableRelation = "Depreciation Book";
        }
        field(5613; "Use Duplication List"; Boolean)
        {
            Caption = 'Use Duplication List';
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5705; "Cross-Reference No."; Code[20])
        {
            Caption = 'Cross-Reference No.';
        }
        field(5706; "Unit of Measure (Cross Ref.)"; Code[10])
        {
            Caption = 'Unit of Measure (Cross Ref.)';
            TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }
        field(5707; "Cross-Reference Type"; Option)
        {
            Caption = 'Cross-Reference Type';
            OptionCaption = ' ,Customer,Vendor,Bar Code';
            OptionMembers = " ",Customer,Vendor,"Bar Code";
        }
        field(5708; "Cross-Reference Type No."; Code[30])
        {
            Caption = 'Cross-Reference Type No.';
        }
        field(5709; "Item Category Code"; Code[10])
        {
            Caption = 'Item Category Code';
            TableRelation = IF (Type = CONST(Item)) "Item Category";
        }
        field(5710; Nonstock; Boolean)
        {
            Caption = 'Nonstock';
        }
        field(5711; "Purchasing Code"; Code[10])
        {
            Caption = 'Purchasing Code';
            TableRelation = Purchasing;
        }
        field(5712; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';
            TableRelation = "Product Group".Code WHERE("Item Category Code" = FIELD("Item Category Code"));
        }
        field(5790; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
            Editable = false;
        }
        field(5791; "Promised Delivery Date"; Date)
        {
            Caption = 'Promised Delivery Date';
            Editable = false;
        }
        field(5792; "Shipping Time"; DateFormula)
        {
            Caption = 'Shipping Time';
        }
        field(5793; "Outbound Whse. Handling Time"; DateFormula)
        {
            Caption = 'Outbound Whse. Handling Time';
        }
        field(5794; "Planned Delivery Date"; Date)
        {
            Caption = 'Planned Delivery Date';
            Editable = false;
        }
        field(5795; "Planned Shipment Date"; Date)
        {
            Caption = 'Planned Shipment Date';
            Editable = false;
        }
        field(5811; "Appl.-from Item Entry"; Integer)
        {
            Caption = 'Appl.-from Item Entry';
            MinValue = 0;
        }
        field(5812; "Item Charge Base Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Item Charge Base Amount';
        }
        field(5817; Correction; Boolean)
        {
            Caption = 'Correction';
            Editable = false;
        }
        field(6608; "Return Reason Code"; Code[10])
        {
            Caption = 'Return Reason Code';
            TableRelation = "Return Reason";
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
            InitValue = true;
        }
        field(7002; "Customer Disc. Group"; Code[10])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
        field(13702; "Excise Bus. Posting Group"; Code[10])
        {
            //TableRelation = "Excise Bus. Posting Group";  //PCPL-25/191222
        }
        field(13703; "Excise Prod. Posting Group"; Code[10])
        {
            //TableRelation = "Excise Prod. Posting Group"; //PCPL-25/191222
        }
        field(13750; "Capital Item"; Boolean)
        {
            Editable = false;
        }
        field(13755; "BED Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(13758; "AED Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(13759; "SED Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(13769; "SAED Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(13770; "CESS Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(13771; "NCCD Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(13772; "eCess Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(16350; "VAT Business Posting Group"; Code[10])
        {
            Editable = false;
            //TableRelation = "Excise Prod. Posting Group".Code;    //PCPL-25/191222
        }
        field(16351; "VAT Product Posting Group"; Code[10])
        {
            Editable = false;
            //TableRelation = "Excise Prod. Posting Group".Code;    //PCPL-25/191222
        }
        field(16352; "VAT %age"; Decimal)
        {
            Editable = false;
        }
        field(16353; "VAT Base"; Decimal)
        {
            Editable = false;
        }
        field(16354; "VAT Amount"; Decimal)
        {
            Editable = false;
        }
        field(16355; "Zero Duty Good"; Boolean)
        {
        }
        field(16358; "Reverse VAT"; Boolean)
        {
        }
        field(50050; "SO NO."; Code[20])
        {
        }
        field(33000990; "Incentive Type"; Option)
        {
            OptionCaption = ' ,DFRC,DEPB,DDB';
            OptionMembers = " ",DFRC,DEPB,DDB;
        }
        field(33000991; "DEPB Applied"; Boolean)
        {
        }
        field(33000992; "DEPB Application No."; Code[20])
        {
        }
        field(33000993; "DFRC Applied"; Boolean)
        {
        }
        field(33000994; "DFRC Application No."; Code[20])
        {
        }
        field(33000995; "Adv. License No."; Code[20])
        {

            trigger OnValidate()
            var
                lrecSalesHeader: Record 36;
            begin
            end;
        }
        field(33000996; "EPCG No."; Code[20])
        {

            trigger OnValidate()
            var
                lrecSalesHeader: Record 36;
            begin
            end;
        }
        field(33000997; "Incentive Applied"; Boolean)
        {
            Caption = 'DDB Applied';
        }
        field(33000998; "Claim DDB"; Boolean)
        {
        }
        field(33000999; "Shipping Bill No"; Code[20])
        {
        }
        field(33001000; "Shipping Bill Date"; Date)
        {
        }
        field(33001001; "Date of Let Export Order"; Date)
        {
        }
        field(33001002; "Export Shipment No."; Code[20])
        {
            Caption = 'Posted Export Shipment No.';
        }
        field(33001003; "Export Shipment Line No."; Integer)
        {
            Caption = 'Posted Export Shipment Line No.';
        }
        field(33001004; "Packing Code"; Code[20])
        {
        }
        field(33001005; "Packing Details"; Text[30])
        {
            Editable = false;
        }
        field(33001006; "FOB (INR)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(33001007; "FOB (USD)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(33001008; Freight; Decimal)
        {
            Editable = false;
        }
        field(33001009; Insurance; Decimal)
        {
            Editable = false;
        }
        field(33001010; Discount; Decimal)
        {
            Editable = false;
        }
        field(33001011; "Misc. Charges"; Decimal)
        {
            Editable = false;
        }
        field(33001012; "Charges Defined"; Boolean)
        {
        }
        field(33001013; "Freight Currency"; Code[10])
        {
            TableRelation = Currency;
        }
        field(33001014; "Insurance Currency"; Code[10])
        {
            TableRelation = Currency;
        }
        field(33001015; "Discount Currency"; Code[10])
        {
            TableRelation = Currency;
        }
        field(33001016; "Charges Currency"; Code[10])
        {
            TableRelation = Currency;
        }
        field(33001017; "Freight Currency Factor"; Decimal)
        {
        }
        field(33001018; "Insurance Currency Factor"; Decimal)
        {
        }
        field(33001019; "Discount Currency Factor"; Decimal)
        {
        }
        field(33001020; "Charges Currency Factor"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document No.", "Order No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        IF recPackingListHeader.GET("Document No.") THEN
            IF (recPackingListHeader.Status <> recPackingListHeader.Status::Active) THEN
                ERROR(MS33000990);

        // recPkgDetails.RESET;
        // recPkgDetails.SETRANGE("Packing List No.","Document No.");
        // recPkgDetails.SETRANGE("Line No.","Line No.");
        // IF recPkgDetails.FIND('-') THEN
        //   recPkgDetails.DELETEALL;           //PCPL-25/191222
    end;

    var
        recPackingListHeader: Record 50054;
        //recPkgDetails: Record 33001048;       //PCPL-25/191222
        MS33000990: Label 'Only Active Packing Lists can be deleted.';

    [Scope('Internal')]
    procedure fctShowPackageDetails()
    var
    //lrecPkgDetails: Record 33001048;      //PCPL-25/191222
    //lpagePackingListPkgDetails: Page 33001103;  //PCPL-25/191222
    begin
        // lrecPkgDetails.RESET;
        // lrecPkgDetails.SETRANGE("Packing List No.","Document No.");
        // /*lfrmPackingListPkgDetails.SETTABLEVIEW(lrecPkgDetails);
        // lfrmPackingListPkgDetails.RUNMODAL; */ //asmita

        // lpagePackingListPkgDetails.SETTABLEVIEW(lrecPkgDetails);
        // lpagePackingListPkgDetails.RUNMODAL;  //PCPL-25/191222

    end;
}

