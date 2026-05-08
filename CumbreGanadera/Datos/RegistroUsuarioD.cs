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
using System.Drawing;

namespace CumbreGanadera.Datos
{
    public class RegistroUsuarioD
    {
        public int MTRegistro(RegistroUsuario oRegistro)
        {
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
                    cmd.Parameters.AddWithValue("@TipoDocumento", oRegistro.TipoDocumento);
                    cmd.Parameters.AddWithValue("@Email", oRegistro.Email);
                    cmd.Parameters.AddWithValue("@Telefono", oRegistro.Telefono);
                    cmd.Parameters.AddWithValue("@PasswordUser", oRegistro.Password);
                    cmd.Parameters.AddWithValue("@FechaNacimiento", oRegistro.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@FechaIngreso", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Estado", "Activo");
                    cmd.Parameters.AddWithValue("@Ciudad", oRegistro.Ciudad);
                    cmd.Parameters.AddWithValue("@Rol", 4);

                    try
                    {
                        int filas = cmd.ExecuteNonQuery();
                        return filas;

                    }
                    catch (SqlException ex)
                    {
                        int filas = 0;
                        return filas;
                    }
                }
            }
        }

        public Usuario MTRegistroGerente(RegistroUsuario oRegistroGer)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_CrearGerente";
                int resultado = 0;

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Nombre", oRegistroGer.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", oRegistroGer.Apellido);
                    cmd.Parameters.AddWithValue("@Documento", oRegistroGer.Documento);
                    cmd.Parameters.AddWithValue("@TipoDocumento", oRegistroGer.TipoDocumento);
                    cmd.Parameters.AddWithValue("@Email", oRegistroGer.Email);
                    cmd.Parameters.AddWithValue("@Telefono", oRegistroGer.Telefono);
                    cmd.Parameters.AddWithValue("@FechaNacimiento", oRegistroGer.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@FechaIngreso", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Ciudad", oRegistroGer.Ciudad);
                    cmd.Parameters.AddWithValue("@Area", oRegistroGer.Area);
                    cmd.Parameters.AddWithValue("@FechaAsignacion", oRegistroGer.FechaAsignacion);

                    resultado = Convert.ToInt32(cmd.ExecuteScalar());
                }

                if (resultado == -1)
                {
                    return null;
                }
                else
                {
                    return new Usuario() { Id = resultado };
                }
            }
        }      
    }
}
