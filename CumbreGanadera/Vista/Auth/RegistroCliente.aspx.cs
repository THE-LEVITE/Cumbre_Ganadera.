using CumbreGanadera.Datos;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            CargarCiudades(dlDepartamento.SelectedValue);

            if (!IsPostBack)
            {
                using (SqlConnection cn = ConexionBD.MtAbrirConexion())
                {
                    string consultaTipoDocumentos = "select Id, Nombre from TipoDocumento";

                    cn.Open();

                    using (SqlCommand cmd = new SqlCommand(consultaTipoDocumentos, cn))
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        {
                            dlTipoDocumento.DataSource = dr;
                            dlTipoDocumento.DataTextField = "Nombre";
                            dlTipoDocumento.DataValueField = "Id";
                            dlTipoDocumento.DataBind();
                        }
                    }
                    cn.Close();
                }

                using (SqlConnection cn = ConexionBD.MtAbrirConexion())
                {
                    string consultaDepartamentos = "select Id, Departamento from Departamento";

                    cn.Open();

                    using (SqlCommand cmd = new SqlCommand(consultaDepartamentos, cn))
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        {
                            dlDepartamento.DataSource = dr;
                            dlDepartamento.DataTextField = "Departamento";
                            dlDepartamento.DataValueField = "Id";
                            dlDepartamento.DataBind();
                        }
                    }
                    cn.Close();
                }
            }
        }
        private void CargarCiudades(string IdDepartamento)
        {
            dlCiudad.Items.Clear();

            if (string.IsNullOrEmpty(IdDepartamento))
                return;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                string consultaCiudades = "select Id, NombreCiudad from Ciudad where IdDepartamento = @IdDepartamento";
                cn.Open();
                using (SqlCommand cmd = new SqlCommand(consultaCiudades, cn))
                {
                    cmd.Parameters.AddWithValue("@IdDepartamento", dlDepartamento.SelectedValue);
                    SqlDataReader dr = cmd.ExecuteReader();
                    {
                        dlCiudad.DataSource = dr;
                        dlCiudad.DataTextField = "NombreCiudad";
                        dlCiudad.DataValueField = "Id";
                        dlCiudad.DataBind();
                    }
                }
                cn.Close();
            }
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtDocumento.Text) && !string.IsNullOrWhiteSpace(dlTipoDocumento.SelectedItem.Text) && !string.IsNullOrEmpty(txtNombre.Text) && !string.IsNullOrEmpty(txtApellido.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(dlCiudad.SelectedItem.Text) && !string.IsNullOrEmpty(dlDepartamento.SelectedItem.Text))
            {
                if (txtPassword.Text == txtConfirmarPassword.Text)
                {
                    Usuario oRegistroUser = new Usuario()
                    {
                        Nombre = txtNombre.Text,
                        Apellido = txtApellido.Text,
                        Documento = txtDocumento.Text,
                        TipoDocumento = dlTipoDocumento.SelectedItem.Text,
                        Email = txtEmail.Text,
                        Telefono = txtTelefono.Text,
                        Ciudad = dlCiudad.SelectedItem.Text,
                        Departamento = dlDepartamento.SelectedItem.Text,
                        Password = txtPassword.Text,
                        FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text)
                    };

                    if (oRegistroUser.FechaNacimiento > DateTime.Now)
                    {
                        string fecha = @"Swal.fire({
                                    title: 'La fecha de nacimiento no puede ser mayor a la fecha actual',
                                    icon: 'error',
                                    draggable: true
                                    });";
                        ClientScript.RegisterStartupScript(this.GetType(), "Acceso", fecha, true);
                        return;
                    }

                    RegistroUsuarioL oRegistro = new RegistroUsuarioL();
                    int oRegistroUsuario = oRegistro.MTRegistro(oRegistroUser);

                    string url = ResolveUrl("/Vista/Auth/InicioSesion.aspx");

                    if (oRegistroUsuario > 0)
                    {
                        string script = $@"Swal.fire({{
                                    icon: 'success',
                                    title: 'Resgistrado',
                                    text: 'Sus datos se han registrado exitosamente',
                                    timer: 3000,
                                    showConfirmButton: false
                                    }}).then(() => {{
                                    window.location.href = '{url}';
                                    }});";
                        ClientScript.RegisterStartupScript(this.GetType(), "Acceso", script, true);
                    }
                    else
                    {
                        string script = @"Swal.fire({
                                    title: 'Error',
                                    text: 'Los datos ingresados ya han sido registrados',
                                    icon: 'error',
                                    draggable: true
                                    });";
                        ClientScript.RegisterStartupScript(this.GetType(), "Acceso", script, true);
                    }

                }
                else
                {
                    string script = @"Swal.fire({
                                    title: 'Las contraseñas no coinciden',
                                    icon: 'error',
                                    draggable: true
                                    });";
                    ClientScript.RegisterStartupScript(this.GetType(), "Acceso", script, true);

                }
            }
            string script2 = @"Swal.fire({
                                    title: 'Por favor complete los campos obligatorios',
                                    icon: 'error',
                                    draggable: true
                                    });";
            ClientScript.RegisterStartupScript(this.GetType(), "Acceso", script2, true);

        }

        protected void dlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCiudades(dlDepartamento.DataValueField);
        }
    }
}