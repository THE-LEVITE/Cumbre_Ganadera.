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
        //Instaciamos la clase UsuarioD y creamos un nuevo objeto llamado oUsuarioD
        UsuarioD oUsuarioD = new UsuarioD();

        //Se crea un nuevo metodo con la clase Usuario llamando los datos de password y email
        public Usuario MtLoginUsuario(DatosLoginUser oUsuario)
        {
            //Asignamos a oUser el retorno de UsuarioD
            Usuario oUser = oUsuarioD.MtLogin(oUsuario);
            //Se retorna los datos del usuario
            return oUser;

        }



        public Usuario MtRecuperarContraseña(string correo)
        {
            Usuario oPass = oUsuarioD.MtRecuperarContraseña(correo);

            return oPass;
        }

    }
}