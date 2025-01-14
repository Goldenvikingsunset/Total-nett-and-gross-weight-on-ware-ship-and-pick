pageextension 50255 "WHSetupExt" extends "Warehouse Setup"
{
    layout
    {
        addlast(General)
        {
            field("Weight Variance Threshold %"; Rec."Weight Variance Threshold %")
            {
                ApplicationArea = Warehouse;
                ToolTip = 'Specifies the percentage threshold for weight variance warnings in warehouse shipments';
            }
        }
    }
}
