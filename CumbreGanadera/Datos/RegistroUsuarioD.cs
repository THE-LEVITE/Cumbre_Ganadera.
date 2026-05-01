using CumbreGanadera.Modelo;
using CumbreGanadera.Logica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.CodeDom;
using System.Runtime.Remoting.Metadata;

namespace CumbreGanadera.Datos
{
    public class RegistroUsuarioD
    {
        public Usuario MTRegistro(RegistroUsuario oRegistro)
        {
            Usuario oRegistroUser = null;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_InsertarRegistro";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Nombre", oRegistro.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", oRegistro.Apellido);
                    cmd.Parameters.AddWithValue("@Documento", oRegistro.Documento);
                    cmd.Parameters.AddWithValue("@Email", oRegistro.Email);
                    cmd.Parameters.AddWithValue("@Telefono", oRegistro.Telefono);
                    cmd.Parameters.AddWithValue("@PasswordUser", oRegistro.Password);
                    cmd.Parameters.AddWithValue("@FechaNacimiento", oRegistro.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@FechaIngreso", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Estado", "Activo");
                    cmd.Parameters.AddWithValue("@Ciudad", oRegistro.Ciudad);
                    cmd.Parameters.AddWithValue("@Rol", 4);



                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            oRegistroUser = new Usuario()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Documento = dr["Documento"].ToString(),
                                Nombre = dr["Nombre"].ToString(),
                                Apellido = dr["Apellido"].ToString(),
                                Email = dr["Email"].ToString(),
                                Ciudad = dr["Ciudad"].ToString(),
                                FechaNacimiento = Convert.ToDateTime(dr["FechaNacimiento"]),
                                Telefono = dr["Telefono"].ToString(),
                                FechaIngreso = Convert.ToDateTime(dr["FechaIngreso"]),
                                Estado = dr["Estado"].ToString()

                            };
                        }
                    }
                }
            }
            return oRegistroUser;

        }

    }
}