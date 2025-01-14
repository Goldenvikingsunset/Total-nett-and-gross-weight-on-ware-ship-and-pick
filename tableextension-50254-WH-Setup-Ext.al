tableextension 50254 "WHSetupExt" extends "Warehouse Setup"
{
    fields
    {
        field(50000; "Weight Variance Threshold %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Weight Variance Threshold %';
            MinValue = 0;
            DecimalPlaces = 2;
            InitValue = 10;
        }
    }
}
