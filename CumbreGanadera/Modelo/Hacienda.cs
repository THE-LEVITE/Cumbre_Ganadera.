using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class Hacienda
    {
        public int Id { get; set; }
        public string NombreHacienda { get; set; }
        public string PresentacionHacienda { get; set; }
        public int Hectareas { get; set; }
        public string TipoTerreno { get; set; }
        public string FotoHacienda { get; set; }
        public string Estado { get; set; }
        public string Observaciones { get; set; }
        public string TipoProduccion { get; set; }
        public int CapacidadAnimales { get; set; }
        public string NombreCiudad { get; set; }
        public string Departamento { get; set; }
        public int CantidadGerentes { get; set; }
        public int CantidadTrabajadores { get; set; }
        public int CantidadAreas { get; set; }


    }
}