page 50172 "Packing List Package Details"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SourceTable = 50055;//Table33001048;

    layout
    {
        area(content)
        {
            repeater("--")
            {
                field("No. Of Packages"; "No. Of Packages")
                {
                    ApplicationArea = All;
                }
                field("From Package No."; "From Package No.")
                {
                    ApplicationArea = All;
                }
                field("To Package No."; "To Package No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        PackageListPackageLocal: Record 50055;//"33001048";
                    begin
                        PackageListPackageLocal.RESET;
                        PackageListPackageLocal.SETCURRENTKEY("Item No.");
                        PackageListPackageLocal.SETRANGE("Item No.", "Item No.");
                        IF PackageListPackageLocal.FINDLAST THEN BEGIN
                            "Net Wght. per Case" := PackageListPackageLocal."Net Wght. per Case";
                            "Net Weight Per PCS" := PackageListPackageLocal."Net Weight Per PCS";
                            "Qty per Case" := PackageListPackageLocal."Qty per Case";
                            "Gross Wght. per Case" := PackageListPackageLocal."Gross Wght. per Case";
                            Length := PackageListPackageLocal.Length;
                            Height := PackageListPackageLocal.Height;
                            Width := PackageListPackageLocal.Width;
                            Volume := PackageListPackageLocal.Volume;

                            recPackageDetails.MODIFY;
                        END;
                    end;
                }
                field("Item Description"; "Item Description")
                {
                    ApplicationArea = All;
                }
                field("Total Quantity"; "Total Quantity")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Lot Number"; "Lot Number")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field("Weight UOM"; "Weight UOM")
                {
                    ApplicationArea = All;
                }
                field("Manufacturing Date"; "Manufacturing Date")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; "Expiry Date")
                {
                    ApplicationArea = All;
                }
                field("Net Wght. per Case"; "Net Wght. per Case")
                {
                    DecimalPlaces = 2 : 5;
                    ApplicationArea = All;
                }
                field("Tare Weight Per Case"; "Tare Weight Per Case")
                {
                }
                field("Gross Wght. per Case"; "Gross Wght. per Case")
                {
                    DecimalPlaces = 2 : 5;
                    ApplicationArea = All;
                }
                field("Net Weight Per PCS"; "Net Weight Per PCS")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Kind of Packing"; "Kind of Packing")
                {
                    ApplicationArea = All;
                }
                field("Kindof Package"; recPackageDetails."Kind of Packing")
                {
                    ApplicationArea = All;
                    Caption = 'Kindof Package';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        recPackageDetails.RESET;
        recPackageDetails.SETRANGE("Packing List No.", "Packing List No.");
        IF recPackageDetails.FIND('+') THEN
            "From Package No." := recPackageDetails."To Package No." + 1
        ELSE
            "From Package No." := 1;
    end;

    trigger OnOpenPage()
    begin
        recPackingList.SETRANGE(recPackingList."No.", "Packing List No.");
        IF recPackingList.FIND('-') THEN
            IF (recPackingList.Status = recPackingList.Status::Shipped) THEN
                CurrPage.EDITABLE(FALSE)
            ELSE
                CurrPage.EDITABLE(TRUE);
    end;

    var
        recPackageDetails: Record 50055;//"33001048";
        recPackingList: Record 50054;//"33001046";
}

