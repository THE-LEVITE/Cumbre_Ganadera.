using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Gerente
{
    public partial class GestionProductos : System.Web.UI.Page
    {
        public static HaciendaL oHaciL = new HaciendaL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MtCargarTipoProducto();
                MtCargarProductos();
            }
        }

        public void MtCargarTipoProducto()
        {
            List<Producto> listProducto = oHaciL.MtCargarTipoProductoL();

            ddlTipoProducto.DataSource = listProducto;
            ddlTipoProducto.DataTextField = "NombreTipo";
            ddlTipoProducto.DataValueField = "IdTipo";
            ddlTipoProducto.DataBind();
            ddlTipoProducto.Items.Insert(0, new ListItem("-- Seleccione un tipo de producto --", "0"));



            ddlTipoProductoEdit.DataSource = listProducto;
            ddlTipoProductoEdit.DataTextField = "NombreTipo";
            ddlTipoProductoEdit.DataValueField = "IdTipo";
            ddlTipoProductoEdit.DataBind();
            ddlTipoProductoEdit.Items.Insert(0, new ListItem("-- Seleccione un tipo de producto --", "0"));
        }

        public void MtCargarProductos()
        {
            int idGerente = Convert.ToInt32(Session["Id"]);

            List<Hacienda> listHacienda = oHaciL.MTDueñoHacienda(idGerente);

            Hacienda oHacienda = listHacienda.FirstOrDefault();

            int idHacienda = oHacienda.Id;

            List<Producto> listProducto = oHaciL.MtCargarProductoL(idHacienda);

            gvProductos.DataSource = listProducto;
            gvProductos.DataBind();

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            int idGerente = Convert.ToInt32(Session["Id"]);

            List<Hacienda> listHacienda = oHaciL.MTDueñoHacienda(idGerente);

            Hacienda oHacienda = listHacienda.FirstOrDefault();

            int idHacienda = oHacienda.Id;

            string idTipoEdit = ddlTipoProducto.SelectedValue;
            int idTipo = Convert.ToInt32(idTipoEdit);

            if (idTipo == 0)
            {
                MostrarMensaje("Error de campos", "Se debe elegir un tipo de producto para crear un producto", "info");
                return;
            }
            else if (string.IsNullOrWhiteSpace(txtCodigo.Value) || string.IsNullOrWhiteSpace(txtNombreProducto.Value) || string.IsNullOrWhiteSpace(txtPrecioProducto.Value)
                || string.IsNullOrWhiteSpace(txtDescripcion.Value) || string.IsNullOrWhiteSpace(txtCantidad.Value))
            {
                MostrarMensaje("Error de campos", "Se deben de llenar todos los campos para crear un producto", "info");
                return;
            }
            else
            {
                Producto oProduct = new Producto()
                {
                    Codigo = txtCodigo.Value,
                    Nombre = txtNombreProducto.Value,
                    Precio = Convert.ToDouble(txtPrecioProducto.Value),
                    Descripcion = txtDescripcion.Value,
                    StockDisponible = Convert.ToInt32(txtCantidad.Value)
                };

                int num = oHaciL.MtCrearProductoL(idHacienda, oProduct, idTipo);

                if (num > 0)
                {
                    MostrarMensaje("Producto Creado", "El producto se creo correctamente", "success");

                    MtCargarProductos();
                    txtCodigo.Value = "";
                    txtNombreProducto.Value = "";
                    txtPrecioProducto.Value = "";
                    txtDescripcion.Value = "";
                    txtCantidad.Value = "";
                    ddlTipoProducto.SelectedIndex = 0;
                }
                else
                {
                    MostrarMensaje("Error al crear", "Hubo un error al crear el producto", "error");
                }

            }

        }


        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            int IdProducto = Convert.ToInt32(Session["IdProducto"]);

            string idTipoEdit = ddlTipoProductoEdit.SelectedValue;
            int idTipo = Convert.ToInt32(idTipoEdit);

            if (idTipo == 0)
            {
                MostrarMensaje("Error de campos", "Se debe elegir nuevamente un tipo de producto para editar el producto", "info");
                return;
            }
            else if (string.IsNullOrWhiteSpace(txtCodigoEdit.Value) || string.IsNullOrWhiteSpace(txtNombreEdit.Value) || string.IsNullOrWhiteSpace(txtPrecioEdit.Value)
                || string.IsNullOrWhiteSpace(txtDescripcionEdit.Value) || string.IsNullOrWhiteSpace(txtCantidadEdit.Value))
            {
                MostrarMensaje("Error de campos", "Se deben de llenar todos los campos para editar el producto", "info");
                return;
            }
            else
            {
                Producto oProduct = new Producto()
                {
                    Codigo = txtCodigoEdit.Value,
                    Nombre = txtNombreEdit.Value,
                    Precio = Convert.ToDouble(txtPrecioEdit.Value),
                    Descripcion = txtDescripcionEdit.Value,
                    StockDisponible = Convert.ToInt32(txtCantidadEdit.Value)
                };


                int num = oHaciL.MtEditarProductoL(IdProducto, oProduct, idTipo);

                if (num > 0)
                {
                    MostrarMensaje("Producto Actualizado", "El producto se actualizo correctamente", "success");
                    MtCargarProductos();
                }
                else
                {
                    MostrarMensaje("Error al actualizar", "Hubo un error al actualizar el producto", "error");
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            string id = btn.CommandArgument;

            int idProducto = Convert.ToInt32(id);

            Session["IdProducto"] = idProducto;

            Producto oProduct = oHaciL.MtTraerProductoL(idProducto);

            txtCodigoEdit.Value = oProduct.Codigo;
            txtNombreEdit.Value = oProduct.Nombre;
            txtPrecioEdit.Value = Convert.ToString(oProduct.Precio);
            txtDescripcionEdit.Value = oProduct.Descripcion;
            txtCantidadEdit.Value = Convert.ToString(oProduct.StockDisponible);

            string script = @"
                var modalElement = document.getElementById('modalEditar');
                var modal = new bootstrap.Modal(modalElement);
                modal.show();";

            ClientScript.RegisterStartupScript(this.GetType(), "AbrirModalEditar", script, true);

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            string id = btn.CommandArgument;

            int idProducto = Convert.ToInt32(id);

            bool delete = oHaciL.MtEliminarProductoL(idProducto);

            if (delete)
            {
                MostrarMensaje("Eliminar Producto", "El producto se elimino correctamente", "success");
                MtCargarProductos();
            }
            else
            {
                MostrarMensaje("Error al Eliminar", "Hubo un error al eliminar el producto", "error");
            }

        }


        protected void gvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProductos.PageIndex = e.NewPageIndex;
            MtCargarProductos();
        }

        private void MostrarMensaje(string titulo, string mensaje, string icono)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensaje",
                $"Swal.fire({{ title: '{titulo}', text: '{mensaje}', icon: '{icono}' }});", true);
        }
    }
}