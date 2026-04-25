using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class UsuarioD
    {
        public Usuario MtLogin(DatosLoginUser oDatosUsuario)
        {
            Usuario oUsuario = null;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "SP_ValidacionLogin";

                //El objeto Command esta reemplazando al adaptador, permitiendo hacer una conexion y consulta a la base de datos
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    //Esto evita la Inyeccion SQL ya que solo muestra y almacena los parametros de la consulta de la parte superior
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", oDatosUsuario.Email);
                    cmd.Parameters.AddWithValue("@Password", oDatosUsuario.PasswordUser);


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            oUsuario = new Usuario()
                            {
                                Id = Convert.ToInt32(dr["ID"]),
                                Nombre = dr["Nombre"].ToString(),
                                Apellido = dr["Apellido"].ToString(),                                
                                Estado = dr["Estado"].ToString(),
                                //Se debe hacer una instacia para acceder al nombre del rol  ya que este es una objeto en la clase funcionario.
                                CantidadRoles = Convert.ToInt32(dr["CantidadRoles"].ToString()),

                                NombreRol = new Rol()
                                {                                   
                                    NombreRol = dr["Roles"].ToString()
                                }


                            };
                        }

                    }
                }
            }
            return oUsuario;
        }
    }

}
