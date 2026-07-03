using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Trabajador
{
    public partial class TareasTrabajador : System.Web.UI.Page
    {
        private static TareasL oTareaL = new TareasL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MtCargarTareas();
            }
        }
        public void MtCargarTareas()
        {
            int idTrabajador = Convert.ToInt32(Session["Id"]);

            List<TareasM> listTareas = oTareaL.MtConsultarTareasL(idTrabajador);

            if (listTareas.Count > 0)
            {
                gvTareasTrabajador.DataSource = listTareas;
                gvTareasTrabajador.DataBind();
                lblSintareas.Visible = false;
                divTablaTareas.Visible = true;
                lblTotalTareas.Text = listTareas.Count.ToString(); 
                spanContador.Visible = true;
            }
            else
            {
                lblSintareas.Visible = true;
                lblSintareas.Visible = true;
                divTablaTareas.Visible = false;
                lblTotalTareas.Text = "0"; 
                spanContador.Visible = true;
            }

        }

        protected void gvTareasTrabajador_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTareasTrabajador.PageIndex = e.NewPageIndex;
            MtCargarTareas();
        }
    }
}