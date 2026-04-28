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
                Usuario oUsuarioDatos = oUsuarioL.MtLoginUsuario(oLoginUser);
                //Se hace una condicion por si el objeto llega null
                if (oUsuarioDatos != null)
                {
                    //hacemos una variable de cantidad roles que va a almacenar el valor de los roles que tiene cada usuario
                    int cantidadRoles = oUsuarioDatos.CantidadRoles;
                    try
                    //se realiza un try catch y un swich para ejecutar el codigo y captar errores 
                    {
                        switch (cantidadRoles)
                        {
                            case 1:
                                //hacemos las variables de sesion par almacenar valores del usuario
                                Session["SessionUsuario"] = oLoginUser.Email;
                                Session["Nombre"] = oUsuarioDatos.Nombre + " " + oUsuarioDatos.Apellido;
                                Session["Rol"] = oUsuarioDatos.NombreRol.NombreRol;
                                Session["IdRol"] = oUsuarioDatos.NombreRol.IdRol;
                                

                                if (oUsuarioDatos.NombreRol.NombreRol == "Dueño")
                                {
                                    string mensaje = @"Swal.fire({
                                icon: 'success',
                                title: '¡Bienvenid@!',
                                text: 'Bienvenid@ " + oUsuarioDatos.Nombre + " " + oUsuarioDatos.Apellido + " - " + oUsuarioDatos.NombreRol.NombreRol + @"',
                                timer: 2000,
                                showConfirmButton: false
                                }).then(() => {
                                window.location.href = '../Dueño/InicioDueño.aspx';
                                });";

                                    ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
                                }
                                else if (oUsuarioDatos.NombreRol.NombreRol == "Gerente")
                                {
                                    string mensaje = @"Swal.fire({
                                icon: 'success',
                                title: '¡Bienvenid@!',
                                text: 'Bienvenid@ " + oUsuarioDatos.Nombre + " " + oUsuarioDatos.Apellido + " - " + oUsuarioDatos.NombreRol.NombreRol + @"',
                                timer: 2000,
                                showConfirmButton: false
                                }).then(() => {
                                window.location.href = '../Gerente/InicioGerente.aspx';
                                });";

                                    ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
                                }
                                else if (oUsuarioDatos.NombreRol.NombreRol == "Trabajador")
                                {
                                    string mensaje = @"Swal.fire({
                                icon: 'success',
                                title: '¡Bienvenid@!',
                                text: 'Bienvenid@ " + oUsuarioDatos.Nombre + " " + oUsuarioDatos.Apellido + " - " + oUsuarioDatos.NombreRol.NombreRol + @"',
                                timer: 2000,
                                showConfirmButton: false
                                }).then(() => {
                                window.location.href = '../Trabajador/InicioTrabajador.aspx';
                                });";

                                    ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
                                }
                                else if (oUsuarioDatos.NombreRol.NombreRol == "Cliente")
                                {
                                    string mensaje = @"Swal.fire({
                                icon: 'success',
                                title: '¡Bienvenid@!',
                                text: 'Bienvenid@ " + oUsuarioDatos.Nombre + " " + oUsuarioDatos.Apellido + " - " + oUsuarioDatos.NombreRol.NombreRol + @"',
                                timer: 2000,
                                showConfirmButton: false
                                }).then(() => {
                                window.location.href = '../Cliente/InicioCliente.aspx';
                                });";

                                    ClientScript.RegisterStartupScript(this.GetType(), "Acceso", mensaje, true);
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
