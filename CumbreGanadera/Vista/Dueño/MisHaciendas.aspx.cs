using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;

namespace CumbreGanadera.Vista.Dueño
{
    public partial class MisHaciendas1 : System.Web.UI.Page
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
                rptHacinda.DataSource = oListaHaciendas;
                rptHacinda.DataBind();

            }
        }

        protected void rptHacinda_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
                if (e.CommandName == "VerHacienda")
                {
                    string idRegistro = e.CommandArgument.ToString();
                    Session["IdHacienda"] = idRegistro;
                    EjecutarAccion(idRegistro);
                }
        }

        private void EjecutarAccion(string id)
        {
            Response.Redirect("ResumenHacienda.aspx");
        }
    }
}