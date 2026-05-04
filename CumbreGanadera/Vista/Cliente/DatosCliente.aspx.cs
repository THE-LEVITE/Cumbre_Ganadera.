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
    public partial class DatosCliente : System.Web.UI.Page
    {
        private UsuarioL usuarioL = new UsuarioL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Id"] == null)
                    Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                else
                    CargarDatos();
            }
        }

        private void CargarDatos()
        {
            int idUsuario = Convert.ToInt32(Session["Id"]);
            Usuario usuario = usuarioL.ObtenerPorId(idUsuario);
            if (usuario != null)
            {
                txtEmail.Text = usuario.Email;
                txtTelefono.Text = usuario.Telefono;                
                txtNombreUsuario.Text = usuario.Email; 
            }
            else
            {
                lblMensaje.Text = "No se encontraron datos.";
                btnActualizar.Enabled = false;
                btnEliminarCuenta.Enabled = false;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            
            if (Session["Id"] == null)
            {
                Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMensaje.Text = "❌ El email es obligatorio.";
                return;
            }

            
            int id = Convert.ToInt32(Session["Id"]);
            Usuario usuario = usuarioL.ObtenerPorId(id);
            if (usuario == null)
            {
                lblMensaje.Text = "Usuario no encontrado.";
                return;
            }

            // Actualizar solo los campos editables en esta página
            usuario.Email = txtEmail.Text.Trim();
            usuario.Telefono = txtTelefono.Text.Trim();  
            
            bool ok = usuarioL.ActualizarUsuario(usuario);
            lblMensaje.Text = ok ? "✅ Actualizado correctamente." : "❌ Error al actualizar.";

            if (ok) CargarDatos(); 
        }


        protected void btnEliminarCuenta_Click(object sender, EventArgs e)
        {
            
        }
        protected void btnCerrarCard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/PerfilCliente.aspx");
        }
    }
}