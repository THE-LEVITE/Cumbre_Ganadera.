using System;
using CumbreGanadera.Logica;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Gerente
{
    public partial class Tareas : System.Web.UI.Page
    {
        TareasL oTareasL = new TareasL();

        protected void Page_Load(object sender, EventArgs e)
        {
            int IdGerente = (int)Session["Id"];
            if (!IsPostBack)
            {
                MtCargarTareas(IdGerente);
            }
        }

        protected void btnAgregarTarea_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearTarea.aspx");
        }

        protected void gvTareas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int idTarea = Convert.ToInt32(e.CommandArgument);

                int resultado = oTareasL.MtEliminarTarea(idTarea);

                if (resultado > 0)
                {
                    int IdGerente = (int)Session["Id"];
                    MtCargarTareas(IdGerente);

                    MostrarMensaje("Eliminado", "La tarea se eliminó correctamente", "success");
                }
                else
                {
                    MostrarMensaje("Error", "No se pudo eliminar la tarea", "error");
                }
            }
        }

        protected void gvTareas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTareas.PageIndex = e.NewPageIndex;
            int IdGerente = (int)Session["Id"];
            MtCargarTareas(IdGerente);
        }

        public void MtCargarTareas(int IdGerente)
        {
            var tareas = oTareasL.MtObtenerTareas(IdGerente);
            gvTareas.DataSource = tareas;
            gvTareas.DataBind();

            if (tareas != null)
            {
                lblTotalTareas.Text = tareas.Count.ToString();
            }
        }

        private void MostrarMensaje(string titulo, string mensaje, string icono)
        {
            string script = $"Swal.fire({{ title: '{titulo}', text: '{mensaje}', icon: '{icono}' }});";
            ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", script, true);
        }

        public string ObtenerBadgeEstado(string estado)
        {
            string clase = "";
            switch (estado.ToLower())
            {
                case "pendiente":
                    clase = "pendiente";
                    break;
                case "en progreso":
                case "enprogreso":
                    clase = "en-progreso";
                    break;
                case "completada":
                    clase = "completada";
                    break;
                default:
                    clase = "pendiente";
                    break;
            }
            return $"<span class='badge-estado {clase}'>{estado}</span>";
        }
    }
}