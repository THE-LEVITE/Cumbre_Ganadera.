using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class MenuM
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string UrlMenu { get; set; }
        public string Icono { get; set; }
        public int Orden { get; set; }

    }
}