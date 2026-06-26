using CumbreGanadera.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Gerente.CrudTareas
{
    public partial class Tareas : System.Web.UI.Page
    {
        public void MtCargarTareas()
        {
            TareasL oTareasL = new TareasL();
            gvTareas.DataSource = oTareasL.MtObtenerTareas();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int IdGerente = (int) Session["Id"];

        }

        protected void btnAgregarTarea_Click(object sender, EventArgs e)
        {

        }

        protected void gvTareas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
               
        }
    }
}