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

        public List<Usuario> MtLoginUsuario(DatosLoginUser oUsuario)
        {
            List<Usuario> ltUser = oUsuarioD.MtLogin(oUsuario);
            return ltUser;

        }
        public Usuario MtRecuperarContraseña(string correo)
        {
            Usuario oPass = oUsuarioD.MtRecuperarContraseña(correo);
            return oPass;
        }
        public Usuario MtValidarCodigoRecuperacion(string correo)
        {
            Usuario oValidar = oUsuarioD.MtValidarCodigoRecuperacion(correo);
            return oValidar;
        }
        public void MtGuardarCodigoRecuperacion(string correo, string codigo)
        {
            oUsuarioD.MtGuardarCodigoRecuperacion(correo, codigo);
        }
        public void MtActualizarPassword(string correo, string password)
        {
            oUsuarioD.MtActualizarPassword(correo, password);
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

        public int MTEliminarUsuario(int IdUsuario)
        {
            int filas = oUsuarioD.MTEliminarUsuario(IdUsuario);
            return filas;
        }
        public Usuario MTObtenerGerente(int IdGerenteEditar)
        {
            Usuario InformacionGerente = oUsuarioD.MTObtenerEditarGerente(IdGerenteEditar);
            return InformacionGerente;
        }

        public int MTEditarGerente(Usuario oGerente)
        {
            int filas = oUsuarioD.MTEditarGerente(oGerente);
            return filas;
        }
    }
}