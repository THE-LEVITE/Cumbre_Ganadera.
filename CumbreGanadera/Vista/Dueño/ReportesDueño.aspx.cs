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
    public partial class ReportesDueño : System.Web.UI.Page
    {
        private static HaciendaL oHaciL = new HaciendaL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MtCargarReportes();
            }
        }

        public void MtCargarReportes()
        {
            int idDueño = Convert.ToInt32(Session["Id"]);

            List<Reporte> listReportes = oHaciL.MtListarReportesL(idDueño);

            if (listReportes.Count > 0)
            {
                gdReportesHacienda.DataSource = listReportes;
                gdReportesHacienda.DataBind();
            }
        }

        protected void gdReportesHacienda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdReportesHacienda.PageIndex = e.NewPageIndex;

            gdReportesHacienda();
        }
    }
}