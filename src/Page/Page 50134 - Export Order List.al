page 50074 "Export Order List"
{
    // version NAVW19.00.00.45778,PCPL-EXIM

    // CaptionML = ENU = 'Export Order List',
    //             ENN = 'Export Order List';
    CardPageID = "Export Order";
    //Editable = false;
    PageType = List;
    SourceTable = 36;
    SourceTableView = WHERE("Document Type" = CONST(Order),
                            "Export Order" = CONST(True));
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control001)
            {
                field("No."; "No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = all;
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Sell-to Country/Region Code"; "Sell-to Country/Region Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    Visible = false;
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Visible = false;
                }
                field("Bill-to Country/Region Code"; "Bill-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                    Visible = false;
                }
                field("Ship-to Code"; "Ship-to Code")
                {
                    Visible = false;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    Visible = false;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    Visible = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {
                    Visible = true;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    Visible = false;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; "Currency Code")
                {
                    Visible = false;
                }
                field("Document Date"; "Document Date")
                {
                    Visible = false;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    Visible = false;
                }
                field("Campaign No."; "Campaign No.")
                {
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Visible = false;
                }
                field("Due Date"; "Due Date")
                {
                    Visible = false;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    Visible = false;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    Visible = false;
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    Visible = false;
                }
                field("Shipping Advice"; "Shipping Advice")
                {
                    Visible = false;
                }
                field("Completely Shipped"; "Completely Shipped")
                {
                    ApplicationArea = all;
                }
                field("Job Queue Status"; "Job Queue Status")
                {
                    Visible = JobQueueActive;
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Con789; 9082)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
                Visible = true;
                ApplicationArea = all;
            }
            part(Control677; 9084)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
                Visible = true;
                ApplicationArea = all;
            }
            part(IncomingDocAttachFactBox; 193)
            {
                ShowFilter = false;
                Visible = false;

            }
            systempart(Control556; Links)
            {
                Visible = false;
            }
            systempart(Control789; Notes)
            {
                Visible = true;
                ApplicationArea = all;
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
                    end;
                }
                action("A&pprovals")
                {
                    CaptionML = ENU = 'A&pprovals',
                                ENN = 'A&pprovals';
                    Image = Approvals;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //ApprovalEntries.Setfilters(DATABASE::"Sales Header", "Document Type", "No.");
                        ApprovalEntries.SetRecordFilters(DATABASE::"Sales Header", "Document Type", "No.");  //PCPL-25/081222
                        ApprovalEntries.RUN;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                    ApplicationArea = all;
                }

            }
            group(Documents)
            {
                CaptionML = ENU = 'Documents',
                            ENN = 'Documents';
                Image = Documents;
                action("S&hipments")
                {
                    CaptionML = ENU = 'S&hipments',
                                ENN = 'S&hipments';
                    Image = Shipment;
                    RunObject = Page "Posted Sales Shipments";
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                    ApplicationArea = all;
                }
                action(PostedSalesInvoices)
                {
                    CaptionML = ENU = 'Invoices',
                                ENN = 'Invoices';
                    Image = Invoice;
                    RunObject = Page "Posted Sales Invoices";
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                    ApplicationArea = all;
                }
                action(PostedSalesPrepmtInvoices)
                {
                    CaptionML = ENU = 'Prepa&yment Invoices',
                                ENN = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page "Posted Sales Invoices";
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                    ApplicationArea = all;
                }
                action("Prepayment Credi&t Memos")
                {
                    CaptionML = ENU = 'Prepayment Credi&t Memos',
                                ENN = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page "Posted Sales Credit Memos";
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                    ApplicationArea = all;
                }
            }
            group(Warehouse1)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                Image = Warehouse;
                action("Whse. Shipment Lines")
                {
                    CaptionML = ENU = 'Whse. Shipment Lines',
                                ENN = 'Whse. Shipment Lines';
                    ApplicationArea = all;
                    Image = ShipmentLines;
                    RunObject = Page "Whse. Shipment Lines";
                    RunPageLink = "Source Type" = CONST(37),
                                  "Source Subtype" = FIELD("Document Type"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    CaptionML = ENU = 'In&vt. Put-away/Pick Lines',
                                ENN = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    ApplicationArea = all;
                    RunObject = Page "Warehouse Activity List";
                    RunPageLink = "Source Document" = CONST("Sales Order"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Document", "Source No.", "Location Code");
                }
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU = 'Dynamics CRM',
                            ENN = 'Dynamics CRM';
                Visible = CRMIntegrationEnabled;

                action(CRMGoToSalesOrderListInNAV)
                {
                    CaptionML = ENU = 'Sales Order List',
                                ENN = 'Sales Order List';
                    Enabled = CRMIntegrationEnabled;
                    Image = "Order";
                    ToolTipML = ENU = 'Open the Dynamics CRM Sales Order List page in NAV',
                                ENN = 'Open the Dynamics CRM Sales Order List page in NAV';
                    Visible = CRMIntegrationEnabled;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        CRMSalesorder: Record 5353;
                    begin
                        PAGE.RUN(PAGE::"CRM Sales Order List", CRMSalesorder);
                    end;
                }
            }
        }
        area(processing)
        {
            group(Release1)
            {
                CaptionML = ENU = 'Release',
                            ENN = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    CaptionML = ENU = 'Re&lease',
                                ENN = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
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
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit 414;
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU = 'F&unctions',
                            ENN = 'F&unctions';
                Image = "Action";
                action("Pla&nning")
                {
                    CaptionML = ENU = 'Pla&nning',
                                ENN = 'Pla&nning';
                    Image = Planning;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        SalesOrderPlanningForm: Page 99000883;
                    begin
                        SalesOrderPlanningForm.SetSalesOrder("No.");
                        SalesOrderPlanningForm.RUNMODAL;
                    end;
                }
                action("Order &Promising")
                {
                    AccessByPermission = TableData 99000880 = R;
                    CaptionML = ENU = 'Order &Promising',
                                ENN = 'Order &Promising';
                    Image = OrderPromising;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        OrderPromisingLine: Record 99000880 temporary;
                    begin
                        OrderPromisingLine.SETRANGE("Source Type", "Document Type");
                        OrderPromisingLine.SETRANGE("Source ID", "No.");
                        PAGE.RUNMODAL(PAGE::"Order Promising Lines", OrderPromisingLine);
                    end;
                }
                action("Send IC Sales Order Cnfmn.")
                {
                    AccessByPermission = TableData 410 = R;
                    CaptionML = ENU = 'Send IC Sales Order Cnfmn.',
                                ENN = 'Send IC Sales Order Cnfmn.';
                    Image = IntercompanyOrder;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        ICInOutboxMgt: Codeunit 427;
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                            ICInOutboxMgt.SendSalesDoc(Rec, FALSE);
                    end;
                }
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
                        // IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
                        //     ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
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
            group(Warehouse)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                Image = Warehouse;
                action("Create Inventor&y Put-away/Pick")
                {
                    AccessByPermission = TableData 7342 = R;
                    CaptionML = ENU = 'Create Inventor&y Put-away/Pick',
                                ENN = 'Create Inventor&y Put-away/Pick';
                    Ellipsis = true;
                    Image = CreatePutawayPick;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;

                        IF NOT FIND('=><') THEN
                            INIT;
                    end;
                }
                action("Create &Whse. Shipment")
                {
                    AccessByPermission = TableData 7320 = R;
                    CaptionML = ENU = 'Create &Whse. Shipment',
                                ENN = 'Create &Whse. Shipment';
                    Image = NewShipment;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        GetSourceDocOutbound: Codeunit 5752;
                    begin
                        GetSourceDocOutbound.CreateFromSalesOrder(Rec);

                        IF NOT FIND('=><') THEN
                            INIT;
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU = 'P&osting',
                            ENN = 'P&osting';
                Image = Post;
                action(Post)
                {
                    CaptionML = ENU = 'P&ost',
                                ENN = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU = 'Post and &Print',
                                ENN = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    ApplicationArea = all;



                    trigger OnAction();
                    begin
                        SendToPosting(CODEUNIT::"Sales-Post + Print");
                    end;
                }
                action("Post and Email")
                {
                    CaptionML = ENU = 'Post and Email',
                                ENN = 'Post and Email';
                    Ellipsis = true;
                    Image = PostMail;
                    ApplicationArea = all;

                    trigger OnAction();
                    var
                        SalesPostPrint: Codeunit 82;
                    begin
                        SalesPostPrint.PostAndEmail(Rec);
                    end;
                }
                action("Test Report")
                {
                    CaptionML = ENU = 'Test Report',
                                ENN = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("Post &Batch")
                {
                    CaptionML = ENU = 'Post &Batch',
                                ENN = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders", TRUE, TRUE, Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Remove From Job Queue")
                {
                    CaptionML = ENU = 'Remove From Job Queue',
                                ENN = 'Remove From Job Queue';
                    Image = RemoveLine;
                    Visible = JobQueueActive;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                action("Preview Posting")
                {
                    CaptionML = ENU = 'Preview Posting',
                                ENN = 'Preview Posting';
                    Image = ViewPostedOrder;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        ShowPreview
                    end;
                }
            }
            group("&Print")
            {
                CaptionML = ENU = '&Print',
                            ENN = '&Print';
                Image = Print;
                action("Work Order")
                {
                    CaptionML = ENU = 'Work Order',
                                ENN = 'Work Order';
                    Ellipsis = true;
                    Image = Print;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Work Order");
                    end;
                }
                action("Pick Instruction")
                {
                    CaptionML = ENU = 'Pick Instruction',
                                ENN = 'Pick Instruction';
                    Image = Print;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");
                    end;
                }
            }
            group("&Order Confirmation")
            {
                CaptionML = ENU = '&Order Confirmation',
                            ENN = '&Order Confirmation';
                Image = Email;
                action("Email Confirmation")
                {
                    CaptionML = ENU = 'Email Confirmation',
                                ENN = 'Email Confirmation';
                    Ellipsis = true;
                    Image = Email;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        DocPrint.EmailSalesHeader(Rec);
                    end;
                }
                action("Print Confirmation")
                {
                    CaptionML = ENU = 'Print Confirmation',
                                ENN = 'Print Confirmation';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Sales Reservation Avail.")
            {
                CaptionML = ENU = 'Sales Reservation Avail.',
                            ENN = 'Sales Reservation Avail.';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 209;
                ApplicationArea = all;
            }
            action("Commercial Invoice")
            {
                Caption = 'Commercial Invoice';
                ApplicationArea = all;

                trigger OnAction();
                begin

                    RecSalesOrder.RESET;
                    RecSalesOrder.SETRANGE(RecSalesOrder."No.", "No.");
                    IF RecSalesOrder.FINDFIRST THEN
                        IF Status <> Status::Released THEN
                            ERROR('Status Must Be Released');
                    REPORT.RUNMODAL(50012, TRUE, TRUE, Rec);
                end;
            }
            action("Packing List")
            {
                Caption = 'Packing List';
                ApplicationArea = all;

                trigger OnAction();
                begin
                    RecSalesOrder.RESET;
                    RecSalesOrder.SETRANGE(RecSalesOrder."No.", "No.");
                    IF RecSalesOrder.FINDFIRST THEN
                        IF Status <> Status::Released THEN
                            ERROR('Status Must Be Released');
                    REPORT.RUNMODAL(50013, TRUE, TRUE, Rec);
                end;
            }
            action("Shipping Instruction")
            {
                Caption = 'Shipping Instruction';
                ApplicationArea = all;

                trigger OnAction();
                begin
                    RecSalesOrder.RESET;
                    RecSalesOrder.SETRANGE(RecSalesOrder."No.", "No.");
                    IF RecSalesOrder.FINDFIRST THEN
                        IF Status <> Status::Released THEN
                            ERROR('Status Must Be Released');
                    REPORT.RUNMODAL(50014, TRUE, TRUE, Rec);
                end;
            }
            action("Bill of Landing")
            {
                Caption = 'Bill of Landing';
                ApplicationArea = all;

                trigger OnAction();
                begin
                    RecSalesOrder.RESET;
                    RecSalesOrder.SETRANGE(RecSalesOrder."No.", "No.");
                    IF RecSalesOrder.FINDFIRST THEN
                        IF Status <> Status::Released THEN
                            ERROR('Status Must Be Released');
                    REPORT.RUNMODAL(50015, TRUE, TRUE, Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlVisibility;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnOpenPage();
    var
        SalesSetup: Record 311;
        CRMIntegrationManagement: Codeunit 5330;
    begin
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
            FILTERGROUP(2);
            SETRANGE("Responsibility Center", UserMgt.GetSalesFilter);
            FILTERGROUP(0);
        END;

        SETRANGE("Date Filter", 0D, WORKDATE - 1);

        JobQueueActive := SalesSetup.JobQueueActive;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;


    end;

    var
        DocPrint: Codeunit 229;
        ReportPrint: Codeunit 228;
        UserMgt: Codeunit 5700;
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        [InDataSet]
        JobQueueActive: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CRMIntegrationEnabled: Boolean;
        RecSalesOrder: Record 36;

    procedure ShowPreview();
    var
        SalesPostYesNo: Codeunit 81;
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure SetControlVisibility();
    var
        ApprovalsMgmt: Codeunit 1535;
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;


}

