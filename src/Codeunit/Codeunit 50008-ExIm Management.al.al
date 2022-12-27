codeunit 50008 "ExIm Management"
{
    // //PCPL/NGL/005    NIKHIL    Code added to flow Batch No. on Packing list creation

    trigger OnRun()
    begin
    end;

    var
        ReservationEntry: Record 337;

    [Scope('Internal')]
    procedure fctCreatePackingList(pcodPackingListNo: Code[20]; var PrecSalesHeader: Record 36; var PrecSalesLine: Record 37)
    var
        lrecPackingListHeader: Record 50054;//"33001046";
    begin
        IF PrecSalesHeader.FIND('-') THEN BEGIN
            lrecPackingListHeader.SETRANGE("No.", pcodPackingListNo);
            IF lrecPackingListHeader.FIND('-') THEN BEGIN
                lrecPackingListHeader."SO NO." := PrecSalesHeader."No.";
                //lrecPackingListHeader."No." := PrecSalesHeader."No.";
                //lrecPackingListHeader.Port := PrecSalesHeader.Port;   //PCPL-25/271222
                lrecPackingListHeader."Ship-to City" := PrecSalesHeader."Ship-to Code";
                //lrecPackingListHeader."Port of Discharge" := PrecSalesHeader."Port of Discharge"; //PCPL-25/271222
                lrecPackingListHeader."Country of Final Destination" := PrecSalesHeader."Country of Final Destination";
                //lrecPackingListHeader."Country of Origin of Goods" := PrecSalesHeader."Country of Origin of Goods";   //PCPL-25/271222
                lrecPackingListHeader."Final Destination" := PrecSalesHeader."Final Destination";
                lrecPackingListHeader."External Document No." := PrecSalesHeader."External Document No.";
                //lrecPackingListHeader."Vessel/Flight No." := PrecSalesHeader."Vessel/Flight No."; //PCPL-25/271222
                //lrecPackingListHeader."Pre-Carriage" := PrecSalesHeader."Pre-Carriage";   //PCPL-25/271222
                //lrecPackingListHeader.Carriage := PrecSalesHeader.Carriage;   //PCPL-25/271222
                lrecPackingListHeader."Order Date" := PrecSalesHeader."Order Date";
                //lrecPackingListHeader."Company Bank Account" := PrecSalesHeader."Bank Account";  //PCPL-25/271222
                lrecPackingListHeader.MODIFY;
            END;

            REPEAT
                // Perform Validation
                fctPackingListValidation(pcodPackingListNo, PrecSalesHeader."No.");

                // Insert into Packing List Line
                fctInsertIntoPackingList(pcodPackingListNo, PrecSalesLine);

                //PrecSalesHeader."Packing List No." := pcodPackingListNo;  //PCPL-25/271222
                PrecSalesHeader.MODIFY;
            UNTIL PrecSalesHeader.NEXT = 0;
        END
    end;

    [Scope('Internal')]
    procedure fctInsertIntoPackingList(pcodPackingListNo: Code[20]; var PrecSalesLine: Record 37)
    var
        lrecPackingListLine: Record 50053;//"33001047";
        lintLineNo: Integer;
        lMS33000990: Label 'Export Order No. %1';
    begin
        IF PrecSalesLine.FIND('-') THEN BEGIN

            // Find Line No.
            lrecPackingListLine.RESET;
            lrecPackingListLine.SETRANGE("Document No.", pcodPackingListNo);
            IF lrecPackingListLine.FIND('+') THEN BEGIN
                lintLineNo := lrecPackingListLine."Line No." + 10000;
            END ELSE
                lintLineNo := 10000;

            // Insert Header Information
            lrecPackingListLine.INIT;
            lrecPackingListLine."Document No." := pcodPackingListNo;
            lrecPackingListLine.Description := STRSUBSTNO(lMS33000990, PrecSalesLine."Document No.");
            lrecPackingListLine."Line No." := lintLineNo;
            lrecPackingListLine.INSERT;
            REPEAT
                // Insert Packing List Line
                lintLineNo := lintLineNo + 10000;
                lrecPackingListLine.INIT;
                lrecPackingListLine.TRANSFERFIELDS(PrecSalesLine);
                ReservationEntry.RESET;  //PCPL/NGL/005 >>
                ReservationEntry.SETRANGE(ReservationEntry."Source ID", lrecPackingListLine."Document No.");
                IF ReservationEntry.FINDFIRST THEN
                    lrecPackingListLine."SO NO." := ReservationEntry."Lot No."; //PCPL/NGL/005  <<
                lrecPackingListLine."Document No." := pcodPackingListNo;
                lrecPackingListLine."Line No." := lintLineNo;
                lrecPackingListLine.Quantity := PrecSalesLine."Qty. to Ship";
                lrecPackingListLine."Quantity (Base)" := PrecSalesLine."Qty. to Ship (Base)";
                lrecPackingListLine."Order No." := PrecSalesLine."Document No.";
                lrecPackingListLine."Order Line No." := PrecSalesLine."Line No.";
                lrecPackingListLine.INSERT;
            UNTIL PrecSalesLine.NEXT = 0;
        END;
    end;

    [Scope('Internal')]
    procedure fctPackingListValidation(pcodPackingListNo: Code[20]; pcodExportOrderNo: Code[20])
    var
        lrecPackingListLine: Record 50053;//"33001047";
        lMS33000990: Label 'Packing List Line already exist for Export Order No. %1. Please remove the lines and then add Packing List Lines for the Export Order.';
    begin
        // Perform Validation for creation of Packing List
        lrecPackingListLine.SETCURRENTKEY("Document No.", "Order No.");
        lrecPackingListLine.SETRANGE("Document No.", pcodPackingListNo);
        lrecPackingListLine.SETRANGE("Order No.", pcodExportOrderNo);
        IF lrecPackingListLine.FIND('-') THEN
            ERROR(lMS33000990, pcodExportOrderNo);
    end;

    // [Scope('Internal')]
    // procedure fctTotalFOBs(pcodDocNo: Code[20]; pintIncentive: Integer; pblnClaimDDB: Boolean; var PdecItemFreight: Decimal; var PdecItemInsurance: Decimal; var PdecItemDiscount: Decimal; var PdecItemCommission: Decimal): Decimal
    // var
    //     lrecSalesInvLine: Record 113;
    //     lrecSalesInvHeader: Record 112;
    //     //lrecCustCurrExchRate: Record "33001051";      //PCPL-25/271222
    //     ldecAmountLCY: Decimal;
    //     ldecAmount: Decimal;
    //     ldecFreightAmount: Decimal;
    //     ldecInsuranceAmount: Decimal;
    //     ldecChargesAmount: Decimal;
    //     ldecDiscountamount: Decimal;
    // begin
    //     // This function is used by Shipping Bill and Bank Certificate Report
    //     CLEAR(PdecItemFreight);
    //     CLEAR(PdecItemInsurance);
    //     CLEAR(PdecItemDiscount);
    //     CLEAR(PdecItemCommission);

    //     lrecSalesInvHeader.RESET;
    //     lrecSalesInvHeader.SETRANGE("No.", pcodDocNo);
    //     IF lrecSalesInvHeader.FIND('-') THEN
    //         lrecSalesInvHeader.CALCFIELDS(Amount);
    //     lrecSalesInvLine.SETRANGE("Document No.", pcodDocNo);
    //     //lrecSalesInvLine.SETRANGE("Incentive Type", pintIncentive);
    //     //lrecSalesInvLine.SETRANGE("Claim DDB", pblnClaimDDB);
    //     IF (lrecSalesInvHeader."Currency Code" <> '') THEN
    //         ldecAmount := ROUND(lrecCustCurrExchRate.fctExchangeAmtFCYToLCY(lrecSalesInvHeader."Posting Date",
    //                             lrecSalesInvHeader."Currency Code", lrecSalesInvHeader.Amount, lrecSalesInvHeader."Currency Factor"))
    //     ELSE
    //         ldecAmount := lrecSalesInvHeader.Amount;

    //     IF lrecSalesInvLine.FIND('-') THEN
    //         REPEAT
    //             IF (lrecSalesInvHeader."Currency Code" <> '') THEN BEGIN
    //                 ldecAmountLCY := ROUND(lrecCustCurrExchRate.fctExchangeAmtFCYToLCY(lrecSalesInvHeader."Posting Date",
    //                                              lrecSalesInvHeader."Currency Code", lrecSalesInvLine."Line Amount",
    //                                              lrecSalesInvHeader."Currency Factor"));

    //                 ldecFreightAmount := ROUND(lrecCustCurrExchRate.fctExchangeAmtFCYToLCY(lrecSalesInvHeader."Posting Date",
    //                                              lrecSalesInvHeader."Currency Code", lrecSalesInvLine.Freight,
    //                                              lrecSalesInvHeader."Currency Factor"));
    //                 ldecInsuranceAmount := ROUND(lrecCustCurrExchRate.fctExchangeAmtFCYToLCY(lrecSalesInvHeader."Posting Date",
    //                                              lrecSalesInvHeader."Currency Code", lrecSalesInvLine.Insurance,
    //                                              lrecSalesInvHeader."Currency Factor"));
    //                 ldecDiscountamount := ROUND(lrecCustCurrExchRate.fctExchangeAmtFCYToLCY(lrecSalesInvHeader."Posting Date",
    //                                              lrecSalesInvHeader."Currency Code", lrecSalesInvLine.Discount,
    //                                              lrecSalesInvHeader."Currency Factor"));
    //                 ldecChargesAmount := ROUND(lrecCustCurrExchRate.fctExchangeAmtFCYToLCY(lrecSalesInvHeader."Posting Date",
    //                                              lrecSalesInvHeader."Currency Code", lrecSalesInvLine."Misc. Charges",
    //                                              lrecSalesInvHeader."Currency Factor"));

    //                 PdecItemFreight := PdecItemFreight + (ldecAmountLCY / ldecAmount * ldecFreightAmount);
    //                 PdecItemInsurance := PdecItemInsurance + (ldecAmountLCY / ldecAmount * ldecInsuranceAmount);
    //                 PdecItemDiscount := PdecItemDiscount + (ldecAmountLCY / ldecAmount * ldecDiscountamount);
    //                 PdecItemCommission := PdecItemCommission + (ldecAmountLCY / ldecAmount * ldecChargesAmount);
    //             END ELSE BEGIN
    //                 ldecAmountLCY := lrecSalesInvLine."Line Amount";
    //                 ldecFreightAmount := lrecSalesInvLine.Freight;
    //                 ldecInsuranceAmount := lrecSalesInvLine.Insurance;
    //                 ldecDiscountamount := lrecSalesInvLine.Discount;
    //                 ldecChargesAmount := lrecSalesInvLine."Misc. Charges";

    //                 PdecItemFreight := PdecItemFreight + (lrecSalesInvLine."Line Amount" / ldecAmount * ldecFreightAmount);
    //                 PdecItemInsurance := PdecItemInsurance + (lrecSalesInvLine."Line Amount" / ldecAmount * ldecInsuranceAmount);
    //                 PdecItemDiscount := PdecItemDiscount + (lrecSalesInvLine."Line Amount" / ldecAmount * ldecDiscountamount);
    //                 PdecItemCommission := PdecItemCommission + (lrecSalesInvLine."Line Amount" / ldecAmount * ldecChargesAmount);
    //             END;
    //         UNTIL lrecSalesInvLine.NEXT = 0;

    //     PdecItemFreight := ROUND(PdecItemFreight, 0.01);
    //     PdecItemInsurance := ROUND(PdecItemInsurance, 0.01);
    //     PdecItemDiscount := ROUND(PdecItemDiscount, 0.01);
    //     PdecItemCommission := ROUND(PdecItemCommission, 0.01);
    // end;

    // [Scope('Internal')]
    // procedure fctUOMConversion(pcodNetWeightUOM: Code[10]; pcodWeightUOM: Code[10]; var PdecWeight: Decimal)
    // var
    //     lrecConvertUOM: Record "33001053";
    //     lMS33000990: Label 'The Conversion for the Unit of Measure has not been defined';
    // begin
    //     IF (pcodNetWeightUOM <> pcodWeightUOM) THEN
    //         IF lrecConvertUOM.GET(pcodNetWeightUOM, pcodWeightUOM) THEN
    //             PdecWeight := PdecWeight / lrecConvertUOM."Conversion Qty."
    //         ELSE
    //             IF lrecConvertUOM.GET(pcodWeightUOM, pcodNetWeightUOM) THEN
    //                 PdecWeight := PdecWeight * lrecConvertUOM."Conversion Qty."
    //             ELSE
    //                 ERROR(lMS33000990);
    // end;

    // [Scope('Internal')]
    // procedure fctTotalPkgs(pcodPackingListNo: Code[20]; var PintTotalPkgs: Integer)
    // var
    //     lrecPackageDetails: Record "33001048";
    //     lintCounter: Integer;
    //     ltmpInteger: Record "2000000026" temporary;
    // begin
    //     lrecPackageDetails.RESET;
    //     lrecPackageDetails.SETRANGE("Packing List No.", pcodPackingListNo);
    //     IF lrecPackageDetails.FIND('-') THEN
    //         REPEAT
    //             FOR lintCounter := lrecPackageDetails."From Package No." TO lrecPackageDetails."To Package No." DO BEGIN
    //                 ltmpInteger.INIT;
    //                 ltmpInteger.Number := lintCounter;
    //                 IF ltmpInteger.INSERT THEN;
    //             END;
    //         UNTIL (lrecPackageDetails.NEXT = 0);
    //     PintTotalPkgs := ltmpInteger.COUNT;
    // end;

    // [Scope('Internal')]
    // procedure fctTotalConsolidatePkgs(pcodPackingListNo: Code[20]; poptIncentive: Option " ",DFRC,DEPB,DDB; pblnClaimDDB: Boolean; var PintTotalPkgs: Integer)
    // var
    //     lrecPackageDetails: Record 50047;//"33001048";
    //     ltmpPackageDetails: Record 50047;//"33001048" temporary;
    //     lintCounter: Integer;
    //     ltmpInteger: Record "2000000026" temporary;
    // begin
    //     lrecPackageDetails.RESET;
    //     lrecPackageDetails.SETRANGE("Packing List No.", pcodPackingListNo);
    //     lrecPackageDetails.SETRANGE("Incentive Type", poptIncentive);
    //     lrecPackageDetails.SETRANGE("Claim DDB", pblnClaimDDB);
    //     IF lrecPackageDetails.FIND('-') THEN
    //         REPEAT
    //             FOR lintCounter := lrecPackageDetails."From Package No." TO lrecPackageDetails."To Package No." DO BEGIN
    //                 ltmpInteger.INIT;
    //                 ltmpInteger.Number := lintCounter;
    //                 IF ltmpInteger.INSERT THEN;
    //             END;
    //         UNTIL (lrecPackageDetails.NEXT = 0);
    //     PintTotalPkgs := ltmpInteger.COUNT;
    // end;

    // [Scope('Internal')]
    // procedure fctModifyDDBEntry(precGenJnlLine: Record 81)
    // var
    //     lrecDDBDetails: Record "33001022";
    //     lMS33000990: Label 'The Amount received cannot be more than the allocated incentive amount.';
    // begin
    //     WITH precGenJnlLine DO BEGIN
    //         IF lrecDDBDetails.GET("DDB No.") THEN BEGIN
    //             lrecDDBDetails."Amount Received" := lrecDDBDetails."Amount Received" + ABS(Amount);
    //             lrecDDBDetails."Amount Remaining" := lrecDDBDetails."Govt. Incentive Amount" - lrecDDBDetails."Amount Received";
    //             IF (lrecDDBDetails."Amount Received" > lrecDDBDetails."Govt. Incentive Amount") THEN
    //                 ERROR(lMS33000990);
    //             IF lrecDDBDetails."Amount Remaining" = 0 THEN
    //                 lrecDDBDetails.Status := lrecDDBDetails.Status::Received
    //             ELSE
    //                 lrecDDBDetails.Status := lrecDDBDetails.Status::"Partially Received";
    //             lrecDDBDetails.MODIFY;
    //         END;
    //     END
    // end;//Temp comment PCPL-25/271222

}

