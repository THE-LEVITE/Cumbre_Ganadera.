using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class MenuL
    {

        private MenuD oMenuD = new MenuD();
        public List<MenuM> MTMenus(int IdRol)
        {
            List<MenuM> Menus = oMenuD.MtOpciones(IdRol);
            return Menus;
        }

    }
}