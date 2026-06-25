using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Datos
{
    public class UsuarioD
    {
        public List<Usuario> MtLogin(DatosLoginUser oDatosUsuario)
        {
            List<Usuario> ltUsuario = new List<Usuario>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "SP_ValidacionLogin";
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", oDatosUsuario.Email);
                    cmd.Parameters.AddWithValue("@Password", oDatosUsuario.PasswordUser);

                    DataTable dt = new DataTable();

                    SqlDataAdapter dr = new SqlDataAdapter(cmd);
                    dr.Fill(dt);

                    foreach (DataRow dr2 in dt.Rows)
                    {
                        Usuario oUsuario = new Usuario()
                        {
                            Id = Convert.ToInt32(dr2["Id"]),
                            Nombre = dr2["Nombre"].ToString(),
                            Apellido = dr2["Apellido"].ToString(),
                            Estado = dr2["Estado"].ToString(),
                            CantidadRoles = Convert.ToInt32(dr2["CantidadRoles"].ToString()),

                            NombreRol = new Rol()
                            {

                                NombreRol = dr2["Roles"].ToString(),
                                IdRol = Convert.ToInt32(dr2["IdRol"]),
                            }

                        };
                        ltUsuario.Add(oUsuario);
                    }
                }
            }
            return ltUsuario;
        }
        public Usuario MtRecuperarContraseña(string correo)
        {
            Usuario oUser = null;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "SP_RecuperarContraseña";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", correo);


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            oUser = new Usuario()
                            {
                                Email = dr["Email"].ToString(),
                                Password = dr["PasswordUser"].ToString()
                            };
                        }
                    }
                }
            }
            return oUser;
        }
        public void MtGuardarCodigoRecuperacion(string Correo, string Codigo)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "Sp_GuardarCodigoRecuperacion";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", Correo);
                    cmd.Parameters.AddWithValue("@Codigo", Codigo);

                    cmd.ExecuteNonQuery();
                }
            }
        }
        public Usuario MtValidarCodigoRecuperacion(string correo)
        {
            Usuario oUser = null;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "Sp_ValidarCodigoRecuperacion";
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", correo);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            oUser = new Usuario()
                            {
                                CodigoRecuperacion = reader["CodigoRecuperacion"].ToString()
                            };
                        }
                    }
                }
            }
            return oUser;
        }
        public void MtActualizarPassword(string correo, string password)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "Sp_ActualizarPassword";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", correo);
                    cmd.Parameters.AddWithValue("@Password", password);
                    
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public Usuario ObtenerPorId(int id)
        {
            Usuario usuario = null;
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string sql = "sp_ObtenerPorId";
                using (SqlCommand cmd = new SqlCommand(sql, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", id);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            usuario = new Usuario();
                            usuario.Id = Convert.ToInt32(reader["Id"]);
                            usuario.Nombre = reader["Nombre"].ToString();
                            usuario.Apellido = reader["Apellido"].ToString();
                            usuario.Documento = reader["Documento"].ToString();
                            usuario.Email = reader["Email"].ToString();
                            usuario.Telefono = reader["Telefono"] == DBNull.Value ? "" : reader["Telefono"].ToString();
                            usuario.FechaNacimiento = reader["FechaNacimiento"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["FechaNacimiento"]);
                            usuario.Password = reader["PasswordUser"].ToString();
                            usuario.Estado = reader["Estado"].ToString();
                        }
                    }
                }
            }
            return usuario;
        }

        public bool ActualizarUsuario(Usuario usuario)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string sql = "sp_ActualizarUsuario";
                using (SqlCommand cmd = new SqlCommand(sql, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Id", SqlDbType.Int).Value = usuario.Id;
                    cmd.Parameters.Add("@Nombres", SqlDbType.NVarChar, 100).Value = (object)usuario.Nombre ?? DBNull.Value;
                    cmd.Parameters.Add("@Apellidos", SqlDbType.NVarChar, 100).Value = (object)usuario.Apellido ?? DBNull.Value;
                    cmd.Parameters.Add("@Identificacion", SqlDbType.NVarChar, 50).Value = (object)usuario.Documento ?? DBNull.Value;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = (object)usuario.Email ?? DBNull.Value;
                    cmd.Parameters.Add("@Telefono", SqlDbType.NVarChar, 20).Value = (object)usuario.Telefono ?? DBNull.Value;
                    cmd.Parameters.Add("@FechaNacimiento", SqlDbType.Date).Value = (object)usuario.FechaNacimiento ?? DBNull.Value;


                    int filas = cmd.ExecuteNonQuery();
                    return filas > 0;
                }
            }
        }
        public List<Usuario> MTListarGerentes(int HaciendaId)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_ListarGerentes";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IdHacienda", HaciendaId);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        List<Usuario> gerentes = new List<Usuario>();
                        while (dr.Read())
                        {
                            Usuario gerente = new Usuario
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Apellido = dr["Apellido"].ToString(),
                                Telefono = dr["Telefono"].ToString(),
                                AreaAsignada = dr["AreaAsignada"].ToString(),
                                Estado = dr["Estado"].ToString()
                            };
                            gerentes.Add(gerente);
                        }
                        return gerentes;
                    }
                }
            }
        }

        public int MTEliminarUsuario(int Idusuario)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_EliminarUsuario";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IdUsuario", Idusuario);

                    int filas = cmd.ExecuteNonQuery();
                    return filas;
                }
            }
        }
    }
}