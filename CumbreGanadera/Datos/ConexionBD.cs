using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class ConexionBD
    {

        private static readonly string cadena = System.Configuration.ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
        //Abre y cierra la conexion
        public static SqlConnection MtAbrirConexion()
        {
            if (string.IsNullOrWhiteSpace(cadena))
            {
                throw new Exception("La cadena de conexión no se ha configurado correctamente");
            }

            return new SqlConnection(cadena);
        }

    }
}
    
