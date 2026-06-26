using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class TareasM
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public string Sector {  get; set; }
        public DateTime FechaAsignacion { get; set; }
        public DateTime FechaFinalizacion { get; set; }
        public string Estado { get; set; }
    }
}