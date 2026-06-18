using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class HaciendaL
    {
        HaciendaD oDatosHacienda = new HaciendaD();
        public List<Hacienda> MTDueñoHacienda(Usuario oDueño)
        {
            List<Hacienda> listaHaciendas = oDatosHacienda.MTDueñoHacienda(oDueño);
            return listaHaciendas;
        }

        public List<Hacienda> MTCantidades(int haciendaId)
        {
            List<Hacienda> cantidades = oDatosHacienda.MTObtenerCantidades(haciendaId);
            return cantidades;
        }
    }
}