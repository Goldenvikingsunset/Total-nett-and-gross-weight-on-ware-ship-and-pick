tableextension 50255 "salesheaderExt" extends "Sales Header"
{
    fields
    {
        field(50000; "Total Net Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Total Gross Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}