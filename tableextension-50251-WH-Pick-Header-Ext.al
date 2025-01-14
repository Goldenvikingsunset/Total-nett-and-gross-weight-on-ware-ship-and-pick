tableextension 50251 "WHPickHeaderExt" extends "Whse. Internal Pick Header"
{
    fields
    {
        field(50100; "Total Net Weight"; Decimal)
        {
            Caption = 'Total Net Weight';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50101; "Total Gross Weight"; Decimal)
        {
            Caption = 'Total Gross Weight';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }
}
