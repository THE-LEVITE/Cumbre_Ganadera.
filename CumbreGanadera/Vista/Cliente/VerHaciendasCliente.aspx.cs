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
    public partial class VerHaciendasCliente : System.Web.UI.Page
    {
        private HaciendaL oHaciedaL = new HaciendaL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IdHaienda"] = null;

                List<Hacienda> oHaciedas = oHaciedaL.MTListarTodasLasHaciendas();

                rptHaciendas.DataSource = oHaciedas;
                rptHaciendas.DataBind();

            }
        }

        protected void btnVerProductos_Command(object sender, CommandEventArgs e)
        {
            Session["IdHacienda"] = Convert.ToInt32(e.CommandArgument);

            Response.Redirect("ProductosHacienda.aspx");
        }
    }
}