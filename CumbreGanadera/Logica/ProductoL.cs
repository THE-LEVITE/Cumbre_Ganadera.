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

    }
}