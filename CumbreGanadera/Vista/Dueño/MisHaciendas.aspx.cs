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

                List<Hacienda> oListaHaciendas = oDatosHacienda.MTDueñoHacienda(dueñoId);
                rptHacienda.DataSource = oListaHaciendas;
                rptHacienda.DataBind();

                if (oListaHaciendas != null && oListaHaciendas.Count > 0)
                {
                    lblTotalHaciendas.Text = oListaHaciendas.Count.ToString();
                    divCards.Visible = true;
                    lblSinHaciendas.Visible = false;
                }
                else
                {
                    lblTotalHaciendas.Text = "0";
                    divCards.Visible = false;
                    lblSinHaciendas.Visible = true;
                }
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

