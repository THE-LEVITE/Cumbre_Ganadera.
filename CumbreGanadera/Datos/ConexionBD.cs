using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class ConexionBD
    {
        private static readonly string cadena = System.Configuration.ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
    }
}