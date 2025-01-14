tableextension 50253 "WHShipExt" extends "Warehouse Shipment Header"
{
    fields
    {
        field(50000; "Total Net Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Calculated Total Net Weight';
        }
        field(50001; "Total Gross Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Calculated Total Gross Weight';
        }
        field(50002; "Final Package Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Final Package Weight';

            trigger OnValidate()
            var
                WarehouseSetup: Record "Warehouse Setup";
            begin
                WarehouseSetup.Get();
                if Abs("Final Package Weight" - "Total Gross Weight") > ("Total Gross Weight" * (WarehouseSetup."Weight Variance Threshold %" / 100)) then
                    Message('Warning: Final package weight differs by more than %1% from calculated gross weight.', WarehouseSetup."Weight Variance Threshold %");
            end;
        }
    }
}
