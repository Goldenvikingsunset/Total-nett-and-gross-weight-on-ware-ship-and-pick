reportextension 50250 WHShipmentReportExt extends "Whse. - Shipment"
{
    dataset
    {
        add("Warehouse Shipment Header")
        {
            column(TotalNetWeight; "Total Net Weight")
            {
            }
            column(TotalGrossWeight; "Total Gross Weight")
            {
            }
            column(Final_Package_Weight; "Final Package Weight")
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
            LayoutFile = './Layouts/WarehouseShipmentExt.rdl';
        }
    }
}