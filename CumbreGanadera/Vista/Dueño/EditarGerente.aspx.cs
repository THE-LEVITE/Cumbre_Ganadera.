using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Dueño
{
    public partial class EditarGerente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ResumenHacienda oResumenHacienda = new ResumenHacienda();

            int IdGerente = oResumenHacienda.MTGerenteEditar();
        }
    }
}