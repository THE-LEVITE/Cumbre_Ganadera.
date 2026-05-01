using CumbreGanadera.Datos;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Auth
{
    public partial class RegistroCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtDocumento.Text) && !string.IsNullOrEmpty(txtNombre.Text) && !string.IsNullOrEmpty(txtApellido.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtCiudad.Text))
            {
                if (txtPassword.Text == txtConfirmarPassword.Text)
                {
                    RegistroUsuario oRegistroUser = new RegistroUsuario()
                    {
                        Nombre = txtNombre.Text,
                        Apellido = txtApellido.Text,
                        Documento = txtDocumento.Text,
                        Email = txtEmail.Text,
                        Telefono = txtTelefono.Text,
                        Ciudad = txtCiudad.Text,
                        Password = txtPassword.Text,
                        FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text)
                    };

                    if (oRegistroUser.FechaNacimiento > DateTime.Now)
                    {
                        string fecha = @"Swal.fire({
                        title: 'La fecha de nacimiento no puede ser mayor a la fecha actual',
                        icon: 'error'
                        });";

                        ClientScript.RegisterStartupScript(this.GetType(), "fecha", fecha, true);
                        return;
                    }

                    RegistroUsuarioL oRegistro = new RegistroUsuarioL();
                    Usuario oRegistroUsuario = oRegistro.MTRegistro(oRegistroUser);

                    string url = ResolveUrl("/Vista/Auth/InicioSesion.aspx");

                    if (oRegistroUsuario != null)
                    {
                        string script = $@"Swal.fire({{
                        icon: 'success',
                        title: 'Registrado',
                        text: 'Sus datos se han registrado exitosamente',
                        timer: 3000,
                        showConfirmButton: false
                        }}).then(() => {{
                        window.location.href = '{url}';
                        }});";

                        ClientScript.RegisterStartupScript(this.GetType(), "success", script, true);
                    }
                    else
                    {
                        string script = @"Swal.fire({
                        title: 'Error al registrar',
                        icon: 'error',
                        text: 'El usuario ya está registrado'
                        });";

                        ClientScript.RegisterStartupScript(this.GetType(), "error", script, true);
                    }
                }
                else
                {
                    string script = @"Swal.fire({
                    title: 'Las contraseñas no coinciden',
                    icon: 'error'
                    });";

                    ClientScript.RegisterStartupScript(this.GetType(), "pass", script, true);
                }
            }
            else
            {
                string script2 = @"Swal.fire({
                title: 'Por favor complete los campos obligatorios',
                icon: 'error'
                });";

                ClientScript.RegisterStartupScript(this.GetType(), "campos", script2, true);
            }

        }
    }
}