using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class Reporte
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public string Titulo { get; set; }
        public string Motivo { get; set; }
        public string Hacienda { get; set; }
        public DateTime FechaCreacion { get; set; }
    }
}