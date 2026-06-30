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

        public List<Reporte> MtSolicitudGerenteL(int idGerente)
        {
            return oDatosHacienda.MtSolicitudGerenteD(idGerente);
        }

        public List<Reporte> MtRespuestaSolicitudL(int idSoli) 
        {
            return oDatosHacienda.MtRespuestaSolicitudD(idSoli);
        }

        public int MtCrearSolicitudL(Reporte oReport,int idGerente,int idHacienda)
        {
            return oDatosHacienda.MtCrearSolicitudD(oReport, idGerente, idHacienda);
        }

        public List<Producto> MtCargarTipoProductoL()
        {
            return oDatosHacienda.MtCargarTipoProductoD();
        }
        public List<Producto> MtCargarProductoL(int idHacienda)
        {
            return oDatosHacienda.MtCargarProductoD(idHacienda);
        }

        public Producto MtTraerProductoL(int idProducto)
        {
            return oDatosHacienda.MtTraerProductoD(idProducto);
        }

        public int MtCrearProductoL(int idHacienda,Producto oProduct,int idTipo)
        {
            return oDatosHacienda.MtCrearProductoD(idHacienda, oProduct, idTipo);
        }
        public int MtEditarProductoL(int IdProducto, Producto oProduct,int idTipo)
        {
            return oDatosHacienda.MtEditarProductoD(IdProducto, oProduct, idTipo);
        }

        public bool MtEliminarProductoL(int idProducto)
        {
            return oDatosHacienda.MtEliminarProductoD(idProducto);
        }

        public List<Recurso> MtEncontrarInsumoL(int idHacienda)
        {
            return oDatosHacienda.MtEncontrarInsumoD(idHacienda);
        }

    }
}