pageextension 50201 "Warehouse Receipt_Exim" extends "Warehouse Receipt" //OriginalId
{
    layout
    {
        addafter("Vendor Shipment No.")
        {
            field("Vendor Shipment Date/Bol"; "Vendor Shipment Date/Bol")
            {
                ApplicationArea = All;
            }

        }
    }


}