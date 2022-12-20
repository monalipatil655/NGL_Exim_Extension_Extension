page 50168 "Packing List Subform"
{
    AutoSplitKey = true;
    Caption = 'Packing List Subform';
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = 50053;

    layout
    {
        area(content)
        {
            repeater("---")
            {
                field(Type; Type)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Variant Code"; "Variant Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    Editable = false;
                }
                field("Incentive Type"; "Incentive Type")
                {
                    ApplicationArea = All;
                }
                field("Claim DDB"; "Claim DDB")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Planned Delivery Date"; "Planned Delivery Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Planned Shipment Date"; "Planned Shipment Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = true;
                }
                field("Shipping Time"; "Shipping Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        DescriptionOnFormat;
    end;

    var
        [InDataSet]
        DescriptionEmphasize: Boolean;

    // [Scope('Internal')]
    // procedure fctGetPackingListLines(var PrecSalesHeader: Record 36; pcodPackingListNo: Code[20])
    // var
    //lcduExim: Codeunit 33001004;
    //lrecSalesLine: Record 37;
    //lfrmForm: Page 33001012;
    //lfrmItemFrm: Page 33001016;
    // begin
    //     //PCPL-25/191222

    //     lfrmForm.fctSetPackingListNo(pcodPackingListNo);
    //     lfrmForm.SETTABLEVIEW(PrecSalesHeader);   
    //     lfrmForm.LOOKUPMODE := TRUE;
    //     IF lfrmForm.RUNMODAL = ACTION::LookupOK THEN BEGIN
    //         lfrmForm.fctGetSelection(PrecSalesHeader);
    //         IF PrecSalesHeader.FIND('-') THEN;
    //         lrecSalesLine.SETRANGE("Document Type", PrecSalesHeader."Document Type");
    //         lrecSalesLine.SETRANGE("Document No.", PrecSalesHeader."No.");
    //         //lrecSalesLine.SETFILTER("Qty. to Ship",'>0');//gitl-dev
    //         lfrmItemFrm.SETTABLEVIEW(lrecSalesLine);
    //         lfrmItemFrm.LOOKUPMODE := TRUE;
    //         IF lfrmItemFrm.RUNMODAL = ACTION::LookupOK THEN BEGIN
    //             lfrmItemFrm.SETTABLEVIEW(lrecSalesLine);
    //             lcduExim.fctCreatePackingList(pcodPackingListNo, PrecSalesHeader, lrecSalesLine);
    // END;
    //   END;
    //end;

    [Scope('Internal')]
    procedure fctShowPackageDtls()
    begin
        fctShowPackageDetails;
    end;

    local procedure DescriptionOnFormat()
    begin
        IF Type = Type::" " THEN DescriptionEmphasize := TRUE;
    end;
}

