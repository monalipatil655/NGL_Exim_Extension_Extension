codeunit 50031 SalesHeader_Function_Extension
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterTestNoSeries', '', false, false)]
    local procedure OnAfterTestNoSeries(var SalesHeader: Record "Sales Header")
    var
        SalesSetup: Record 311;
    begin
        SalesSetup.GET;
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            IF SalesHeader."Export Order" = TRUE THEN
                SalesSetup.TESTFIELD("Export Order Nos.")
            ELSE
                SalesSetup.TESTFIELD("Order Nos.");
        END;

        IF SalesHeader."Document Type" = SalesHeader."Document Type"::"Blanket Order" then begin
            IF SalesHeader."Export Order" = TRUE THEN
                SalesSetup.TESTFIELD("Blanket Export Order Nos.")
            ELSE
                SalesSetup.TESTFIELD("Blanket Order Nos.");
        END;
    END;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterGetNoSeriesCode', '', false, false)]
    local procedure OnAfterGetNoSeriesCode(var SalesHeader: Record "Sales Header"; SalesReceivablesSetup: Record "Sales & Receivables Setup"; var NoSeriesCode: Code[20])
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            IF SalesHeader."Export Order" = TRUE THEN
                NoSeriesCode := SalesReceivablesSetup."Export Order Nos.";

        END;

        IF SalesHeader."Document Type" = SalesHeader."Document Type"::"Blanket Order" then begin
            IF SalesHeader."Export Order" = TRUE THEN
                NoSeriesCode := SalesReceivablesSetup."Blanket Export Order Nos.";

        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', false, false)]
    local procedure OnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; ItemLedgShptEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean; var SalesHeader: Record "Sales Header"; var TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary; PreviewMode: Boolean)
    var
        PostShipmentDetailsEXIM: record 50049;
    begin
        IF SalesInvHeader."Export Order" THEN
            IF NOT PostShipmentDetailsEXIM.GET(SalesInvHeader."No.", SalesInvHeader."Posting Date") THEN BEGIN
                PostShipmentDetailsEXIM.INIT;
                PostShipmentDetailsEXIM."Document No." := SalesInvHeader."No.";
                PostShipmentDetailsEXIM."Document Date" := SalesInvHeader."Posting Date";
                PostShipmentDetailsEXIM.INSERT;
            END;
        //PCPL-EXIM
    end;



    var
        myInt: Integer;
}