using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Dueño
{
    public partial class MisHaciendas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IdHacienda"] = null;

            if (!IsPostBack)
            {
                HaciendaL oDatosHacienda = new HaciendaL();

                int dueñoId = Convert.ToInt32(Session["Id"].ToString());
                Usuario oDueño = new Usuario { Id = dueñoId };

                List<Hacienda> oListaHaciendas = oDatosHacienda.MTDueñoHacienda(oDueño);
                rptHacienda.DataSource = oListaHaciendas;
                rptHacienda.DataBind();
            }
        }
       
        private void EjecutarAccion(string id)
        {
            Response.Redirect("ResumenHacienda.aspx");
        }

        protected void rptHacienda_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "VerHacienda")
            {
                string idRegistro = e.CommandArgument.ToString();
                Session["IdHacienda"] = idRegistro;
                EjecutarAccion(idRegistro);
            }
        }
    }
}