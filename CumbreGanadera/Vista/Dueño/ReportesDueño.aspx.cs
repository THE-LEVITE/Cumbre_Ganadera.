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
                int dueñoId = Convert.ToInt32(Session["Id"].ToString());

                List<Hacienda> oListaHaciendas = oHaciL.MTDueñoHacienda(dueñoId);
                ddlHaciendas.DataSource = oListaHaciendas;
                ddlHaciendas.DataTextField = "NombreHacienda";
                ddlHaciendas.DataValueField = "Id";
                ddlHaciendas.DataBind();
                ddlHaciendas.Items.Insert(0, new ListItem("-- Seleccione una Hacienda --", "0"));

                MtCargarReportes();
            }
        }

        public void MtCargarReportes()
        {
            int idHacienda = Convert.ToInt32(Session["IdHacienda"]);
            if (idHacienda == 0)
            {
                tablaReportes.Visible = false;
                lblSinHacienda.Visible = true;
                lblSinSolicitudes.Visible = false;
            }
            else
            {
                List<Reporte> listReportes = oHaciL.MtListarReportesL(idHacienda);

                if (listReportes.Count > 0)
                {
                    gdReportesHacienda.DataSource = listReportes;
                    gdReportesHacienda.DataBind();
                    tablaReportes.Visible = true;
                    lblSinHacienda.Visible = false;
                    lblSinSolicitudes.Visible = false;
                }
                else if (listReportes.Count == 0)
                {
                    tablaReportes.Visible = false;
                    lblSinHacienda.Visible = false;
                    lblSinSolicitudes.Visible = true;
                }
            }

        }

        protected void gdReportesHacienda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdReportesHacienda.PageIndex = e.NewPageIndex;

            MtCargarReportes();
        }



        protected void btnEnviarRespuesta_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitulo.Value) || string.IsNullOrWhiteSpace(txtDescripcion.Value) || string.IsNullOrWhiteSpace(txtMotivo.Value))
            {
                MostrarMensaje("Error de campos", "Se deben de llenar todos los campos para mandar la respuesta", "info");
                return;
            }
            else
            {
                Reporte oReport = new Reporte()
                {
                    Titulo = txtTitulo.Value,
                    Descripcion = txtDescripcion.Value,
                    Motivo = txtMotivo.Value,
                    FechaCreacion = DateTime.Now
                };

                int idDueño = Convert.ToInt32(Session["Id"]);
                int IdReporte = Convert.ToInt32(Session["idReporte"]);
                int idHacienda = Convert.ToInt32(Session["IdHacienda"]);

                int num = oHaciL.MtResponderSolicutudL(oReport, idDueño, IdReporte, idHacienda);

                if (num == 2)
                {
                    bool actu = oHaciL.MtActualizarSolicitudL(IdReporte);
                    if (actu)
                    {
                        MostrarMensaje("Respuesta Enviada", "La respuesta de la solicitud se envio correctamente", "success");
                        txtTitulo.Value = "";
                        txtDescripcion.Value = "";
                        txtMotivo.Value = "";
                        MtCargarReportes();
                    }
                    else
                    {
                        MostrarMensaje("Error al Enviar", "La respuesta de la solicitud no se puedo enviar correctamente", "error");
                        return;
                    }
                }
            }

        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            string idReporte = btn.CommandArgument;

            int IdReporte = Convert.ToInt32(idReporte);

            Session["idReporte"] = IdReporte;

            string Nombregerente = oHaciL.MtTraerGerenteL(IdReporte);

            lblGerente.Text = Nombregerente;

            string script = @"
         var modalElement = document.getElementById('modalResponder');
         var modal = new bootstrap.Modal(modalElement);
         modal.show();";

            ClientScript.RegisterStartupScript(this.GetType(), "AbrirModalRespuesta", script, true);


        }

        protected void ddlHaciendas_SelectedIndexChanged(object sender, EventArgs e)
        {

            string idHacienda = ddlHaciendas.SelectedValue;
            Session["IdHacienda"] = Convert.ToInt32(idHacienda);

            MtCargarReportes();

        }


        private void MostrarMensaje(string titulo, string mensaje, string icono)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensaje",
                $"Swal.fire({{ title: '{titulo}', text: '{mensaje}', icon: '{icono}' }});", true);
        }
    }
}