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
    public partial class PerfilCliente : System.Web.UI.Page
    {
        private UsuarioL usuarioL = new UsuarioL();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Quita o comenta las líneas de prueba
            // Response.Write("Sesión ID: " + Session["IdUsuario"]);
            // Response.End();

            if (Session["Id"] == null)
            {
                Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarPerfil();
            }
        }

        //private void RedirigirLogin()
        //{
        //    Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
        //}

        private void CargarPerfil()
        {
            int Id = Convert.ToInt32(Session["Id"]);
            Usuario usuario = usuarioL.ObtenerPorId(Id);
            if (usuario != null)
            {
                lblNombreCompleto.Text = $"{usuario.Nombre} {usuario.Apellido}";  // ← muestra el nombre real
            }
            else
            {
                // Si no se encuentra el usuario, cerrar sesión
                Session.Clear();
               
            }
        }


        // Navegación a Información Personal
        protected void lnkInfoPersonal_Click(object sender, EventArgs e)
        {
            Response.Redirect("InformacionPersonal.aspx");
        }

        // Navegación a Datos de la Cuenta
        protected void lnkDatosCuenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/DatosCliente.aspx");
        }

        // Navegación a Seguridad
        protected void lnkSeguridad_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/Seguridad.aspx");
        }

        // Cerrar sesión
        protected void lnkCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
        }


    }
}
