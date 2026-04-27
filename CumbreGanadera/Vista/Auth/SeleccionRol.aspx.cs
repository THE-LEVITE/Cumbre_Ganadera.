using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Auth
{
    public partial class SelecionRol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDueño_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Dueño/InicioDueño.aspx");
        }

        protected void btnGerente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Gerente/InicioGerente.aspx");
        }

        protected void btnTrabajdor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Trabajador/InicioTrabajador.aspx");
        }

        protected void btnCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/InicioCliente.aspx");

        }
    }
}