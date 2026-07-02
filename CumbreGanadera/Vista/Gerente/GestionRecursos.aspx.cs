using CumbreGanadera.Datos;
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
    public partial class GestionRecursos : System.Web.UI.Page
    {
        private int IdRecurso
        {
            get
            {
                return ViewState["IdRecurso"] == null ? 0 : Convert.ToInt32(ViewState["IdRecurso"]);
            }
            set
            {
                ViewState["IdRecurso"] = value;
            }
        }

        private int TipoRecursoEditar
        {
            get
            {
                return ViewState["TipoRecursoEditar"] == null ? 0 : Convert.ToInt32(ViewState["TipoRecursoEditar"]);
            }
            set
            {
                ViewState["TipoRecursoEditar"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRecursos();
            }
        }
        private void CargarRecursos()
        {
            RecursoL oRecursoL = new RecursoL();

            List<Recurso> listaRecursos = oRecursoL.MTConsultarRecursos();

            gvRecursos.DataSource = listaRecursos;
            gvRecursos.DataBind();

            lblTotal.Text = listaRecursos.Count.ToString();

            lblTotalInsumos.Text = listaRecursos
                .Where(x => x.Categoria == "Insumo")
                .Count()
                .ToString();

            lblTotalHerramientas.Text = listaRecursos
                .Where(x => x.Categoria == "Herramienta")
                .Count()
                .ToString();

            lblTotalMaquinaria.Text = listaRecursos
                .Where(x => x.Categoria == "Maquinaria")
                .Count()
                .ToString();

            lblOperativos.Text = listaRecursos
                .Where(x => x.Estado == "Bueno")
                .Count()
                .ToString();

            lblMantenimiento.Text = listaRecursos
                .Where(x => x.Estado == "Regular")
                .Count()
                .ToString();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(
          this,
          GetType(),
          "AbrirModal",
          @"
        var modal = new bootstrap.Modal(document.getElementById('modalRecurso'));
        modal.show();
        ",
          true);
        }

        protected void ddlTipoRecurso_SelectedIndexChanged1(object sender, EventArgs e)
        {
            pnlCampos.Visible = true;

            pnlCantidad.Visible = false;
            pnlEstado.Visible = false;
            pnlMarca.Visible = false;

            ddlTipo.Items.Clear();

            if (ddlTipoRecurso.SelectedValue == "1")
            {
                // INSUMO

                pnlCantidad.Visible = true;

                ddlTipo.Items.Add(new ListItem("Seleccione...", ""));
                ddlTipo.Items.Add(new ListItem("Alimento", "1"));
                ddlTipo.Items.Add(new ListItem("Medicamento", "2"));
                ddlTipo.Items.Add(new ListItem("Fertilizante", "3"));
                ddlTipo.Items.Add(new ListItem("Semilla", "4"));
            }
            else if (ddlTipoRecurso.SelectedValue == "2")
            {
                // HERRAMIENTA

                pnlEstado.Visible = true;

                ddlTipo.Items.Add(new ListItem("Seleccione...", ""));
                ddlTipo.Items.Add(new ListItem("Manual", "1"));
                ddlTipo.Items.Add(new ListItem("Eléctrica", "2"));
                ddlTipo.Items.Add(new ListItem("Agrícola", "3"));
            }
            else if (ddlTipoRecurso.SelectedValue == "3")
            {
                // MAQUINARIA

                pnlEstado.Visible = true;
                pnlMarca.Visible = true;

                ddlTipo.Items.Add(new ListItem("Seleccione...", ""));
                ddlTipo.Items.Add(new ListItem("Tractor", "1"));
                ddlTipo.Items.Add(new ListItem("Cosechadora", "2"));
                ddlTipo.Items.Add(new ListItem("Fumigadora", "3"));
            }

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "modal",
                "var modal = new bootstrap.Modal(document.getElementById('modalRecurso')); modal.show();",
                true);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            IdRecurso = Convert.ToInt32(btn.CommandArgument);
            TipoRecursoEditar = Convert.ToInt32(btn.CommandName);

            RecursoL oRecursoL = new RecursoL();

            Recurso oRecurso = oRecursoL.MTConsultarRecursoPorId(IdRecurso, TipoRecursoEditar);

            ddlTipoRecurso.SelectedValue = TipoRecursoEditar.ToString();

            ddlTipoRecurso_SelectedIndexChanged1(null, null);

            txtNombre.Text = oRecurso.Nombre;
            txtDescripcion.Text = oRecurso.Descripcion;

            ddlTipo.SelectedValue = oRecurso.IdTipo.ToString();

            if (TipoRecursoEditar == 1)
            {
                txtCantidad.Text = oRecurso.Cantidad.ToString();
            }
            else if (TipoRecursoEditar == 2)
            {
                ddlEstado.SelectedValue = oRecurso.Estado;
            }
            else
            {
                ddlEstado.SelectedValue = oRecurso.Estado;
                txtMarca.Text = oRecurso.Marca;
            }

            btnGuardar.Text = "Actualizar";

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "modal",
                @"var modal = new bootstrap.Modal(document.getElementById('modalRecurso'));
                modal.show();",
                true);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ddlTipoRecurso.SelectedValue == "")
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "error",
                    "Swal.fire('Atención','Seleccione el tipo de recurso','warning');",
                    true);
                return;
            }

            // Validar tipo
            if (ddlTipo.SelectedValue == "")
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "error",
                    "Swal.fire('Atención','Seleccione el tipo','warning');",
                    true);
                return;
            }

            // ===== ESTA PARTE TE FALTA =====
            Recurso oRecurso = new Recurso();

            oRecurso.TipoRecurso = Convert.ToInt32(ddlTipoRecurso.SelectedValue);
            oRecurso.Nombre = txtNombre.Text.Trim();
            oRecurso.Descripcion = txtDescripcion.Text.Trim();
            oRecurso.IdTipo = Convert.ToInt32(ddlTipo.SelectedValue);
            oRecurso.IdHacienda = Convert.ToInt32(Session["IdHacienda"]);

            if (oRecurso.TipoRecurso == 1)
            {
                oRecurso.Cantidad = Convert.ToInt32(txtCantidad.Text);
            }
            else if (oRecurso.TipoRecurso == 2)
            {
                oRecurso.Estado = ddlEstado.SelectedValue;
            }
            else
            {
                oRecurso.Estado = ddlEstado.SelectedValue;
                oRecurso.Marca = txtMarca.Text.Trim();
            }

            // ===============================

            RecursoL oRecursoL = new RecursoL();

            if (IdRecurso == 0)
            {
                oRecursoL.MTRegistarRecurso(oRecurso);

                ScriptManager.RegisterStartupScript(
     this,
     GetType(),
     "ok",
     @"
    Swal.fire({
        icon: 'success',
        title: 'Correcto',
        text: 'Recurso registrado correctamente',
        timer: 2000,
        showConfirmButton: false,
        allowOutsideClick: false
    });

    setTimeout(function () {
        window.location.href = window.location.pathname;
    }, 2000);
    ",
     true);
            }
            else
            {
                oRecurso.Id = IdRecurso;

                oRecursoL.MTEditarRecurso(oRecurso);
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "ok",
                    @"
    Swal.fire({
        icon: 'success',
        title: 'Correcto',
        text: 'Recurso actualizado correctamente',
        timer: 2000,
        showConfirmButton: false,
        allowOutsideClick: false
    });

    setTimeout(function () {
        window.location.href = window.location.pathname;
    }, 2000);
    ",
                    true);

                IdRecurso = 0;
                TipoRecursoEditar = 0;
                btnGuardar.Text = "Guardar";
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            Recurso oRecurso = new Recurso();

            oRecurso.Id = Convert.ToInt32(btn.CommandArgument);
            oRecurso.TipoRecurso = Convert.ToInt32(btn.CommandName);

            RecursoL oRecursoL = new RecursoL();

            oRecursoL.MTEliminarRecurso(oRecurso);

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "ok",
                @"
        Swal.fire({
            icon: 'success',
            title: 'Correcto',
            text: 'Recurso eliminado correctamente',
            timer: 2000,
            showConfirmButton: false
        });

        setTimeout(function () {
            window.location.href = window.location.pathname;
        }, 2000);
        ",
                true);
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            RecursoL oRecursoL = new RecursoL();

            if (string.IsNullOrWhiteSpace(txtBuscar.Text))
            {
                CargarRecursos();
                return;
            }

            List<Recurso> lista = oRecursoL.MTBuscarRecursos(txtBuscar.Text.Trim());

            gvRecursos.DataSource = lista;
            gvRecursos.DataBind();
        }
    }
}



