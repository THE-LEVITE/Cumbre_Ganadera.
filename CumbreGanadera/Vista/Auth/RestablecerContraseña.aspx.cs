using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Auth
{
    public partial class RestablecerContraeña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlCodigo.Visible = true;
                pnlPassword.Visible = false;
            }

            if (Session["CodigoValidado"] != null)
            {
                pnlCodigo.Visible = false;
                pnlPassword.Visible = true;
            }
        }

        protected void btnValidarCodigo_Click(object sender, EventArgs e)
        {
            string correo = Session["CorreoRecuperacion"].ToString();

            UsuarioL oUsuarioL = new UsuarioL();

            Usuario usuario = oUsuarioL.MtValidarCodigoRecuperacion(correo);

            if (usuario == null)
            {
                return;
            }

            if (txtCodigo.Text.Trim() == usuario.CodigoRecuperacion)
            {
                Session["CodigoValidado"] = true;

                pnlCodigo.Visible = false;
                pnlPassword.Visible = true;

                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "Ok",
                    "Swal.fire('Correcto','Código válido','success');",
                    true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "error",
                    "Swal.fire('Error','Código incorrecto','error');",
                    true);
            }
        }

        protected void btnRestablecer_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNewPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmarPassword.Text))
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "campos",
                    "Swal.fire('Atención','Debe completar todos los campos','warning');",
                    true);

                return;
            }

            if (txtNewPassword.Text != txtConfirmarPassword.Text)
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "pass",
                    "Swal.fire('Error','Las contraseñas no coinciden','error');",
                    true);

                return;
            }

            string correo = Session["CorreoRecuperacion"].ToString();

            UsuarioL oUsuarioL = new UsuarioL();

            oUsuarioL.MtActualizarPassword(
                correo,
                txtNewPassword.Text
            );

            Session.Remove("CorreoRecuperacion");
            Session.Remove("CodigoValidado");

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "ok",
                @"
                Swal.fire({
                    icon: 'success',
                    title: 'Contraseña actualizada',
                    text: 'Ya puede iniciar sesión con su nueva contraseña'
                }).then(() => {
                    window.location='InicioSesion.aspx';
                });
                ",
                true);
        }
    }
}