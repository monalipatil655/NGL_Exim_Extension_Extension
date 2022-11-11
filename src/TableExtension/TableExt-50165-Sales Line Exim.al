tableextension 50165 Sales_Line_Exim extends "Sales Line"
{
    fields
    {
        field(50120; "Customer Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50121; "Freight (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';

        }
        field(50122; "Insurance (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50123; "CIF Rate (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';

        }
        field(50124; "FOB Rate (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';
        }
        field(50125; "Calculate Unit Price"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-EXIM';

        }
    }

    var
        myInt: Integer;
}