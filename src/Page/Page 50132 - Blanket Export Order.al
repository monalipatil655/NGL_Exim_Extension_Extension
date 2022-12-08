page 50001 "Blanket Export Order"
{
    // version NAVW19.00.00.51883,NAVIN9.00.00.51883,PCPL-EXIM

    //CaptionML = ENU = 'Blanket Export Order',
    //          ENN = 'Blanket Export Order';
    PageType = Document;
    //PromotedActionCategoriesML = ENU = 'New,Process,Report,Approve',
    //                           ENN = 'New,Process,Report,Approve';
    RefreshOnActivate = true;
    ApplicationArea = all;
    UsageCategory = Documents;
    SourceTable = 36;
    SourceTableView = WHERE("Document Type" = FILTER("Blanket Order"));

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General',
                            ENN = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = all;
                    trigger OnAssistEdit();
                    begin
                        IF BEOAssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Export Order"; "Export Order")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;

                        //PCPL-EXIM
                        recCust.GET("Sell-to Customer No.");
                        IF recCust."GST Customer Type" <> recCust."GST Customer Type"::Export THEN
                            ERROR('GST Customer must be Export in selected Customer Master');
                        //PCPL-EXIM
                    end;
                }
                field("Sell-to Contact No."; "Sell-to Contact No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        IF GETFILTER("Sell-to Contact No.") = xRec."Sell-to Contact No." THEN
                            IF "Sell-to Contact No." <> xRec."Sell-to Contact No." THEN
                                SETRANGE("Sell-to Contact No.");
                    end;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    ApplicationArea = all;
                }
                field("Sell-to City"; "Sell-to City")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    ApplicationArea = all;
                }
                field("GST Without Payment of Duty"; "GST Without Payment of Duty")
                {
                    ApplicationArea = all;
                }
                field("Shipment Under"; "Shipment Under")
                {
                    ApplicationArea = all;
                }
                field("LUT No."; "LUT No.")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Customer Order Date',
                                ENN = 'Order Date';
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = all;
                    trigger OnAssistEdit();
                    begin
                        CLEAR(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                            VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE;
                        SalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
                    end;
                }
                field("External Document No."; "External Document No.")
                {
                    CaptionML = ENU = 'Customer Order No.',
                                ENN = 'External Document No.';
                    ApplicationArea = all;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Campaign No."; "Campaign No.")
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = all;
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                }
            }
            group("Export Details - Stage 1")
            {
                field("Place of Rcpt. By Pre Carrier"; "Place of Rcpt. By Pre Carrier")
                {
                    ApplicationArea = all;
                }
                field("Port of Loading"; "Exit Point")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Port of Loading',
                                ENN = 'Exit Point';
                }
                field("Country of Origin of Goods"; "Country of Origin of Goods")
                {
                    ApplicationArea = all;
                }
                field("Final Destination"; "Final Destination")
                {
                    ApplicationArea = all;
                }
                field("Port of Discharge"; Area)
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Port of Discharge',
                                ENN = 'Area';
                }
                field("Export Under"; "Export Under")
                {
                    ApplicationArea = all;
                }
                field("Country of Final Destination"; "Country of Final Destination")
                {
                    ApplicationArea = all;
                }
                field("Our Bank Details"; "Our Bank Details")
                {
                    ApplicationArea = all;
                }
                field("Customer Bank Details"; "Customer Bank Details")
                {
                    ApplicationArea = all;
                }
                field("LC Number"; "LC Number")
                {
                    ApplicationArea = all;
                }
                field("LC Expiry Date"; "LC Expiry Date")
                {
                    ApplicationArea = all;
                }
            }
            part(SalesLines; 50003)
            {
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;

            }
            group(Invoicing)
            {
                CaptionML = ENU = 'Invoicing',
                            ENN = 'Invoicing';
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; "Bill-to Contact No.")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    ApplicationArea = all;
                }
                field("Bill-to City"; "Bill-to City")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                    ApplicationArea = all;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    ApplicationArea = all;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = all;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    ApplicationArea = all;
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    ApplicationArea = all;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    ApplicationArea = all;
                }
                field("Prices Including VAT"; "Prices Including VAT")
                {
                    ApplicationArea = all;

                    trigger OnValidate();
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
            }
            group(Shipping)
            {
                CaptionML = ENU = 'Shipping',
                            ENN = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Customer"; "Ship-to Customer")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    ApplicationArea = all;
                }
                field("Ship-to City"; "Ship-to City")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    ApplicationArea = all;
                }
                // field("Transit Document"; "Transit Document")
                // {
                // }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    ApplicationArea = all;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = all;
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU = 'Foreign Trade',
                            ENN = 'Foreign Trade';
                Visible = false;
                field("EU 3-Party Trade"; "EU 3-Party Trade")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; "Transaction Type")
                {
                    ApplicationArea = all;
                }
                field("Transaction Specification"; "Transaction Specification")
                {
                    ApplicationArea = all;
                }
                field("Transport Method"; "Transport Method")
                {
                    ApplicationArea = all;
                }
            }
            group("Tax Information")
            {
                CaptionML = ENU = 'Tax Information',
                            ENN = 'Tax Information';
                // field("LC No."; "LC No.")
                // {
                // }
                // field("Form Code"; "Form Code")
                // {
                // }
                // field("Form No."; "Form No.")
                // {
                // }
                // field("Transit Document2"; "Transit Document")
                // {
                // }
                // field("Free Supply"; "Free Supply")
                // {
                // }
                // field("TDS Certificate Receivable"; "TDS Certificate Receivable")
                // {
                // }
                // field("Calc. Inv. Discount (%)"; "Calc. Inv. Discount (%)")
                // {
                // }
                // field("Export or Deemed Export"; "Export or Deemed Export")
                // {
                // }
                // field("VAT Exempted"; "VAT Exempted")
                // {
                // }
                field(Trading; Trading)
                {
                }
                group(GST)
                {
                    CaptionML = ENU = 'GST',
                                ENN = 'GST';
                    field("GST Bill-to State Code"; "GST Bill-to State Code")
                    {
                        ApplicationArea = all;
                    }
                    field("GST Ship-to State Code"; "GST Ship-to State Code")
                    {
                        ApplicationArea = all;
                    }
                    field("Location State Code"; "Location State Code")
                    {
                        ApplicationArea = all;
                    }
                    field("Nature of Supply"; "Nature of Supply")
                    {
                        ApplicationArea = all;
                    }
                    field("GST Customer Type"; "GST Customer Type")
                    {
                        ApplicationArea = all;
                    }
                    field("Ship-to GST Customer Type"; "Ship-to GST Customer Type")
                    {
                        ApplicationArea = all;
                    }
                    field("Invoice Type"; "Invoice Type")
                    {
                        ApplicationArea = all;
                    }
                    field("Bill Of Export No."; "Bill Of Export No.")
                    {
                        ApplicationArea = all;
                    }
                    field("Bill Of Export Date"; "Bill Of Export Date")
                    {
                        ApplicationArea = all;
                    }
                    field("e-Commerce Customer"; "e-Commerce Customer")
                    {
                        ApplicationArea = all;
                    }
                    field("e-Commerce Merchant Id"; "e-Commerce Merchant Id")
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Con001; 9103)
            {
                SubPageLink = "Table ID" = CONST(36),
                              "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("No.");
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(con002; 9082)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = true;
            }
            part(Cont0202; 9084)
            {
                SubPageLink = "No." = FIELD("Sell-to Customer No.");
                Visible = true;
            }
            // part(Cot023; 9087)
            // {
            //     Provider = SalesLines;
            //     SubPageLink = "Document Type" = FIELD("Document Type"),
            //                   "Document No." = FIELD("Document No."),
            //                   "Line No." = FIELD("Line No.");
            //     Visible = false;
            // }
            part(ApprovalFactBox; 9092)
            {
                Visible = false;
            }
            part(Contr005; 9108)
            {
                Provider = SalesLines;
                SubPageLink = "No." = FIELD("No.");
                Visible = false;
            }
            part(WorkflowStatus; 1528)
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Conu76; Links)
            {
                Visible = false;
            }
            systempart(Con67; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                CaptionML = ENU = 'O&rder',
                            ENN = 'O&rder';
                Image = "Order";

                action(Statistics)
                {
                    CaptionML = ENU = 'Statistics',
                                ENN = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        OpenSalesOrderStatistics;
                        SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Card)
                {
                    CaptionML = ENU = 'Card',
                                ENN = 'Card';
                    Image = EditLines;
                    //RunObject = Page 21;              //PCPL-25/241122
                    //RunPageLink = "No." = FIELD("Sell-to Customer No.");  //PCPL-25/241122
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = all;
                }
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = CONST("Blanket Order"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                    ApplicationArea = all;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    CaptionML = ENU = 'Dimensions',
                                ENN = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        ShowDocDim;
                    end;
                }
                action(Approvals)
                {
                    // AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = all;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';


                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RecordId, DATABASE::"Sales Header", "Document Type".AsInteger(), "No.");
                    end;
                }
                // action("St&ructure")
                // {
                //     CaptionML = ENU='St&ructure',
                //                 ENN='St&ructure';
                //     Image = Hierarchy;
                //     RunObject = Page 16305;
                //                     RunPageLink = Type=CONST(Sale),
                //                   Document Type=FIELD(Document Type),
                //                   Document No.=FIELD(No.),
                //                   Structure Code=FIELD(Structure),
                //                   Document Line No.=FILTER(0);
                // }
            }
            group("&Line")
            {
                CaptionML = ENU = '&Line',
                            ENN = '&Line';
                Image = Line;
                // action(Structure)
                // {
                //     CaptionML = ENU = 'Structure',
                //                 ENN = 'Structure';
                //     Image = Hierarchy;

                //     trigger OnAction();
                //     begin
                //         CurrPage.SalesLines.PAGE.ShowStrOrderDetailsPITForm;
                //     end;
                // }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                CaptionML = ENU = 'Approval',
                            ENN = 'Approval';
                action(Approve)
                {
                    CaptionML = ENU = 'Approve',
                                ENN = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    CaptionML = ENU = 'Reject',
                                ENN = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    CaptionML = ENU = 'Delegate',
                                ENN = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    CaptionML = ENU = 'Comments',
                                ENN = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU = 'F&unctions',
                            ENN = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = TableData 19 = R;
                    CaptionML = ENU = 'Calculate &Invoice Discount',
                                ENN = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        ApproveCalcInvDisc;
                        SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator(Contro01158)
                {
                }
                action(CopyDocument)
                {
                    CaptionML = ENU = 'Copy Document',
                                ENN = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RUNMODAL;
                        CLEAR(CopySalesDoc);
                    end;
                }
                separator(Conytol8585)
                {
                }
                action(Release)
                {
                    CaptionML = ENU = 'Re&lease',
                                ENN = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit 414;
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    CaptionML = ENU = 'Re&open',
                                ENN = 'Re&open';
                    Image = ReOpen;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit 414;
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }

            }
            action("Calculate FOB & Unit Price")
            {
                Image = Calculate;
                Promoted = true;
                ApplicationArea = all;

                trigger OnAction();
                begin
                    //PCPL-EXIM
                    CLEAR(Cfactor);
                    IF "Currency Code" <> '' THEN
                        Cfactor := "Currency Factor"
                    ELSE
                        Cfactor := 1;
                    SL.RESET;
                    SL.SETRANGE("Document No.", "No.");
                    SL.SETRANGE("Document Type", "Document Type");
                    IF SL.FINDFIRST THEN
                        REPEAT
                            IF (SL."No." <> '') AND (SL.Type = SL.Type::Item) THEN
                                SL.TESTFIELD(SL."CIF Rate (LCY)");
                            SL."FOB Rate (LCY)" := (SL."CIF Rate (LCY)" - SL."Freight (LCY)" - SL."Insurance (LCY)");
                            SL."Unit Price" := SL."FOB Rate (LCY)" / (1 / Cfactor);
                            SL.VALIDATE("Unit Price");
                            SL.MODIFY;
                        UNTIL SL.NEXT = 0;
                    //PCPL-EXIM
                end;
            }
            action(MakeOrder)
            {
                CaptionML = ENU = 'Make &Order',
                            ENN = 'Make &Order';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction();
                var
                    ApprovalsMgmt: Codeunit 1535;
                begin
                    IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                        CODEUNIT.RUN(CODEUNIT::"Blnkt Sales Ord. to Ord. (Y/N)", Rec);
                end;
            }
            action(Print)
            {
                CaptionML = ENU = '&Print',
                            ENN = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction();
                begin
                    DocPrint.PrintSalesHeader(Rec);
                end;
            }
            group("Request Approval")
            {
                CaptionML = ENU = 'Request Approval',
                            ENN = 'Request Approval';
                action(SendApprovalRequest)
                {
                    CaptionML = ENU = 'Send A&pproval Request',
                                ENN = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        if ApprovalsMgmt.CheckSalesApprovalPossible(Rec) then
                            ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU = 'Cancel Approval Re&quest',
                                ENN = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RecordId);
        CurrPage.ApprovalFactBox.PAGE.UpdateApprovalEntriesFromSourceRecord(RecordId);
    end;

    trigger OnAfterGetRecord();
    begin
        SetControlAppearance;
    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        CheckCreditMaxBeforeInsert;

        "Export Order" := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
            FILTERGROUP(2);
            SETRANGE("Responsibility Center", UserMgt.GetSalesFilter);
            FILTERGROUP(0);
        END;

        SetDocNoVisible;
    end;

    var
        SalesLine: Record 37;
        ChangeExchangeRate: Page 511;
        CopySalesDoc: Report 292;
        DocPrint: Codeunit 229;
        SalesSetup: Record 311;
        UserMgt: Codeunit 5700;
        SalesCalcDiscByType: Codeunit 56;
        DocNoVisible: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        recCust: Record 18;
        SL: Record 37;
        Cfactor: Decimal;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        IF GETFILTER("Sell-to Customer No.") = xRec."Sell-to Customer No." THEN
            IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN
                SETRANGE("Sell-to Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure SalespersonCodeOnAfterValidate();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility: Codeunit 1400;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::"Blanket Order", "No.");
    end;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt: Codeunit 1535;
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

