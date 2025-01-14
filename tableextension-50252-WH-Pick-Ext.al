tableextension 50252 "WHPickExt" extends "Warehouse Activity Header"
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