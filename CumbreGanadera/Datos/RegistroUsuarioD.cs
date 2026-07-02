using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using Microsoft.Win32;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata;
using System.Web;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Datos
{
    public class RegistroUsuarioD
    {
        public int MTRegistro(Usuario oRegistro)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_InsertarRegistro";

                int resultado = 0;

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Nombre", oRegistro.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", oRegistro.Apellido);
                    cmd.Parameters.AddWithValue("@TipoDocumento", oRegistro.TipoDocumento);
                    cmd.Parameters.AddWithValue("@Documento", oRegistro.Documento);
                    cmd.Parameters.AddWithValue("@Email", oRegistro.Email);
                    cmd.Parameters.AddWithValue("@Telefono", oRegistro.Telefono);
                    cmd.Parameters.AddWithValue("@PasswordUser", oRegistro.Password);
                    cmd.Parameters.AddWithValue("@FechaNacimiento", oRegistro.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@FechaIngreso", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Estado", "Activo");
                    cmd.Parameters.AddWithValue("@Ciudad", oRegistro.Ciudad);
                    cmd.Parameters.AddWithValue("@Rol", 4);

                    return resultado = cmd.ExecuteNonQuery();


                }
            }
        }
        public int MTInsertarGerente(RegistroUsuario gerente)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_InsertarGerente";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Documento", gerente.Documento);
                    cmd.Parameters.AddWithValue("@TipoDocumento", gerente.TipoDocumento);
                    cmd.Parameters.AddWithValue("@Nombre", gerente.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", gerente.Apellido);
                    cmd.Parameters.AddWithValue("@Email", gerente.Email);
                    cmd.Parameters.AddWithValue("@FechaNacimiento", gerente.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@Telefono", gerente.Telefono);
                    cmd.Parameters.AddWithValue("@Ciudad", gerente.Ciudad);
                    cmd.Parameters.AddWithValue("@AreaAsignada", gerente.Area);
                    cmd.Parameters.AddWithValue("@FechaAsignacion", gerente.FechaAsignacion);
                    cmd.Parameters.AddWithValue("@IdHacienda", gerente.IdHacienda);
                    cmd.Parameters.AddWithValue("@FechaIngreso", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Estado", "Activo");

                    try
                    {
                        int filas = cmd.ExecuteNonQuery();
                        return filas;

                    }
                    catch (SqlException)
                    {
                        int filas = 0;
                        return filas;
                    }
                }
            }
        }
    }
}
