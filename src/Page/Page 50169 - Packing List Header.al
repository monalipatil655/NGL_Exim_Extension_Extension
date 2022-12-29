page 50169 "Packing List Header"
{
    Caption = 'Packing List';
    PageType = Card;
    SourceTable = 50054;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        IF fctAssistEdit THEN
                            CurrPage.UPDATE;
                    end;     //PCPL-25/271222
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Editable = "Sell-to Customer No.Editable";
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    Editable = "Sell-to Customer NameEditable";
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                    ApplicationArea = All;
                    Editable = "Sell-to AddressEditable";
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                    ApplicationArea = All;
                    Editable = "Sell-to Address 2Editable";
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Sell-to Post Code/City';
                    Editable = "Sell-to Post CodeEditable";
                }
                field("Sell-to City"; "Sell-to City")
                {
                    ApplicationArea = All;
                    Editable = "Sell-to CityEditable";
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Creation Date';
                    Editable = "Posting DateEditable";
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = All;
                    Editable = "Document DateEditable";
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ApplicationArea = All;
                    Editable = RequestedDeliveryDateEditable;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    ApplicationArea = All;
                    Editable = "Promised Delivery DateEditable";
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    ApplicationArea = All;
                    Editable = "Salesperson CodeEditable";
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = All;
                    Editable = "Responsibility CenterEditable";
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Marks; Marks)
                {
                    ApplicationArea = All;
                }
            }
            part(PackingListLines; 50168)
            {
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = Basic, Suite;
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = All;
                    Editable = "Ship-to CodeEditable";
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    ApplicationArea = All;
                    Editable = "Ship-to NameEditable";
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    ApplicationArea = All;
                    Editable = "Ship-to AddressEditable";
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    ApplicationArea = All;
                    Editable = "Ship-to Address 2Editable";
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Post Code/City';
                    Editable = "Ship-to Post CodeEditable";
                }
                field("Ship-to City"; "Ship-to City")
                {
                    ApplicationArea = All;
                    Editable = "Ship-to CityEditable";
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = All;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = All;
                    Editable = "Shipment DateEditable";
                }
                field("Shipping Time"; "Shipping Time")
                {
                    ApplicationArea = All;
                    Editable = "Shipping TimeEditable";
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    ApplicationArea = All;
                    Editable = "Shipment Method CodeEditable";
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Editable = "Shipping Agent CodeEditable";
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    ApplicationArea = All;
                    Editable = ShippingAgentServiceCodeEditab;
                }
                field("Package Tracking No."; "Package Tracking No.")
                {
                    ApplicationArea = All;
                    Editable = "Package Tracking No.Editable";
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Name 2"; "Bill-to Name 2")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                    ApplicationArea = All;
                }
                field("Bill-to City"; "Bill-to City")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                    ApplicationArea = All;
                }
            }
            group(Export)
            {
                Caption = 'Export';
                field(Port; Port)
                {
                    Editable = false;
                }
                field("Port of Discharge"; "Port of Discharge")
                {
                    Editable = false;
                }
                field("Country of Final Destination"; "Country of Final Destination")
                {
                    Editable = false;
                }
                field("Country of Origin of Goods"; "Country of Origin of Goods")
                {
                    Editable = false;
                }
                field("Final Destination"; "Final Destination")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Pre-Carriage"; "Pre-Carriage")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Place of Receipt Pre-Carriage"; "Place of Receipt Pre-Carriage")
                {
                    ApplicationArea = All;
                }
                field(Carriage; Carriage)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vessel/Flight No."; "Vessel/Flight No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Company Bank Account"; "Company Bank Account")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Define Package Details")
                {
                    Caption = 'Define Package Details';
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        SalesHeader: Record 36;
                    begin
                        CurrPage.PackingListLines.PAGE.fctShowPackageDtls;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                // action("Update Export Order No")
                // {
                //     Caption = 'Update Export Order No';
                //     ApplicationArea = All;

                //     trigger OnAction()
                //     var
                //         SalesHeader: Record 36;
                //         PageExportOrdList: page "Export Order List";
                //     begin
                //         TESTFIELD(Status, Status::Active);
                //         TESTFIELD("Sell-to Customer No.");

                //         SalesHeader.FILTERGROUP(2);
                //         SalesHeader.SetRange("Export Order", TRUE);
                //         SalesHeader.SETRANGE(Status, SalesHeader.Status::Released);
                //         SalesHeader.SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");
                //         SalesHeader.FILTERGROUP(0);
                //         PageExportOrdList.LOOKUPMODE := TRUE;
                //         PageExportOrdList.SETTABLEVIEW(SalesHeader);
                //         IF PageExportOrdList.RUNMODAL = ACTION::LookupOK THEN
                //             PageExportOrdList.SETSELECTIONFILTER(SalesHeader);
                //         if SalesHeader.FindFirst() then begin
                //             Rec.Get("No.");
                //             rec.Rename(SalesHeader."No.");
                //             Commit();
                //         end;
                //     end;
                // }  //PCPL-25/291222
                action("Insert Export Order Lines")
                {
                    Caption = 'Insert Export Order Lines';
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        SalesHeader: Record 36;
                    begin
                        TESTFIELD(Status, Status::Active);
                        TESTFIELD("Sell-to Customer No.");

                        SalesHeader.FILTERGROUP(2);
                        SalesHeader.SetRange("Export Order", TRUE);
                        SalesHeader.SETRANGE(Status, SalesHeader.Status::Released);
                        SalesHeader.SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");
                        SalesHeader.FILTERGROUP(0);

                        CurrPage.PackingListLines.PAGE.fctGetPackingListLines(SalesHeader, "No.");
                    end;
                }
            }
            group("&Print")
            {
                Caption = '&Print';
                action("Packing List")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        PackingListHeader.RESET;
                        PackingListHeader.SETRANGE(PackingListHeader."No.", "No.");
                        IF PackingListHeader.FINDFIRST THEN
                            REPORT.RUNMODAL(50080, TRUE, FALSE, PackingListHeader);
                    end;
                }
                action("Posted Shipped Packing List")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        PackingListHeader.RESET;
                        PackingListHeader.SETRANGE(PackingListHeader."No.", "No.");
                        IF PackingListHeader.FINDFIRST THEN
                            REPORT.RUNMODAL(50082, TRUE, FALSE, PackingListHeader);
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        ShippingAgentServiceCodeEditab := TRUE;
        "Shipping TimeEditable" := TRUE;
        "Package Tracking No.Editable" := TRUE;
        "Shipping Agent CodeEditable" := TRUE;
        "Shipment DateEditable" := TRUE;
        "Shipment Method CodeEditable" := TRUE;
        "Ship-to Post CodeEditable" := TRUE;
        "Ship-to CityEditable" := TRUE;
        "Ship-to Address 2Editable" := TRUE;
        "Ship-to AddressEditable" := TRUE;
        "Ship-to NameEditable" := TRUE;
        "Ship-to CodeEditable" := TRUE;
        "Responsibility CenterEditable" := TRUE;
        "Promised Delivery DateEditable" := TRUE;
        RequestedDeliveryDateEditable := TRUE;
        "Document DateEditable" := TRUE;
        "Sell-to Post CodeEditable" := TRUE;
        "Salesperson CodeEditable" := TRUE;
        "Posting DateEditable" := TRUE;
        "Sell-to CityEditable" := TRUE;
        "Sell-to Address 2Editable" := TRUE;
        "Sell-to AddressEditable" := TRUE;
        "Sell-to Customer NameEditable" := TRUE;
        "Sell-to Customer No.Editable" := TRUE;
    end;

    var
        MS33000990: Label 'Status must be either Active or Shipped of Packing List No. %1';
        recPackingList: Record 50054;
        [InDataSet]
        "Sell-to Customer No.Editable": Boolean;
        [InDataSet]
        "Sell-to Customer NameEditable": Boolean;
        [InDataSet]
        "Sell-to AddressEditable": Boolean;
        [InDataSet]
        "Sell-to Address 2Editable": Boolean;
        [InDataSet]
        "Sell-to CityEditable": Boolean;
        [InDataSet]
        "Posting DateEditable": Boolean;
        [InDataSet]
        "Salesperson CodeEditable": Boolean;
        [InDataSet]
        "Sell-to Post CodeEditable": Boolean;
        [InDataSet]
        "Document DateEditable": Boolean;
        [InDataSet]
        RequestedDeliveryDateEditable: Boolean;
        [InDataSet]
        "Promised Delivery DateEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Ship-to CodeEditable": Boolean;
        [InDataSet]
        "Ship-to NameEditable": Boolean;
        [InDataSet]
        "Ship-to AddressEditable": Boolean;
        [InDataSet]
        "Ship-to Address 2Editable": Boolean;
        [InDataSet]
        "Ship-to CityEditable": Boolean;
        [InDataSet]
        "Ship-to Post CodeEditable": Boolean;
        [InDataSet]
        "Shipment Method CodeEditable": Boolean;
        [InDataSet]
        "Shipment DateEditable": Boolean;
        [InDataSet]
        "Shipping Agent CodeEditable": Boolean;
        [InDataSet]
        "Package Tracking No.Editable": Boolean;
        [InDataSet]
        "Shipping TimeEditable": Boolean;
        [InDataSet]
        ShippingAgentServiceCodeEditab: Boolean;
        PackingListHeader: Record 50054;

    local procedure SelltoCustomerNoOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Sell-to Customer No.Editable" := FALSE
        ELSE
            "Sell-to Customer No.Editable" := TRUE;
    end;

    local procedure SelltoCustomerNameOnBeforeInpu()
    begin
        IF (Status <> Status::Active) THEN
            "Sell-to Customer NameEditable" := FALSE
        ELSE
            "Sell-to Customer NameEditable" := TRUE;
    end;

    local procedure SelltoAddressOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Sell-to AddressEditable" := FALSE
        ELSE
            "Sell-to AddressEditable" := TRUE;
    end;

    local procedure SelltoAddress2OnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Sell-to Address 2Editable" := FALSE
        ELSE
            "Sell-to Address 2Editable" := TRUE;
    end;

    local procedure SelltoCityOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Sell-to CityEditable" := FALSE
        ELSE
            "Sell-to CityEditable" := TRUE;
    end;

    local procedure PostingDateOnBeforeInput()
    begin
        IF Status = Status::Shipped THEN
            "Posting DateEditable" := FALSE
        ELSE
            "Posting DateEditable" := TRUE;
    end;

    local procedure SalespersonCodeOnBeforeInput()
    begin
        IF Status = Status::Shipped THEN
            "Salesperson CodeEditable" := FALSE
        ELSE
            "Salesperson CodeEditable" := TRUE;
    end;

    local procedure SelltoPostCodeOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Sell-to Post CodeEditable" := FALSE
        ELSE
            "Sell-to Post CodeEditable" := TRUE;
    end;

    local procedure DocumentDateOnBeforeInput()
    begin
        IF Status = Status::Shipped THEN
            "Document DateEditable" := FALSE
        ELSE
            "Document DateEditable" := TRUE;
    end;

    local procedure RequestedDeliveryDateOnBeforeI()
    begin
        IF Status = Status::Shipped THEN
            RequestedDeliveryDateEditable := FALSE
        ELSE
            RequestedDeliveryDateEditable := TRUE;
    end;

    local procedure PromisedDeliveryDateOnBeforeIn()
    begin
        IF Status = Status::Shipped THEN
            "Promised Delivery DateEditable" := FALSE
        ELSE
            "Promised Delivery DateEditable" := TRUE;
    end;

    local procedure ResponsibilityCenterOnBeforeIn()
    begin
        IF Status = Status::Shipped THEN
            "Responsibility CenterEditable" := FALSE
        ELSE
            "Responsibility CenterEditable" := TRUE;
    end;

    local procedure ShiptoCodeOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Ship-to CodeEditable" := FALSE
        ELSE
            "Ship-to CodeEditable" := TRUE;
    end;

    local procedure ShiptoNameOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Ship-to NameEditable" := FALSE
        ELSE
            "Ship-to NameEditable" := TRUE;
    end;

    local procedure ShiptoAddressOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Ship-to AddressEditable" := FALSE
        ELSE
            "Ship-to AddressEditable" := TRUE;
    end;

    local procedure ShiptoAddress2OnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Ship-to Address 2Editable" := FALSE
        ELSE
            "Ship-to Address 2Editable" := TRUE;
    end;

    local procedure ShiptoCityOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Ship-to CityEditable" := FALSE
        ELSE
            "Ship-to CityEditable" := TRUE;
    end;

    local procedure ShiptoPostCodeOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Ship-to Post CodeEditable" := FALSE
        ELSE
            "Ship-to Post CodeEditable" := TRUE;
    end;

    local procedure ShipmentMethodCodeOnBeforeInpu()
    begin
        IF (Status <> Status::Active) THEN
            "Shipment Method CodeEditable" := FALSE
        ELSE
            "Shipment Method CodeEditable" := TRUE;
    end;

    local procedure ShipmentDateOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Shipment DateEditable" := FALSE
        ELSE
            "Shipment DateEditable" := TRUE;
    end;

    local procedure ShippingAgentCodeOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Shipping Agent CodeEditable" := FALSE
        ELSE
            "Shipping Agent CodeEditable" := TRUE;
    end;

    local procedure PackageTrackingNoOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Package Tracking No.Editable" := FALSE
        ELSE
            "Package Tracking No.Editable" := TRUE;
    end;

    local procedure ShippingTimeOnBeforeInput()
    begin
        IF (Status <> Status::Active) THEN
            "Shipping TimeEditable" := FALSE
        ELSE
            "Shipping TimeEditable" := TRUE;
    end;

    local procedure ShippingAgentServiceCodeOnBefo()
    begin
        IF (Status <> Status::Active) THEN
            ShippingAgentServiceCodeEditab := FALSE
        ELSE
            ShippingAgentServiceCodeEditab := TRUE;
    end;
}

