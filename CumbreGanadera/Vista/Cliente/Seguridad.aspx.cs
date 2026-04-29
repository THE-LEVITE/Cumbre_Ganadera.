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
    public partial class Seguridad : System.Web.UI.Page
    {
        private UsuarioL usuarioL = new UsuarioL();
        private Usuario usuarioActual = null;        

        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Validar sesión primero y detener ejecución si falla
            if (Session["Id"] == null)
            {
                Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                return; // ← Fundamental: detener el procesamiento
            }

            // 2. Cargar el usuario en cada postback (para garantizar que siempre esté disponible)
            // Si ya está cargado y el ID coincide, no es necesario recargar, pero por seguridad lo volvemos a cargar.
            // O simplemente lo cargamos siempre (es una consulta ligera).
            CargarUsuario();
            if (usuarioActual == null)
            {
                // Si no se pudo cargar, limpiar sesión y redirigir
                Session.Clear();
                Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ConfigurarBotonesOpciones();
                OcultarPaneles();
            }
        }

        private void CargarUsuario()
        {
            int idUsuario = Convert.ToInt32(Session["Id"]);
            usuarioActual = usuarioL.ObtenerPorId(idUsuario);
            if (usuarioActual == null)
            {
                lblMensaje.Text = "No se encontró la información del usuario.";
                // No redirijo aquí porque la página lo hará en Page_Load
            }
        }

        private void ConfigurarBotonesOpciones()
        {
            // Puedes personalizar textos aquí si lo deseas, pero no es necesario
        }

        private void OcultarPaneles()
        {
            pnlCambiarContraseña.Visible = false;
          
        }

        protected void btnTelefono_Click(object sender, EventArgs e)
        {
            OcultarPaneles();
          
        }

        protected void btnContraseña_Click(object sender, EventArgs e)
        {
            OcultarPaneles();
            pnlCambiarContraseña.Visible = true;
        }
        protected void btnGuardarContraseña_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtContraseñaActual.Text) ||
                string.IsNullOrEmpty(txtNuevaContraseña.Text) ||
                string.IsNullOrEmpty(txtConfirmarContrasenia.Text))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            if (txtNuevaContraseña.Text != txtConfirmarContrasenia.Text)
            {
                lblMensaje.Text = "La nueva contraseña y su confirmación no coinciden.";
                return;
            }
        }
        protected void btnCancelarContraseña_Click(object sender, EventArgs e)
        {
            OcultarPaneles();
        }

       



        protected void btnEmail_Click(object sender, EventArgs e)
        {
            OcultarPaneles();
           
        }
        protected void btnMejorarProteccion_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Función en desarrollo: próximamente activación de verificación en dos pasos.";
        }

        protected void btnAdministrarDispositivos_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Función en desarrollo: visualización y cierre de sesiones remotas.";
        }
        protected void btnCerrarCard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/PerfilCliente.aspx");
        }
    }
}