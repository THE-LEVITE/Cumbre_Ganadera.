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


        public List<Reporte> MtListarReportesL(int idHacienda)
        {
            return oDatosHacienda.MtListarReportesD(idHacienda);
        }

        public string MtTraerGerenteL(int idReporte)
        {
            return oDatosHacienda.MtTraerGerenteD(idReporte);
        }

        public int MtResponderSolicutudL(Reporte oReport,int idDueño,int IdReporte, int idHacienda)
        {
            return oDatosHacienda.MtResponderSolicutudD(oReport, idDueño, IdReporte, idHacienda);
        }

        public bool MtActualizarSolicitudL(int IdReporte)
        {
            return oDatosHacienda.MtActualizarSolicitudD(IdReporte);
        }
    }
}