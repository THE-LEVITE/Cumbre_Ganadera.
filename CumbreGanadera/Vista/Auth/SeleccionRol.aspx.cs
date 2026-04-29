using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Auth
{
    public partial class SeleccionRol : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            // Solo lo hacemos la primera vez que carga
            if (!IsPostBack)
            {
                // 1. Verificamos si hay un usuario en sesión
                if (Session["UsuarioSesion"] != null)
                {
                    // Recuperamos los datos del usuario (el molde que creamos)
                    Usuario user = (Usuario)Session["UsuarioSesion"];

                    // 2. APAGAMOS todas las tarjetas al principio (Invisibles)
                    btnDueño.Visible = false;
                    btnGerente.Visible = false;
                    btnTrabajador.Visible = false;
                    btnCliente.Visible = false;

                    // 3. LA TOMA DE DECISIONES (El IF)
                    // Aquí preguntamos qué rol tiene guardado el usuario
                    string miRol = user.NombreRol.NombreRol;

                    if (miRol == "Dueño")
                    {
                        btnDueño.Visible = true; // Solo se muestra esta
                    }
                    else if (miRol == "Gerente")
                    {
                        btnGerente.Visible = true;
                    }
                    else if (miRol == "Trabajador")
                    {
                        btnTrabajador.Visible = true;
                    }
                    else if (miRol == "Cliente")
                    {
                        btnCliente.Visible = true;
                    }
                }
                else
                {
                    // Si alguien intenta entrar sin loguearse, lo mandamos al inicio
                    Response.Redirect("InicioSesion.aspx");
                }
            }
        }

        protected void btnDueño_Click(object sender, EventArgs e)
        {
            // Aquí puedes redirigir o poner la lógica que necesites
            // Ejemplo: Response.Redirect("MenuDueno.aspx");
        }
        protected void btnGerente_Click(object sender, EventArgs e)
        {
            // Aquí puedes redirigir o poner la lógica que necesites
            // Ejemplo: Response.Redirect("MenuGerente.aspx");
        }
        protected void btnTrabajador_Click(object sender, EventArgs e)
        {
            // Aquí puedes redirigir o poner la lógica que necesites
            // Ejemplo: Response.Redirect("MenuTrabajador.aspx");
        }
        protected void btnCliente_Click(object sender, EventArgs e)
        {
            // Aquí puedes redirigir o poner la lógica que necesites
            // Ejemplo: Response.Redirect("MenuCliente.aspx");
        }


    }

}