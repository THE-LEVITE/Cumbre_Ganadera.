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
                //creamos un nuevo objeto en el cual oLoginUser contiene los datos ingresados por el usuario
                DatosLoginUser oLoginUser = new DatosLoginUser()
                {
                    Email = txtCorreo.Text,
                    PasswordUser = txtPassword.Text
                };
                //creamos un nuevo objeto de oUsuariosL 
                UsuarioL oUsuarioL = new UsuarioL();
                //instanciamos un objeto de tipo usuario y le asignamos la informacion del MtLoginUsuario
                List<Usuario> lUsuarioDatos = oUsuarioL.MtLoginUsuario(oLoginUser);
                //Se hace una condicion por si el objeto llega null
                var roles = lUsuarioDatos.Select(u => u.NombreRol.NombreRol).ToList();
                Session["listausuarios"] = roles;
                if (lUsuarioDatos != null)
                {
                    if (lUsuarioDatos.Count > 1)
                    {
                        Usuario oUsuario = lUsuarioDatos.FirstOrDefault();

                        Session["Id"] = oUsuario.Id;
                        Session["Nombre"] = oUsuario.Nombre + " " + oUsuario.Apellido;
                        Response.Redirect("~/Vista/Auth/SeleccionRol.aspx");
                    }
                    else
                    {
                        Session["SessionUsuario"] = oLoginUser.Email;

                        Usuario oUsuario = lUsuarioDatos.FirstOrDefault();

                        Session["Id"] = oUsuario.Id;
                        Session["Nombre"] = oUsuario.Nombre + " " + oUsuario.Apellido;
                        Session["Rol"] = oUsuario.NombreRol.NombreRol;
                        Session["IdRol"] = oUsuario.NombreRol.IdRol;

                        if (oUsuario.NombreRol.NombreRol == "Dueño")
                        {
                            string mensaje = @"Swal.fire({
                        icon: 'success',
                        title: '¡Bienvenid@!',
                        text: 'Bienvenid@ " + oUsuario.Nombre + " " + oUsuario.Apellido + " - " + oUsuario.NombreRol.NombreRol + @"',
                        timer: 2000,
                        showConfirmButton: false
                        }).then(() => {
                        window.location.href = '../Dueño/InicioDueño.aspx';
                        });";

                            ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
                        }
                        else if (oUsuario.NombreRol.NombreRol == "Gerente")
                        {
                            string mensaje = @"Swal.fire({
                        icon: 'success',
                        title: '¡Bienvenid@!',
                        text: 'Bienvenid@ " + oUsuario.Nombre + " " + oUsuario.Apellido + " - " + oUsuario.NombreRol.NombreRol + @"',
                        timer: 2000,
                        showConfirmButton: false
                        }).then(() => {
                        window.location.href = '../Gerente/InicioGerente.aspx';
                        });";

                            ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
                        }
                        else if (oUsuario.NombreRol.NombreRol == "Trabajador")
                        {
                            string mensaje = @"Swal.fire({
                        icon: 'success',
                        title: '¡Bienvenid@!',
                        text: 'Bienvenid@ " + oUsuario.Nombre + " " + oUsuario.Apellido + " - " + oUsuario.NombreRol.NombreRol + @"',
                        timer: 2000,
                        showConfirmButton: false
                        }).then(() => {
                        window.location.href = '../Trabajador/InicioTrabajador.aspx';
                        });";

                            ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
                        }
                        else if (oUsuario.NombreRol.NombreRol == "Cliente")
                        {
                            string mensaje = @"Swal.fire({
                        icon: 'success',
                        title: '¡Bienvenid@!',
                        text: 'Bienvenid@ " + oUsuario.Nombre + " " + oUsuario.Apellido + " - " + oUsuario.NombreRol.NombreRol + @"',
                        timer: 2000,
                        showConfirmButton: false
                        }).then(() => {
                        window.location.href = '../Cliente/InicioCliente.aspx';
                        });";

                            ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
                        }
                        else
                        {
                            string mensaje4 = @"Swal.fire({
                    icon: 'error',
                    title: '¡Error!',
                    text: 'Sus datos son incorrectos.',
                    timer: 2000,
                    showConfirmButton: false
                    }).then(() => {
                    window.location.href = '../Auth/InicioSesion.aspx';
                    });";
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", mensaje4, true);


                        }
                    }

                }
            }
        }
    }
}
