tableextension 50163 Sale_Receivalble_Exim extends "Sales & Receivables Setup"
{
    fields
    {
        field(50010; "Export Order Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
            Description = 'PCPL-EXIM';

        }
        field(50011; "Blanket Export Order Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
            Description = 'PCPL-EXIM';

        }
    }

}