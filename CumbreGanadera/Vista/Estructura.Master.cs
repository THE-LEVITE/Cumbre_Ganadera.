using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista
{
    public partial class Estructura : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbCerrar_Click1(object sender, EventArgs e)
        {
            // Lógica para cerrar sesión
        }

        protected void btnlupa_Click(object sender, EventArgs e)
        {


            if (!string.IsNullOrEmpty(intCampoBusqueda.Text))
            {
                // Guardar en sesión
                Session["TerminoBusqueda"] = intCampoBusqueda.Text;

              
                Response.Redirect("~/Vista/Cliente/BusquedaProducto.aspx");
            }
            else
            {
            
                Session["TerminoBusqueda"] = "";
                Response.Redirect("~/Vista/Cliente/BusquedaProducto.aspx");
            }

        }



    }
}