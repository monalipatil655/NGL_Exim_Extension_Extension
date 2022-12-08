tableextension 50168 "Purchase Receipt Header_Exim" extends "Purch. Rcpt. Header" //OriginalId
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