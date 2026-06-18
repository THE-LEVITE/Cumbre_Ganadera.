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
    public partial class ResumenHacienda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HaciendaL oHaciendaL = new HaciendaL();

                int HaciendaId = Convert.ToInt32(Session["IdHacienda"]);

                List<Hacienda> cantidades = oHaciendaL.MTCantidades(HaciendaId);

                if (cantidades != null)
                {
                    CantidadGerentes.InnerText = cantidades[0].CantidadGerentes.ToString();
                    CantidadTrabajdores.InnerText = cantidades[0].CantidadTrabajadores.ToString();
                    CantidadAreas.InnerText = cantidades[0].CantidadAreas.ToString();
                    NombreHacienda.InnerText = cantidades[0].NombreHacienda.ToString();
                }
            }

            if (!IsPostBack)
            {
                UsuarioL oHaciendaL = new UsuarioL();

                int IdHacienda = Convert.ToInt32(Session["IdHacienda"]);

                List<Usuario> gerentes = oHaciendaL.MTListaGerentes(IdHacienda);

                if (gerentes != null)
                {
                    gdGerentes.DataSource = gerentes;
                    gdGerentes.DataBind();
                }
            }
        }

        protected void btnVerHacienda_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistroGerente.aspx");
        }
    }
}