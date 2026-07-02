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
        private int idHacienda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int IdTrabajador = Convert.ToInt32(Session["Id"]);
                Usuario oGerente = new Usuario { Id = IdTrabajador };
                List<Hacienda> listHacienda = oHaciL.MTDueñoHacienda(oGerente);
                Hacienda oHacienda = listHacienda.FirstOrDefault();
                idHacienda = oHacienda.Id;

                Session["IdHacienda"] = idHacienda;
            }
            else
            {
                if (Session["IdHacienda"] != null)
                {
                    idHacienda = Convert.ToInt32(Session["IdHacienda"]);
                }
            }
        }

        public void MtCargarTablaHerramienta()
        {
            List<Recurso> listHerramienta = oHaciL.MtEncontrarHerramientaL(idHacienda);

            lblNumeroHerramientas.Text = Convert.ToString(listHerramienta.Count);


            if (listHerramienta.Count > 0)
            {
                gvTablaHerramienta.DataSource = listHerramienta;
                gvTablaHerramienta.DataBind();
                lblSinRecurso.Visible = false;
                lblSinTipoRecurso.Visible = false;
                tablaInsumo.Visible = false;
                tablaHerramienta.Visible = true;
                tablaMaquinaria.Visible = false;

            }
            else
            {
                lblSinRecurso.Visible = true;
                lblSinTipoRecurso.Visible = false;
                tablaInsumo.Visible = false;
                tablaHerramienta.Visible = false;
                tablaMaquinaria.Visible = false;


            }
        }
        public void MtCargarTablaInsumo()
        {
            List<Recurso> listInsumo = oHaciL.MtEncontrarInsumoL(idHacienda);

            lblNumeroInsumos.Text = Convert.ToString(listInsumo.Count);

            if (listInsumo.Count > 0)
            {
                gvTablaInsumo.DataSource = listInsumo;
                gvTablaInsumo.DataBind();
                lblSinRecurso.Visible = false;
                lblSinTipoRecurso.Visible = false;
                tablaInsumo.Visible = true;
                tablaHerramienta.Visible = false;
                tablaMaquinaria.Visible = false;
            }
            else
            {
                lblSinRecurso.Visible = true;
                lblSinTipoRecurso.Visible = false;
                tablaInsumo.Visible = false;
                tablaHerramienta.Visible = false;
                tablaMaquinaria.Visible = false;

            }
        }
        public void MtCargarTablaMaquinaria()
        {
            List<Recurso> listMaquina = oHaciL.MtEncontrarMaquinariaL(idHacienda);

            lblNumeroMaquinaria.Text = Convert.ToString(listMaquina.Count);

            if (listMaquina.Count > 0)
            {
                gvTablaMaquinaria.DataSource = listMaquina;
                gvTablaMaquinaria.DataBind();
                lblSinRecurso.Visible = false;
                lblSinTipoRecurso.Visible = false;
                tablaInsumo.Visible = false;
                tablaHerramienta.Visible = false;
                tablaMaquinaria.Visible = true;
            }
            else
            {
                lblSinRecurso.Visible = true;
                lblSinTipoRecurso.Visible = false;
                tablaInsumo.Visible = false;
                tablaHerramienta.Visible = false;
                tablaMaquinaria.Visible = false;

            }
        }

        protected void ddlTipoRecurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tipoRecurso = ddlTipoRecurso.SelectedValue;

            switch (tipoRecurso)
            {
                case "Insumo":
                    MtCargarTablaInsumo();
                    gvTablaInsumo.PageIndex = 0;
                    break;

                case "Herramienta":
                    gvTablaHerramienta.PageIndex = 0;
                    MtCargarTablaHerramienta();
                    break;

                case "Maquinaria":
                    gvTablaMaquinaria.PageIndex = 0;
                    MtCargarTablaMaquinaria();
                    break;

                case "":
                    lblSinRecurso.Visible = false;
                    lblSinTipoRecurso.Visible = true;
                    tablaInsumo.Visible = false;
                    tablaHerramienta.Visible = false;
                    tablaMaquinaria.Visible = false;
                    break;
            }
            
        }
        protected void gvTablaInsumo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTablaInsumo.PageIndex = e.NewPageIndex;
            MtCargarTablaInsumo();
        }

        protected void gvTablaHerramienta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTablaHerramienta.PageIndex = e.NewPageIndex;
            MtCargarTablaHerramienta();
        }

        protected void gvTablaMaquinaria_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTablaMaquinaria.PageIndex = e.NewPageIndex;
            MtCargarTablaMaquinaria();
        }
    }
}