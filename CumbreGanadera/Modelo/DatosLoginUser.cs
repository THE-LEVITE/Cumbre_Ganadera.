using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class DatosLoginUser
    {
        public int Id { get; internal set; }
        public string Email { get; set; }
        public string PasswordUser { get; set; }
        public string BusquedaProducto { get; set; }


    }
}