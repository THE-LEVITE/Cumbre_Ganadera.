using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class Producto
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Codigo { get; set; }        
        public double Precio { get; set; }
        public string Descripcion { get; set; }
        public double Calificacion { get; set; }
        public int StockDisponible{ get; set; }
        public string FotoProducto { get; set; } 

    }
}