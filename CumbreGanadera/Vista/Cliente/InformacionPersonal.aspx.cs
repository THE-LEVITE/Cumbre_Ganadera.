using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Cliente
{
    public partial class InformacionPersonal : System.Web.UI.Page
    {
        private UsuarioL usuarioL = new UsuarioL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Id"] == null)
                    Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                else
                    CargarDatosUsuario();
            }
        }



        private void CargarDatosUsuario()
        {
            int idUsuario = Convert.ToInt32(Session["Id"]);
            Usuario u = usuarioL.ObtenerPorId(idUsuario);
            if (u != null)
            {
                txtNombres.Text = u.Nombre;
                txtApellidos.Text = u.Apellido;
                txtDocumento.Text = u.Documento;
                if (u.FechaNacimiento.HasValue)
                    txtFecha.Text = u.FechaNacimiento.Value.ToString("yyyy-MM-dd");
            }
            else
            {
                lblMensaje.Text = "No se encontró el usuario en la base de datos.";
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {
                Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                return;
            }

            // Validar campos obligatorios
            if (string.IsNullOrWhiteSpace(txtNombres.Text) ||
                string.IsNullOrWhiteSpace(txtApellidos.Text) ||
                string.IsNullOrWhiteSpace(txtDocumento.Text))
            {
                lblMensaje.Text = "Por favor, complete todos los campos obligatorios.";
                return;
            }

            // Validar fecha
            DateTime? fechaNacimiento = null;
            if (!string.IsNullOrEmpty(txtFecha.Text))
            {
                if (!DateTime.TryParse(txtFecha.Text, out DateTime fechaTemp))
                {
                    lblMensaje.Text = "Formato de fecha inválido. Use aaaa-mm-dd.";
                    return;
                }
                fechaNacimiento = fechaTemp;
            }

            int idUsuario = Convert.ToInt32(Session["Id"]);
            Usuario usuario = usuarioL.ObtenerPorId(idUsuario);
            if (usuario == null)
            {
                lblMensaje.Text = "No se pudo cargar el usuario para actualizar.";
                return;
            }

            // Modificar campos
            usuario.Nombre = txtNombres.Text.Trim();
            usuario.Apellido = txtApellidos.Text.Trim();
            usuario.Documento = txtDocumento.Text.Trim();
            usuario.FechaNacimiento = fechaNacimiento;

            bool actualizado = usuarioL.ActualizarUsuario(usuario);
            if (actualizado)
            {
                lblMensaje.Text = "✅ Información actualizada correctamente.";
                CargarDatosUsuario(); 
            }
            else
            {
                lblMensaje.Text = "❌ No se pudo actualizar. Verifique los datos.";
            }


        }
        protected void btnCerrarCard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/PerfilCliente.aspx");
        }
    }
}