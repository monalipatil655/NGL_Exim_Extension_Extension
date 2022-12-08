page 50000 "Blanket Export Orders"
{

    CardPageID = "Blanket Export Order";
    PageType = List;
    SourceTable = 36;
    SourceTableView = WHERE("Document Type" = CONST("Blanket Order"),
                            "Export Order" = CONST(true));
    ApplicationArea = all;
    UsageCategory = Lists;
    //
    layout
    {
        area(content)
        {
            repeater(Contro001)
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
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Visible = false;
                    ApplicationArea = all;
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
                }
                field("Currency Code"; "Currency Code")
                {
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(NewPart; 9082)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
                Visible = true;
                ApplicationArea = all;
            }
            part(NewPart01; 9084)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
                Visible = true;
                ApplicationArea = all;
            }
            systempart(control00152; Links)
            {
                Visible = false;
            }
            systempart(control568; Notes)
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
                action(Statistics)
                {
                    CaptionML = ENU = 'Statistics',
                                ENN = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        OpenSalesOrderStatistics;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Sales Comment List";
                    RunPageLink = "Document Type" = CONST("Blanket Order"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    CaptionML = ENU = 'Dimensions',
                                ENN = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                    end;
                }
                action(Approvals)
                {
                    //AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RecordId, DATABASE::"Sales Header", "Document Type".AsInteger(), "No.");
                        approvalmgt.RunWorkflowEntriesPage(RecordId, DATABASE::"Sales Header", "Document Type", "No.");  //PCPL-25/081222
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU = 'F&unctions',
                            ENN = 'F&unctions';
                Image = "Action";
                separator(Cont2585)
                {
                }
                action("Re&lease")
                {
                    CaptionML = ENU = 'Re&lease',
                                ENN = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit 414;
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    CaptionML = ENU = 'Re&open',
                                ENN = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit 414;
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            action("Make &Order")
            {
                CaptionML = ENU = 'Make &Order',
                            ENN = 'Make &Order';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;

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

                trigger OnAction();
                begin
                    DocPrint.PrintSalesHeader(Rec);
                end;
            }
            group("Request Approval")
            {
                CaptionML = ENU = 'Request Approval',
                            ENN = 'Request Approval';
                // action(SendApprovalRequest)
                // {
                //     CaptionML = ENU = 'Send A&pproval Request',
                //                 ENN = 'Send A&pproval Request';
                //     Enabled = NOT OpenApprovalEntriesExist;
                //     Image = SendApprovalRequest;

                //     trigger OnAction();
                //     var
                //         ApprovalsMgmt: Codeunit 1535;
                //     begin
                //         IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
                //             ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                //     end;
                // }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU = 'Cancel Approval Re&quest',
                                ENN = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;

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
        SetControlAppearance;
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        DocPrint: Codeunit 229;
        OpenApprovalEntriesExist: Boolean;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt: Codeunit 1535;
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

