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
        public List<Usuario> MtLoginUsuario(DatosLoginUser oUsuario)
        {
            //Asignamos a oUser el retorno de UsuarioD
            List<Usuario> ltUser = oUsuarioD.MtLogin(oUsuario);
            //Se retorna los datos del usuario
            return ltUser;

        }
        public Usuario MtRecuperarContraseña(string correo)
        {
            Usuario oPass = oUsuarioD.MtRecuperarContraseña(correo);
            return oPass;
        }

        private UsuarioD datos = new UsuarioD();
        private UsuarioD usuarioD = new UsuarioD();

        public Usuario ObtenerPorId(int id) => usuarioD.ObtenerPorId(id);
        public bool ActualizarUsuario(Usuario usuario) => usuarioD.ActualizarUsuario(usuario);

        public List<Usuario> MTListaGerentes(int HaciendaId)
        {
            List<Usuario> gerentes = oUsuarioD.MTListarGerentes(HaciendaId);
            return gerentes;
        }
    }
}