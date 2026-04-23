using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class UsuarioL
    {
        UsuarioD oUsuarioD = new UsuarioD();

        public Usuario MtLoginUsuario(DatosLoginUser oUsuario)
        {

            Usuario oUser = oUsuarioD.MtLogin(oUsuario);

            return oUser;

        }

    }
}