reportextension 50251 WHPickReportExt extends "Pick Instruction"
{
    dataset
    {
        add("Sales Header")
        {
            column(TotalNetWeight; "Total Net Weight")
            {
            }
            column(TotalGrossWeight; "Total Gross Weight")
            {
            }
        }
    }

    requestpage
    {
        layout
        {
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Layouts/WarehousepickExt.rdl';
        }
    }
}