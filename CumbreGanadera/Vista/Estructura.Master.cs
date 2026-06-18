using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista
{
    public partial class Estructura : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Rol"] != null && Session["Rol"].ToString() == "Dueño")
            {
                lblUsuario.Text = Session["Nombre"].ToString();
                lblPanel.Text = "Panel de " + Session["Rol"].ToString();
                lblRol.Text = "Administrador Principal";
                BarraBusqueda.Visible = false;
            }
            else if (Session["Rol"] != null && Session["Rol"].ToString() == "Gerente")
            {
                lblUsuario.Text = Session["Nombre"].ToString();
                lblPanel.Text = "Panel de " + Session["Rol"].ToString();
                lblRol.Text = Session["Rol"].ToString();
                BarraBusqueda.Visible = false;
            }
            else if (Session["Rol"] != null && Session["Rol"].ToString() == "Trabajador")
            {
                lblUsuario.Text = Session["Nombre"].ToString();
                lblPanel.Text = "Panel de " + Session["Rol"].ToString();
                lblRol.Text = Session["Rol"].ToString();
                BarraBusqueda.Visible = false;
            }
            else if (Session["Rol"] != null && Session["Rol"].ToString() == "Cliente")
            {
                lblUsuario.Text = Session["Nombre"].ToString();
                lblPanel.Text = "Panel de " + Session["Rol"].ToString();
                lblRol.Text = Session["Rol"].ToString();
                BarraBusqueda.Visible = true;
            }
            else
            {

                lblPanel.Text = "Modo Invitado";
                lblRol.Text = "Modo Invitado";
            }

            if (Session["IdRol"] != null)
            {
                if (!IsPostBack)
                {
                    int IdRol = Convert.ToInt32(Session["IdRol"]);
                    MenuL oMenuL = new MenuL();

                    List<MenuM> menu = oMenuL.MTMenus(IdRol);

                    string html = "";

                    foreach (var listaMenu in menu)
                    {
                        html += $@"<a class='flex items-center gap-3 px-4 py-3 rounded-lg text-slate-600 dark:text-slate-400 hover:bg-slate-200 dark:hover:bg-primary/10 hover:text-primary transition-colors' href='{listaMenu.UrlMenu}'>
                    <span class='material-symbols-outlined'>{listaMenu.Icono}</span>
                    <span>{listaMenu.Nombre}</span>
                    </a>";
                    }
                    litMenu.Text = html;
                }
            }
        }

        protected void btnlupa_Click(object sender, EventArgs e)
        {


            if (!string.IsNullOrEmpty(intCampoBusqueda.Text))
            {
                // Guardar el texto de la barra de busqueda en una variable de sesion
                Session["TerminoBusqueda"] = intCampoBusqueda.Text;


                Response.Redirect("~/Vista/Cliente/BusquedaProducto.aspx");
            }
            else
            {
                
                Session["TerminoBusqueda"] = "";
                Response.Redirect("~/Vista/Cliente/BusquedaProducto.aspx");
            }

        }

        protected void lbCerrar_Click1(object sender, EventArgs e)
        {
            {
                //limpia variables de sesion y las abandona
                Session.Clear();
                Session.Abandon();

                //Response.Redirect("../Auth/InicioSesion.aspx");

                //Se crea una variable y se le da la URL, esto es para forzar la redireccion
                string url = ResolveUrl("~/Vista/Auth/InicioSesion.aspx");
                //se crea una variable en donde esta contiene el swetalert 
                string script = $@"Swal.fire({{
                icon: 'success',
                title: 'Sesión cerrada',
                text: 'Has cerrado sesión correctamente.',
                timer: 2000,
                showConfirmButton: false
                }}).then(() => {{
                window.location.href = '{url}';
                }});";
                //Este es el que da el control e indica que se agregue o se haga automaticamente
                ScriptManager.RegisterStartupScript(this, GetType(), "CerrarSesion", script, true);

            }
        }
    }
}