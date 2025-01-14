pageextension 50251 "WHPickExt" extends "Warehouse Pick"
{
    layout
    {
        addlast(General)
        {
            field("Total Net Weight"; Rec."Total Net Weight")
            {
                ApplicationArea = Warehouse;
                ToolTip = 'Shows the total net weight of all items in the pick';
            }
            field("Total Gross Weight"; Rec."Total Gross Weight")
            {
                ApplicationArea = Warehouse;
                ToolTip = 'Shows the total gross weight of all items in the pick';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalculatePickWeights();
    end;

    local procedure CalculatePickWeights()
    var
        WhsePickLine: Record "Warehouse Activity Line";
        Item: Record Item;
    begin
        Rec."Total Net Weight" := 0;
        Rec."Total Gross Weight" := 0;

        WhsePickLine.SetRange("No.", Rec."No.");
        WhsePickLine.SetRange("Activity Type", WhsePickLine."Activity Type"::Pick);
        if WhsePickLine.FindSet() then
            repeat
                if Item.Get(WhsePickLine."Item No.") then begin
                    Rec."Total Net Weight" += Item."Net Weight" * WhsePickLine.Quantity;
                    Rec."Total Gross Weight" += Item."Gross Weight" * WhsePickLine.Quantity;
                end;
            until WhsePickLine.Next() = 0;

        Rec.Modify();
    end;
}

