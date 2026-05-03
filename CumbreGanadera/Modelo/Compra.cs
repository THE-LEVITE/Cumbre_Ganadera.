using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class Compra
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public double ValorCompra { get; set; }
        public DateTime FechaPedido { get; set; }
        public string Productos { get; set; }
        
       
    }
}