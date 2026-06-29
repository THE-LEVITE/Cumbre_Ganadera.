using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Modelo
{
    public class Recurso
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public string Descripcion { get; set; }

        public string Categoria { get; set; }

        public string Estado { get; set; }

        public int Cantidad { get; set; }

        public string Marca { get; set; }

        public int IdTipo { get; set; }

        public int IdHacienda { get; set; }

        public string Foto { get; set; }

        public string EstadoCantidad
        {
            get
            {
                if (Categoria == "Insumo")
                    return Cantidad.ToString();

                return Estado;
            }
        }
        public int TipoRecurso { get; set; }

    }
}
