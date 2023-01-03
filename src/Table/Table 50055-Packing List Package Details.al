table 50055 "Packing List Package Details"
{

    fields
    {
        field(1; "Packing List No."; Code[20])
        {
            TableRelation = "Packing List Line"."Document No.";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "From Package No."; Integer)
        {
            MinValue = 1;

            trigger OnValidate()
            begin
                VALIDATE("Qty per Case");
            end;
        }
        field(4; "To Package No."; Integer)
        {
            MinValue = 1;

            trigger OnValidate()
            begin
                IF ("To Package No." < "From Package No.") THEN
                    ERROR(MS33000991, "From Package No.");
                VALIDATE("Qty per Case");
            end;
        }
        field(5; "Total Quantity"; Decimal)
        {
        }
        field(6; "Qty per Case"; Decimal)
        {

            trigger OnLookup()
            begin
                //"Gross Wght. per Case" := "Net Wght. per Case"+ ("Net Weight Per PCS"*"Qty per Case");
                "Gross Wght. per Case" := "Net Wght. per Case" + "Tare Weight Per Case";
            end;

            trigger OnValidate()
            begin
                decTotalQuantity := 0;
                decPackages := "To Package No." - ("From Package No." - 1);
                decTotalQuantity := decTotalQuantity + "Qty per Case" * decPackages;
                recPackageDetails.RESET;
                recPackageDetails.SETRANGE("Packing List No.", "Packing List No.");
                recPackageDetails.SETRANGE("Item No.", "Item No.");
                IF recPackageDetails.FIND('-') THEN BEGIN
                    REPEAT
                        IF (recPackageDetails."Line No." <> "Line No.") THEN
                            decTotalQuantity := decTotalQuantity + recPackageDetails."Qty per Case" *
                                                 (recPackageDetails."To Package No." - (recPackageDetails."From Package No." - 1));
                    UNTIL recPackageDetails.NEXT = 0;
                END;

                IF (decTotalQuantity > "Total Quantity") THEN
                    ERROR(MS33000992);

                Quantity := "Qty per Case" * decPackages;
            end;
        }
        field(7; "Net Wght. per Case"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Gross Wght. per Case" := "Net Wght. per Case"+ ("Net Weight Per PCS"*"Qty per Case");
                "Gross Wght. per Case" := "Net Wght. per Case" + "Tare Weight Per Case";
            end;
        }
        field(8; "Gross Wght. per Case"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Gross Wght. per Case" := "Net Wght. per Case"+ ("Net Weight Per PCS"*"Qty per Case");
                "Gross Wght. per Case" := "Net Wght. per Case" + "Tare Weight Per Case";
            end;
        }
        field(9; "Item No."; Code[20])
        {

            trigger OnLookup()
            begin
                recPackingListLine.SETRANGE("Document No.", "Packing List No.");
                recPackingListLine.SETRANGE(Type, recPackingListLine.Type::Item);
                IF recPackingListLine.FIND('-') THEN
                    REPEAT
                        recItem.GET(recPackingListLine."No.");
                        recItem.MARK(TRUE);
                    UNTIL recPackingListLine.NEXT = 0;
                recItem.MARKEDONLY(TRUE);
                //IF (FORM.RUNMODAL(FORM::"Item List",recItem) = ACTION::LookupOK) THEN //Asmita
                IF (PAGE.RUNMODAL(PAGE::"Item List", recItem) = ACTION::LookupOK) THEN
                    "Item No." := recItem."No.";
                VALIDATE("Item No.");
            end;

            trigger OnValidate()
            begin
                recPackingListLine.RESET;
                recPackingListLine.SETRANGE("Document No.", "Packing List No.");
                recPackingListLine.SETRANGE(Type, recPackingListLine.Type::Item);
                recPackingListLine.SETRANGE("No.", "Item No.");
                IF recPackingListLine.FIND('-') THEN BEGIN
                    "Item Description" := recPackingListLine.Description;
                    "Unit of Measure" := recPackingListLine."Unit of Measure Code";
                    "Incentive Type" := recPackingListLine."Incentive Type";
                    "Claim DDB" := recPackingListLine."Claim DDB";
                    "Total Quantity" := 0;
                    REPEAT
                        "Total Quantity" := "Total Quantity" + recPackingListLine.Quantity;
                    UNTIL recPackingListLine.NEXT = 0;
                END;
            end;
        }
        field(10; "Item Description"; Text[100])
        {
        }
        field(11; "Incentive Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,DFRC,DEPB,DDB';
            OptionMembers = " ",DFRC,DEPB,DDB;
        }
        field(12; "Unit of Measure"; Code[10])
        {
        }
        field(13; Quantity; Decimal)
        {
        }
        field(14; "Claim DDB"; Boolean)
        {
            Editable = false;
        }
        field(15; "Weight UOM"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(50001; "Net Weight Per PCS"; Decimal)
        {

            trigger OnValidate()
            begin
                "Gross Wght. per Case" := "Net Wght. per Case" + ("Net Weight Per PCS" * "Qty per Case");
            end;
        }
        field(50002; Length; Decimal)
        {

            trigger OnValidate()
            begin
                Volume := Length * Height * Width / 1000000
            end;
        }
        field(50003; Height; Decimal)
        {

            trigger OnValidate()
            begin
                Volume := Length * Height * Width / 1000000
            end;
        }
        field(50004; Width; Decimal)
        {

            trigger OnValidate()
            begin
                Volume := Length * Height * Width / 1000000
            end;
        }
        field(50005; Volume; Decimal)
        {
            DecimalPlaces = 3 : 3;
            Editable = false;
        }
        field(50006; "Transport Type"; Option)
        {
            OptionCaption = 'Train,Truck,Container,Other';
            OptionMembers = Train,Truck,Container,Other;
        }
        field(50007; "Transport Reg"; Code[20])
        {
        }
        field(50008; "Tare Weight Per Case"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Description = 'sanjay 30/12/2014';
        }
        field(50009; "COA No."; Text[30])
        {
            //TableRelation = Table50057.Field50;       //PCPL-25/020123
        }
        field(50010; "Lot Number"; Code[30])
        {
        }
        field(50011; "Manufacturing Date"; Date)
        {
        }
        field(50012; "Expiry Date"; Date)
        {
        }
        field(50013; "Kind of Packing"; Option)
        {
            Caption = 'Kind of Packing';
            OptionCaption = ' ,Drum,Shipper,Box,Case,Tablets';
            OptionMembers = " ",Drum,Shipper,Drums,Box,"Case",Tablets;
        }
        field(50014; "Shipping Mark"; Text[50])
        {
            Description = 'sanjay 18/04/2015';
        }
        field(50015; "No. Of Packages"; Integer)
        {
            Description = 'PCPL/NGL/006';
        }
    }

    keys
    {
        key(Key1; "Packing List No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Incentive Type", "Claim DDB")
        {
        }
        key(Key3; "From Package No.")
        {
        }
        key(Key4; "Item No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        recPackingListLine: Record 50053;//"33001047";
        recPackageDetails: Record 50055;//"33001048";
        recItem: Record 27;
        decPackages: Decimal;
        decTotalQuantity: Decimal;
        MS33000990: Label 'You cannot assign more quantity than the quantity defined in the Packing List No. %1';
        MS33000991: Label 'The Package No. cannot be less than %1';
        MS33000992: Label 'The Quantity per Case cannot be more than the Total Quantity for item %1';
}

