using CumbreGanadera.Datos;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Cliente
{
    public partial class Historial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               

                if (Session["Id"] != null)
                {
                    ProductoD oProduc = new ProductoD();

                    int IdUsuario = Convert.ToInt32(Session["Id"]);

                    List<Compra> ltHistorial = oProduc.MtBuscarCompras(IdUsuario);

                    if (ltHistorial.Count > 0)
                    {
                        rptPedidos.DataSource = ltHistorial;
                        rptPedidos.DataBind();
                    }
                    else
                    {
                        lblSinCompras.Visible = true;
                    }                    
                }
                else
                {
                    lblSinId.Visible = true;
                }
            }           
        }
    }
}