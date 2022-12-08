tableextension 50167 "Purchase Invoice Header_Exim" extends "Purch. Inv. Header" //OriginalId
{
    fields
    {
        field(50150; "Import Order"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
    }
}