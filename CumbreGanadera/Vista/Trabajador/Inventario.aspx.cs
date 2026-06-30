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
    public partial class Inventario : System.Web.UI.Page
    {
        public static HaciendaL oHaciL = new HaciendaL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MtCargarTablaInsumoHerramienta()
        {

        }

        protected void ddlTipoRecurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            int IdTrabajador = Convert.ToInt32(Session["Id"]);
            Usuario oGerente = new Usuario { Id = IdTrabajador };

            List<Hacienda> listHacienda = oHaciL.MTDueñoHacienda(oGerente);

            Hacienda oHacienda = listHacienda.FirstOrDefault();

            int idHacienda = oHacienda.Id;

            string tipoRecurso = ddlTipoRecurso.SelectedValue;

            switch (tipoRecurso)
            {
                case "Insumo":

                    List<Recurso> listRecurso = oHaciL.MtEncontrarInsumoL(idHacienda);

                    if (listRecurso.Count > 0)
                    {
                        gvTablaInsumo.DataSource = listRecurso;
                        gvTablaInsumo.DataBind();
                        lblSinRecurso.Visible = false;
                        lblSinTipoRecurso.Visible = false;
                        tablaInsumo.Visible = true;
                    }


                    break;

                case "Herramienta":




                    break;

                case "Maquinaria":



                    break;
                case "":
                    break;

            }
        }

        protected void gvTablaInsumo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }



        private void MostrarMensaje(string titulo, string mensaje, string icono)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensaje",
                $"Swal.fire({{ title: '{titulo}', text: '{mensaje}', icon: '{icono}' }});", true);
        }

    }
}