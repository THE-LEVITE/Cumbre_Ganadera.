using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Perfiles
{
    public partial class Perfiles : System.Web.UI.MasterPage
    {
        private UsuarioL usuarioL = new UsuarioL();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si el usuario ha iniciado sesión
            if (Session["Id"] == null)
            {
                // Si no hay sesión, redirigir al login
                Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosUsuario();
            }
        }

        private void CargarDatosUsuario()
        {
            try
            {
                int idUsuario = Convert.ToInt32(Session["Id"]);
                if (idUsuario <= 0)  // ← Agrega esta validación
                {
                    Session.Clear();
                    Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                    return;
                }

                Usuario usuario = usuarioL.ObtenerPorId(idUsuario);
                if (usuario != null)
                {
                    if (lblNombreUsuario != null)
                    {
                        lblNombreUsuario.Text = $"{usuario.Nombre} {usuario.Apellido}";
                    }
                }
                else
                {
                    Session.Clear();
                    Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
                }
            }
            catch (Exception)
            {
                Session.Clear();
                Response.Redirect("~/Vista/Auth/InicioSesion.aspx");
            }
        }

        // Evento para el botón "Inicio"
        protected void lnkInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/InicioCliente.aspx");
        }

        // Evento para el botón "Perfil" (menú superior)
        protected void lnkPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/PerfilCliente.aspx");
        }

        // Evento para el botón "Ayuda" (si quieres)
        protected void lnkAyuda_Click(object sender, EventArgs e)
        {
            // Ejemplo: redirigir a una página de ayuda
            Response.Redirect("~/Vista/Cliente/Ayuda.aspx");
        }

        // Evento para el círculo del perfil (imagen)
        protected void imgPerfil_Click(object sender, ImageClickEventArgs e)
        {
            // Puedes redirigir a la misma página de perfil o a un menú de opciones
            Response.Redirect("~/Vista/Cliente/PerfilCliente.aspx");
        }
    }
}
