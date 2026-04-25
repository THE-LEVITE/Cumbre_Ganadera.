using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;

namespace CumbreGanadera.Vista.Auth
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Validar que los textos tengan datos
            if (!string.IsNullOrEmpty(txtCorreo.Text) && !string.IsNullOrEmpty(txtPassword.Text))
            {
                DatosLoginUser oLoginUser = new DatosLoginUser()
                {
                    Email = txtCorreo.Text,
                    PasswordUser = txtPassword.Text

                };

                UsuarioL oUsuarioL = new UsuarioL();
                Usuario oUsuarioDatos = oUsuarioL.MtLoginUsuario(oLoginUser);

                int cantidadRoles = oUsuarioDatos.CantidadRoles;



                try
                {
                    switch (cantidadRoles)
                    {
                        case 1:
                            Session["SessionUsuario"] = oLoginUser.Email;
                            Session["Nombre"] = oUsuarioDatos.Nombre + " " + oUsuarioDatos.Apellido;
                            Session["Rol"] = oUsuarioDatos.NombreRol.NombreRol;

                            if (oUsuarioDatos.NombreRol.NombreRol == "Dueño")
                            {
                                Response.Redirect("../Dueño/InicioDueño.aspx");
                            }
                            else if (oUsuarioDatos.NombreRol.NombreRol == "Gerente")
                            {
                                Response.Redirect("../Gerente/InicioGerente.aspx");
                            }
                            else if (oUsuarioDatos.NombreRol.NombreRol == "Trabajador")
                            {
                                Response.Redirect("../Trabajador/InicioTrabajador.aspx");
                            }
                            else if (oUsuarioDatos.NombreRol.NombreRol == "Cliente")
                            {
                                Response.Redirect("../Cliente/InicioCliente.aspx");
                            }

                            break;

                        case 2:
                            Response.Redirect("../Auth/SeleccionRol.aspx");
                            break;

                        case 3:
                            Response.Redirect("../Auth/SeleccionRol.aspx");
                            break;
                        case 4:
                            Response.Redirect("../Auth/SeleccionRol.aspx");
                            break;
                        default:
                            Session["Usuario"] = oUsuarioDatos;
                            Response.Redirect("../Admin/IndexAdmin.aspx");
                            break;
                    }

                }
                catch
                {
                    
                }
            }
        }
    }
}

