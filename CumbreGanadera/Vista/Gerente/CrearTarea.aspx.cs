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
    public partial class CrearTarea : System.Web.UI.Page
    {
        int IdGerente = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            IdGerente = (int)Session["Id"];
            if (!IsPostBack)
            {
                TareasL oTareaL = new TareasL();

                List<Sector> listaSectores = oTareaL.MtObtenerSectores(IdGerente);
                ddlSectores.DataSource = listaSectores;
                ddlSectores.DataTextField = "Nombre";
                ddlSectores.DataValueField = "Id";
                ddlSectores.DataBind();
                ddlSectores.Items.Insert(0, new ListItem("-- Seleccione un sector --", "0"));

                ddlTrabajadores.DataSource = oTareaL.MtobtenerTrabajadores(IdGerente);
                ddlTrabajadores.DataTextField = "Nombre";
                ddlTrabajadores.DataValueField = "Id";
                ddlTrabajadores.DataBind();
                ddlTrabajadores.Items.Insert(0, new ListItem("-- Seleccione un trabajador --", "0"));
            }
        }

        protected void btnGuargarTarea_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitulo.Text))
            {
                MostrarMensaje("Error", "El título es obligatorio", "error");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtDescripcion.Text))
            {
                MostrarMensaje("Error", "La descripción es obligatoria", "error");
                return;
            }

            if (ddlSectores.SelectedValue == "0")
            {
                MostrarMensaje("Error", "Debe seleccionar un sector", "error");
                return;
            }

            if (ddlTrabajadores.SelectedValue == "0")
            {
                MostrarMensaje("Error", "Debe seleccionar un trabajador", "error");
                return;
            }
            TareasM oTareasM = new TareasM();

            oTareasM.Titulo = txtTitulo.Text.Trim();
            oTareasM.Descripcion = txtDescripcion.Text.Trim();
            oTareasM.Estado = rbActivo.Checked ? "Activo" : "Inactivo";
            oTareasM.FechaAsignacion = DateTime.Now;
            oTareasM.IdGerente = IdGerente;

            oTareasM.DatosUsuario = new Usuario()
            {
                Id = Convert.ToInt32(ddlTrabajadores.SelectedValue)
            };

            oTareasM.Sector = new Sector()
            {
                Id = Convert.ToInt32(ddlSectores.SelectedValue)
            };

            int idTrabajador = Convert.ToInt32(ddlTrabajadores.SelectedValue);

            TareasL oTareasl = new TareasL();
            int Verificacion = oTareasl.MtRegistrarTareas(oTareasM, idTrabajador);

            if (Verificacion > 0)
            {
                MostrarMensaje("¡Éxito!", "La tarea se registró correctamente", "success");

                txtTitulo.Text = "";
                txtDescripcion.Text = "";
                ddlSectores.SelectedIndex = 0;
                ddlTrabajadores.SelectedIndex = 0;
                rbActivo.Checked = true;
            }
            else
            {
                MostrarMensaje("¡Error!", "La tarea no se pudo registrar", "error");
            }
        }

        private void MostrarMensaje(string titulo, string mensaje, string icono)
        {
            string script = $"Swal.fire({{ title: '{titulo}', text: '{mensaje}', icon: '{icono}' }});";
            ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", script, true);
        }
    }
}