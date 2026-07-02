using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class Pago
    {
        public int Id { get; set; }
        public decimal Valor { get; set; }
        public string Moneda { get; set; }
        public string Referencia { get; set; }
        public DateTime Fecha { get; set; }
        public string IdTransaccionWompi { get; set; }
        public string Estado { get; set; }
    }
}