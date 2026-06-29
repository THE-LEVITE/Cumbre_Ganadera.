using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

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

            // Correo que confirma el cmabio de contraseña
            try
            {
                MailMessage mail = new MailMessage();

                mail.From = new MailAddress("mesiasgoat777@gmail.com");
                mail.To.Add(correo);

                mail.Subject = "Contraseña actualizada correctamente";

                mail.Body = @"
                <html>
                <body style='font-family: Arial, sans-serif;'>

                <h2 style='color:#198754;'>
                ✅ Contraseña actualizada
                </h2>

                <p>Hola,</p>

                <p>
                Le informamos que la contraseña de su cuenta en
                <strong>Cumbre Ganadera</strong>
                ha sido actualizada correctamente.
                </p>

                <p>
                Si usted realizó este cambio, no necesita realizar ninguna acción adicional.
                </p>

                <p>
                 Este mensaje es únicamente informativo. Si usted no solicitó este cambio, puede ignorar este correo.
                </p>

                <hr>

            <p style='color:gray;font-size:12px;'>
            Este es un mensaje automático. Por favor no responda este correo.
            </p>

            </body>
            </html>";

                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;

                smtp.Credentials = new NetworkCredential(
                    "mesiasgoat777@gmail.com",
                    "qousnbnvolyairrq"
                );

                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }

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
