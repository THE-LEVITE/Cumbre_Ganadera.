using CumbreGanadera.Datos;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Dueño
{
    public partial class EditarGerente : System.Web.UI.Page
    {
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

                UsuarioL oUsuarioL = new UsuarioL();

                int IdGerente = Convert.ToInt32(Session["IdGerenteEditar"]);

                Usuario informacionGerente = oUsuarioL.MTObtenerGerente(IdGerente);

                    txtEmail.Text = informacionGerente.Email;
                    txtTelefono.Text = informacionGerente.Telefono;
                    txtFechaAsignacion.Text = informacionGerente.FechaAsignacion.ToString("yyyy-MM-dd");
                    dlTipoDocumento.SelectedValue = informacionGerente.TipoDocumento.ToString();
                    dlEstado.SelectedItem.Text = informacionGerente.Estado.ToString();
                    dlArea.SelectedValue = informacionGerente.AreaAsignada.ToString();

                    dlDepartamento.SelectedItem.Text = informacionGerente.Departamento.ToString();

                    CargarCiudades(dlDepartamento.SelectedValue);

                    dlCiudad.SelectedItem.Text = informacionGerente.Ciudad.ToString();
            }
        }
        protected void dlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCiudades(dlDepartamento.SelectedValue);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            UsuarioL oUsuarioL = new UsuarioL();

            Usuario oGerente = new Usuario
            {
                Id = Convert.ToInt32(Session["IdGerenteEditar"]),
                Email = txtEmail.Text,
                Telefono = txtTelefono.Text,
                Estado = dlEstado.SelectedItem.Text,
                TipoDocumento = dlTipoDocumento.SelectedItem.Text,
                FechaAsignacion = DateTime.Parse(txtFechaAsignacion.Text),
                AreaAsignada = dlArea.SelectedItem.Text,
                Ciudad = dlCiudad.SelectedItem.Text,
            };

            int filasAfectadas = oUsuarioL.MTEditarGerente(oGerente);

            if (filasAfectadas > 0)
            {
                string script = $@"Swal.fire({{
                                    icon: 'success',
                                    title: 'Gerente editado',
                                    text: 'Los datos alterados hasn sido actualizados',
                                    timer: 3000,
                                    showConfirmButton: false";
                ClientScript.RegisterStartupScript(this.GetType(), "Acceso", script, true);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResumenHacienda.aspx");
        }
    }
}
