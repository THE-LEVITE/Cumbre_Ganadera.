using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class RegistroUsuarioL
    {
        RegistroUsuarioD oRegistroD = new RegistroUsuarioD();

        public int MTRegistro(RegistroUsuario oRegistro)
        {
            int oRegistroUser = oRegistroD.MTRegistro(oRegistro);
            return oRegistroUser;
        }

        public int MTRegistroGerente(RegistroUsuario oRegistroGer)
        {   
            int oRegistroGerente = oRegistroD.MTInsertarGerente(oRegistroGer);
            return oRegistroGerente;
        }
    }
}