using CumbreGanadera.Modelo;
using CumbreGanadera.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class TareasL
    {
        TareasD oTareasD = new TareasD();
        public List<TareasM> MtObtenerTareas(int IdGerente)
        {
            List<TareasM> oTareas = oTareasD.MtObtenerTareasGerente(IdGerente);
            return oTareas;
        }

        public int MtRegistrarTareas(TareasM oTareas, int idTrabajador)
        {
            int Verificacion = oTareasD.MtRegistrarTarea(oTareas, idTrabajador);
            return Verificacion;
        }

        public int MtEditarTarea(TareasM oTareas)
        {
            int Verificacion = oTareasD.MtEditarTarea(oTareas);
            return Verificacion;
        }

        public int MtEliminarTarea(int IdTarea)
        {
            int Verificacion = oTareasD.MtEliminarTarea(IdTarea);
            return Verificacion;
        }

        public List<Sector> MtObtenerSectores(int IdGerente)
        {
            List<Sector> listaSectores = oTareasD.MtObtenerSectores(IdGerente);
            return listaSectores;
        }

        public List<Usuario> MtobtenerTrabajadores(int IdGerente)
        {
            List<Usuario> listaTrabajadores = oTareasD.MtObtenerTrabajadores(IdGerente);
            return listaTrabajadores;
        }
    }
}