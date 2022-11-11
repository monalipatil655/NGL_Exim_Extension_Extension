tableextension 50164 Purch_Payable_Exim extends "Purchases & Payables Setup"
{
    fields
    {
        field(50010; "Import Order Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
            Description = 'PCPL-EXIM';

        }
        field(50011; "Blanket Import Order Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
            Description = 'PCPL-EXIM';

        }
    }

}