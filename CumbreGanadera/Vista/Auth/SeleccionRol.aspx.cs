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
            try
            //se realiza un try catch y un swich para ejecutar el codigo y captar errores 
            {
                List<string> lista = (List<string>)Session["listausuarios"];

                // Solo lo hacemos la primera vez que carga
                if (!IsPostBack)
                {
                    // 1. Verificamos si hay un usuario en sesión
                    if (lista != null)
                    {

                        // Recuperamos los datos del usuario (el molde que creamos)
                        Usuario user = (Usuario)Session["UsuarioSesion"];

                        // 3. LA TOMA DE DECISIONES (El IF)
                        // Aquí preguntamos qué rol tiene guardado el usuario
                        if (lista.Contains("Dueño"))
                        {
                            btnDueño.Visible = true; // Solo se muestra esta

                        }
                        if (lista.Contains("Gerente"))
                        {
                            btnGerente.Visible = true;

                        }
                        if (lista.Contains("Trabajador"))
                        {
                            btnTrabajador.Visible = true;

                        }
                        if (lista.Contains("Cliente"))
                        {
                            btnCliente.Visible = true;

                        }
                        else
                        {
                            // Si alguien intenta entrar sin loguearse, lo mandamos al inicio
                            Response.Redirect("InicioSesion.aspx");
                        }

                    }


                }
            }
            catch
            {
                string mensaje4 = @"Swal.fire({
        icon: 'error',
        title: '¡Error!',
        text: 'Ocurrio un problema inesperado.',
        timer: 2000,
        showConfirmButton: false
        }).then(() => {
        window.location.href = '../Auth/InicioSesion.aspx';
        });";

                ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje4, true);
            }
        }

        protected void btnDueño_Click(object sender, EventArgs e)
        {
            Session["Rol"] = "Dueño";
            Session["IdRol"] = 1;
            Response.Redirect("~/Vista/Dueño/InicioDueño.aspx");
        }
        protected void btnGerente_Click(object sender, EventArgs e)
        {
            Session["Rol"] = "Gerente";
            Session["IdRol"] = 2;
            Response.Redirect("~/Vista/Gerente/InicioGerente.aspx");
        }
        protected void btnTrabajador_Click(object sender, EventArgs e)
        {
            Session["Rol"] = "Trabajador";
            Session["IdRol"] = 3;
            Response.Redirect("~/Vista/Trabajador/InicioTrabajador.aspx");
        }
        protected void btnCliente_Click(object sender, EventArgs e)
        {
            Session["Rol"] = "Cliente";
            Session["IdRol"] = 4;
            Response.Redirect("~/Vista/Cliente/InicioCliente.aspx");
        }


    }

}