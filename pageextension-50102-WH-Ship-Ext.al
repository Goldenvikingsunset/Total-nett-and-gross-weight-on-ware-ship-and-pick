pageextension 50254 "WHShipExt" extends "Warehouse Shipment"
{
    layout
    {
        addlast(General)
        {
            field("Total Net Weight"; Rec."Total Net Weight")
            {
                ApplicationArea = Warehouse;
                Editable = false;
                ToolTip = 'Shows the calculated total net weight of all items in the shipment';
            }
            field("Total Gross Weight"; Rec."Total Gross Weight")
            {
                ApplicationArea = Warehouse;
                Editable = false;
                ToolTip = 'Shows the calculated total gross weight of all items in the shipment';
            }
            field("Final Package Weight"; Rec."Final Package Weight")
            {
                ApplicationArea = Warehouse;
                ToolTip = 'Enter the actual measured weight of the complete package including pallets';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalculateShipmentWeights();
    end;

    local procedure CalculateShipmentWeights()
    var
        WhseShipmentLine: Record "Warehouse Shipment Line";
        Item: Record Item;
    begin
        Rec."Total Net Weight" := 0;
        Rec."Total Gross Weight" := 0;

        WhseShipmentLine.SetRange("No.", Rec."No.");
        if WhseShipmentLine.FindSet() then
            repeat
                if Item.Get(WhseShipmentLine."Item No.") then begin
                    Rec."Total Net Weight" += Item."Net Weight" * WhseShipmentLine.Quantity;
                    Rec."Total Gross Weight" += Item."Gross Weight" * WhseShipmentLine.Quantity;
                end;
            until WhseShipmentLine.Next() = 0;

        Rec.Modify();
    end;
}
