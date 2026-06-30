using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Gerente
{
    public partial class ReportesGerentes : System.Web.UI.Page
    {
        private static HaciendaL oHaciL = new HaciendaL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MtCargarSolicitudes();
            }
        }

        public void MtCargarSolicitudes()
        {
            int idGerente = Convert.ToInt32(Session["Id"]);

            List<Reporte> listReporte = oHaciL.MtSolicitudGerenteL(idGerente);
            ddlSolicitudes.DataSource = listReporte;
            ddlSolicitudes.DataTextField = "Titulo";
            ddlSolicitudes.DataValueField = "Id";
            ddlSolicitudes.DataBind();
            ddlSolicitudes.Items.Insert(0, new ListItem("-- Seleccione una Solicitud --", "0"));
        }

        protected void ddlSolicitudes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idSolicitud = ddlSolicitudes.SelectedValue;
            int idSoli = Convert.ToInt32(idSolicitud);

            if (idSoli == 0)
            {
                lblSinSolicitud.Visible = true;
                lblSinRespuesta.Visible = false;
                respuestaSolicitud.Visible = false;
            }
            else
            {
                Reporte oReport = null;

                List<Reporte> listReport = oHaciL.MtRespuestaSolicitudL(idSoli);

                oReport = listReport.FirstOrDefault();

                if (oReport == null)
                {
                    lblSinSolicitud.Visible = false;
                    lblSinRespuesta.Visible = true;
                    respuestaSolicitud.Visible = false;
                }
                else
                {
                    txtTituloRespuesta.Text = oReport.Titulo;
                    txtDescripcionRespuesta.Text = oReport.Descripcion;
                    txtMotivoRespuesta.Text = oReport.Motivo;
                    txtFechaRespuesta.Text = oReport.FechaCreacion.ToShortDateString();

                    lblSinSolicitud.Visible = false;
                    lblSinRespuesta.Visible = false;
                    respuestaSolicitud.Visible = true;
                }
            }
        }

        private void MostrarMensaje(string titulo, string mensaje, string icono)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensaje",
                $"Swal.fire({{ title: '{titulo}', text: '{mensaje}', icon: '{icono}' }});", true);
        }

        protected void btnEnviarSolicitud_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtTitulo.Text) || string.IsNullOrWhiteSpace(txtDescripcion.Text) || string.IsNullOrWhiteSpace(txtMotivo.Text))
            {
                MostrarMensaje("Error de campos", "Se deben de llenar todos los campos para mandar la solicitud", "info");
                lblSinSolicitud.Visible = false;
                lblSinRespuesta.Visible = false;
                respuestaSolicitud.Visible = false;
                return;
            }
            else
            {
                Reporte oReport = new Reporte()
                {
                    Titulo = txtTitulo.Text,
                    Descripcion = txtDescripcion.Text,
                    Motivo = txtMotivo.Text,
                    FechaCreacion = DateTime.Now
                };

                int idGerente = Convert.ToInt32(Session["Id"]);
                Usuario oGerente = new Usuario { Id = idGerente };

                List<Hacienda> listHacienda = oHaciL.MTDueñoHacienda(oGerente);

                Hacienda oHacienda = listHacienda.FirstOrDefault();

                int idHacienda = oHacienda.Id;

                int num = oHaciL.MtCrearSolicitudL(oReport, idGerente, idHacienda);

                if (num == 2)
                {
                    MostrarMensaje("Solicitud Enviada", "La solicitud se envio Correctamente", "success");
                    txtTitulo.Text = "";
                    txtDescripcion.Text = "";
                    txtMotivo.Text = "";
                    lblSinSolicitud.Visible = false;
                    lblSinRespuesta.Visible = false;
                    respuestaSolicitud.Visible = false;
                }
                else
                {
                    MostrarMensaje("Error al enviar la solicitud", "La solicitud no se pudo enviar de manera correcta", "error");
                    txtTitulo.Text = "";
                    txtDescripcion.Text = "";
                    txtMotivo.Text = "";
                    lblSinSolicitud.Visible = false;
                    lblSinRespuesta.Visible = false;
                    respuestaSolicitud.Visible = false;
                    return;
                }
            }


        }
    }
}