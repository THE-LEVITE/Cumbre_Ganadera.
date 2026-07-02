using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Cliente
{
    public partial class VerProducto : System.Web.UI.Page
    {
        private ProductoL oProductoL = new ProductoL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int IdProducto = Convert.ToInt32(Session["IdProducto"]);

                Producto DatosProducto = oProductoL.MTObtenerProducto(IdProducto);

                ImagenProducto.Src = "../Source/Img/ImgProductos/" + DatosProducto.FotoProducto;

                pNombreProducto.InnerText = DatosProducto.Nombre;
                pDescripcion.InnerText = DatosProducto.Descripcion;
                pPrecio.InnerText = DatosProducto.Precio.ToString();
                pCalificacion.InnerText = DatosProducto.Calificacion.ToString();

                if (DatosProducto.StockDisponible < 10)
                {
                    StockBajo.Visible = true;
                }
            }
        }
    }
}