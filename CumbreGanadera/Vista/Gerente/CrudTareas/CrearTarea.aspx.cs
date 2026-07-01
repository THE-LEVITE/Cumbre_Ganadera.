using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Gerente.CrudTareas
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
                ddlTrabajadores.DataSource = listaSectores;
                ddlTrabajadores.DataTextField = "Nombre";
                ddlTrabajadores.DataValueField = "Id";
                ddlTrabajadores.DataBind();

                ddlTrabajadores.DataSource = oTareaL.MtobtenerTrabajadores(IdGerente);
                ddlTrabajadores.DataTextField = "Nombre";
                ddlTrabajadores.DataValueField = "Id";
                ddlTrabajadores.DataBind();
            }
        }

        protected void btnGuargarTarea_Click(object sender, EventArgs e)
        {
            TareasM oTareasM = new TareasM();

            oTareasM.Titulo = txtTitulo.Text;
            oTareasM.Descripcion = txtDescripcion.Text;
            oTareasM.Estado = rbEstado.Checked ? "Activo" : "Inactivo";
            oTareasM.FechaAsignacion = DateTime.Now;
            oTareasM.IdGerente = IdGerente;
            oTareasM.DatosUsuario = new Usuario()
            {
                Id = Convert.ToInt32(ddlTrabajadores.SelectedValue)
            };
            oTareasM.Sector = new Sector()
            {
                Id = Convert.ToInt32(ddlSectores.SelectedValue),
            };
            
            

            TareasL oTareasl = new TareasL();
            int Verificacion = oTareasl.MtRegistrarTareas(oTareasM);

            if (Verificacion > 0)
            {
                string mensaje = @"Swal.fire({
                icon: 'success',
                title: '¡Exito!',
                text: 'Tarea Registrada',
                timer: 2000,
                showConfirmButton: false
                });";

                ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
            }
        }

    }
}

