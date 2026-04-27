using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Cliente
{
    public partial class BusuqedaProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string busqueda = Session["TerminoBusqueda"] as string;

                if (!string.IsNullOrEmpty(busqueda))
                {
                    // Realizar la búsqueda
                    DatosLoginUser oDatosBusqueda = new DatosLoginUser()
                    {
                        BusquedaProducto = busqueda
                    };

                    ProductoL oProducto = new ProductoL();
                    List<Producto> listProducto = oProducto.MtBusqueda(oDatosBusqueda);

                    // Enlazar los resultados al Repeater
                    if (listProducto != null && listProducto.Count > 0)
                    {
                        rptBusqueda.DataSource = listProducto;
                        rptBusqueda.DataBind();
                        lblSinProductos.Visible = false;
                    }
                    else
                    {
                        lblSinProductos.Visible = true;
                    }
                }
                else
                {
                    // Si no hay búsqueda, mostrar todos los productos o un mensaje
                    lblSinProductos.Visible = true;
                    
                }
                Session.Remove("TerminoBusqueda");
            }

        }
    }
}