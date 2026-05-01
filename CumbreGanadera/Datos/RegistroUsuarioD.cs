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
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_InsertarRegistro";
                int resultado = 0;

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