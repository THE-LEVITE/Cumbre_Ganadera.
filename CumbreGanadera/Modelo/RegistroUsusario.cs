using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class RegistroUsuario
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Documento { get; set; }
        public string TipoDocumento { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public string Password { get; set; }
        public string ConfimarContraseña { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public DateTime FechaIngreso { get; set; }
        public string Ciudad { get; set; }
        public string Departamento { get; set; }
        public int Rol { get; set; }
        public string Area { get; set; }
        public DateTime FechaAsignacion { get; set; }
        public int IdHacienda { get; set; }
    }
}