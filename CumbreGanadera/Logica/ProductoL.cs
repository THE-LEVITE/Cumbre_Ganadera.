using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Logica
{
    public class ProductoL
    {

        ProductoD oPrudocutoD = new ProductoD();
        public List<Producto> MtBusqueda(DatosLoginUser oBusquedaProducto)
        {

            List<Producto> listProducto = oPrudocutoD.MtBuscarProductos(oBusquedaProducto);

            return listProducto;
        }

        public List<Compra> MtBusquedaCompras(int IdUser)
        {
            List<Compra> listHistorial = oPrudocutoD.MtBuscarCompras(IdUser);
            return listHistorial;
        }
        public List<Producto> MTListarProductosHacienda(int IdHacienda)
        {
            List<Producto> listaProductos = oPrudocutoD.MTListarProductosHacienda(IdHacienda);
            return listaProductos;
        }
        public Producto MTObtenerProducto(int IdProducto)
        {
            Producto oProducto = oPrudocutoD.MTObtenerProducto(IdProducto);
            return oProducto;
        }
    }
}