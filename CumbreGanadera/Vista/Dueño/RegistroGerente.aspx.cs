using CumbreGanadera.Datos;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Dueño
{
    public partial class RegistroGerente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int HaciendaId = Convert.ToInt32(Session["IdHacienda"]);


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
                    string cosnultaAreas = "select Id, Nombre from Area where IdHacienda = @IdHacienda";

                    cn.Open();
                    using (SqlCommand cmd = new SqlCommand(cosnultaAreas, cn))
                    {
                        cmd.CommandType = System.Data.CommandType.Text;

                        cmd.Parameters.AddWithValue("@IdHacienda", HaciendaId);

                        SqlDataReader drAreas = cmd.ExecuteReader();
                        {
                            dlArea.DataSource = drAreas;
                            dlArea.DataTextField = "Nombre";
                            dlArea.DataValueField = "Id";
                            dlArea.DataBind();
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
            if (!string.IsNullOrEmpty(txtDocumento.Text) && !string.IsNullOrEmpty(txtNombre.Text) && !string.IsNullOrEmpty(txtApellido.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtFechaNacimiento.Text) && !string.IsNullOrEmpty(txtTelefono.Text) && !string.IsNullOrEmpty(dlCiudad.Text) && !string.IsNullOrEmpty(txtFechaAsignacion.Text) && !string.IsNullOrEmpty(dlArea.Text))
            {
                int IdHacienda = Convert.ToInt32(Session["IdHacienda"]);

                RegistroUsuario oRegistroGerente = new RegistroUsuario()
                {
                    Documento = txtDocumento.Text,
                    TipoDocumento = dlTipoDocumento.SelectedItem.Text,
                    Nombre = txtNombre.Text,
                    Apellido = txtApellido.Text,
                    Email = txtEmail.Text,
                    FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text),
                    Telefono = txtTelefono.Text,
                    Ciudad = dlCiudad.SelectedItem.Text,
                    Area = dlArea.SelectedItem.Text,
                    FechaAsignacion = DateTime.Parse(txtFechaAsignacion.Text),
                    IdHacienda = IdHacienda,
                };
                    
                if (oRegistroGerente.FechaNacimiento > DateTime.Now)
                {
                    string fecha = @"Swal.fire({
                                    title: 'La fecha de nacimiento no puede ser mayor a la fecha actual',
                                    icon: 'error',
                                    draggable: true
                                    });";
                    ClientScript.RegisterStartupScript(this.GetType(), "Acceso", fecha, true);
                    return;
                }
                RegistroUsuarioL oNuevoGerente = new RegistroUsuarioL();
                int oRegistroGer = oNuevoGerente.MTRegistroGerente(oRegistroGerente);

                string url = ResolveUrl("InicioDueño.aspx");

                if (oRegistroGer != 0)
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
                                    title: 'Falta insertar datos en algun campo',
                                    icon: 'error',
                                    draggable: true
                                    });";
                ClientScript.RegisterStartupScript(this.GetType(), "Acceso", script, true);
            }
        }
                

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResumenHacienda.aspx");
        }

        protected void dlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCiudades(dlDepartamento.SelectedValue);
        }
    }
}