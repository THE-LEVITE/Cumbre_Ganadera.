using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class UsuarioD
    {
        //Se crea MtLogin en donde recibimos la informacion de los txt o datos usuario
        public Usuario MtLogin(DatosLoginUser oDatosUsuario)
        {
            //Aca definimos un objeto de usuario con la propiedad null para validarlo despues
            Usuario oUsuario = null;

            //se crea la conexion con su respectivo metodo
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                //Aca llamamos el procedimiento almacenado
                string consulta = "SP_ValidacionLogin";
                //El objeto Command esta reemplazando al adaptador, permitiendo hacer una conexion y consulta a la base de datos
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    //Esto evita la Inyeccion SQL ya que solo muestra y almacena los parametros de la consulta de la parte superior
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", oDatosUsuario.Email);
                    cmd.Parameters.AddWithValue("@Password", oDatosUsuario.PasswordUser);

                    //Aca lee la consulta de la base de datos 
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            oUsuario = new Usuario()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Apellido = dr["Apellido"].ToString(),
                                Estado = dr["Estado"].ToString(),
                                //cantidadroles almacenara el numero de roles que tiene el usuario 
                                CantidadRoles = Convert.ToInt32(dr["CantidadRoles"].ToString()),

                                //Se debe hacer una instacia para acceder al nombre del rol  ya que este es una objeto en la clase Usuario
                                NombreRol = new Rol()
                                {

                                    NombreRol = dr["Roles"].ToString(),
                                    IdRol = Convert.ToInt32(dr["IdRol"]),
                                }


                            };
                        }

                    }
                }
            }
            //retornar los datos del usuario
            return oUsuario;
        }

        public Usuario MtRecuperarContraseña(string correo)
        {
            Usuario oUser = null;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "SP_RecuperarContraseña";

                //El objeto Command esta reemplazando al adaptador, permitiendo hacer una conexion y consulta a la base de datos
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    //Esto evita la Inyeccion SQL ya que solo muestra y almacena los parametros de la consulta de la parte superior
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
       
    





    public Usuario ObtenerPorId(int id)
        {
            Usuario usuario = null;
            using (SqlConnection cn = ConexionBD.MtAbrirConexion()) // Se espera que la conexión ya esté abierta
            {
                cn.Open();
                // Se usa el nombre del procedimiento almacenado
                string sql = "sp_ObtenerPorId";
                using (SqlCommand cmd = new SqlCommand(sql, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;  // ← Importante
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




        // Actualizar datos personales (UPDATE, usa ExecuteNonQuery)
        public bool ActualizarUsuario(Usuario usuario)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion()) // conexión abierta
            {
                cn.Open();
                string sql = "sp_ActualizarUsuario"; // nombre del procedimiento almacenado
                using (SqlCommand cmd = new SqlCommand(sql, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Agregar parámetros con tipo explícito (mejor que AddWithValue)
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
    }
}