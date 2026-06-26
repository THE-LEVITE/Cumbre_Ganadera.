using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class TareasL
    {
        TareasD oTareasD = new TareasD();
        public List<TareasM> MtObtenerTareas()
        {
            List<TareasM> oTareas = oTareasD.MtObtenerTareasGerente();
            return oTareas;
        }
    }
}