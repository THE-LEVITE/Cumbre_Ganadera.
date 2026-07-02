using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Cliente
{
    public partial class ProductosHacienda : System.Web.UI.Page
    {
        private ProductoL oProductoL = new ProductoL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IdProducto"] = null;

                int IdHacienda = Convert.ToInt32(Session["IdHacienda"]);

                List<Producto> listaProductos = oProductoL.MTListarProductosHacienda(IdHacienda);

                rptProductos.DataSource = listaProductos;
                rptProductos.DataBind();
            }
        }

        protected void btnVerProductos_Command(object sender, CommandEventArgs e)
        {
            Session["IdProducto"] = Convert.ToInt32(e.CommandArgument);

            Response.Redirect("VerProducto.aspx");
        }
    }
}