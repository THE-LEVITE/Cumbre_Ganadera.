using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class RecursoL
    {
        RecursoD oRecursoD = new RecursoD();

        public List<Recurso> MTConsultarRecursos()
        {
            return oRecursoD.MTConsultarRecursos();
        }
        public void MTRegistarRecurso(Recurso oRecurso)
        {
            RecursoD oRecursosD = new RecursoD();
            oRecursosD.MTRegistrarRecurso(oRecurso);
        }
        public void MTEditarRecurso(Recurso oRecurso)
        {
            RecursoD oRecursoD = new RecursoD();
            oRecursoD.MTEditarRecurso(oRecurso);
        }

        public Recurso MTConsultarRecursoPorId(int id, int tipoRecurso)
        {
            RecursoD oRecursoD = new RecursoD();
            return oRecursoD.MTConsultarRecursoPorId(id, tipoRecurso);
        }
        public void MTEliminarRecurso(Recurso oRecurso)
        {
            RecursoD oRecursoD = new RecursoD();
            oRecursoD.MTEliminarRecurso(oRecurso);
        }
        public List<Recurso> MTBuscarRecursos(string buscar)
        {
            RecursoD oRecursoD = new RecursoD();

            return oRecursoD.MTBuscarRecursos(buscar);
        }
    }
}