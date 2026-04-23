using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Estado { get; set; }      
        public int CantidadRoles { get; set; }
        public string Email { get; set; }
        public string PasswordUser { get; set; }
    }
}