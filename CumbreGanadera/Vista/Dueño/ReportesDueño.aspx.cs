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

            MtCargarReportes();
        }



        protected void btnEnviarRespuesta_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {
            // Obtener el botón que disparó el evento
            Button btn = (Button)sender;

            // Obtener el ID del reporte desde el CommandArgument
            string idReporte = btn.CommandArgument;

            // Guardar el ID en una variable para usarlo después
            int IdReporte = Convert.ToInt32(idReporte);           
            

            // ABRIR EL MODAL con JavaScript
            string script = @"
                var modalElement = document.getElementById('modalEditar');
                var modal = new bootstrap.Modal(modalElement);
                modal.show();";

            ClientScript.RegisterStartupScript(this.GetType(), "AbrirModalEditar", script, true);


        }
    }
}