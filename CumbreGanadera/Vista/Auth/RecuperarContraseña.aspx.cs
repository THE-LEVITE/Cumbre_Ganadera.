
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;

namespace CumbreGanadera.Vista.Auth
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string correo = txtCorreoRec.Text;

            UsuarioL oUsuarioL = new UsuarioL();
            Usuario usuario = oUsuarioL.MtRecuperarContraseña(correo);

            if (usuario == null)
            {
                Response.Write("El correo no existe");
                return;
            }

            Random random = new Random();
            string codigo = random.Next(100000, 999999).ToString();
           
            oUsuarioL.MtGuardarCodigoRecuperacion(
                usuario.Email,
                codigo
            );

            Session["CorreoRecuperacion"] = usuario.Email;

            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("mesiasgoat777@gmail.com");
            mail.To.Add(usuario.Email);

            mail.Subject = "Recuperación de Contraseña - Cumbre Ganadera";

            mail.IsBodyHtml = true;

            mail.Body = $@"
            <html>
            <body style='font-family: Arial, sans-serif; background-color:#f4f4f4; padding:20px;'>

            <div style='max-width:600px;
            margin:auto;
            background:white;
            border-radius:10px;
            padding:30px;
            box-shadow:0px 0px 10px rgba(0,0,0,0.1);'>

            <h2 style='color:#198754;text-align:center;'>
            Recuperación de Contraseña
            </h2>

            <p>Hola,</p>

             <p>
                Hemos recibido una solicitud para restablecer la contraseña de tu cuenta.
            </p>

             <p>
            Utiliza el siguiente código de verificación:
            </p>

            <div style='text-align:center; margin:25px 0;'>

            <span style='
            background:#198754;
            color:white;
            padding:15px 30px;
            font-size:28px;
            font-weight:bold;
            border-radius:8px;
            letter-spacing:3px;'>

            {codigo}

            </span>            

            </div>

            <p>
            Ingresa este código en la página de restablecimiento de contraseña.
            </p>

            <p style='color:#888;font-size:13px;'>
            Si no solicitaste este cambio, puedes ignorar este correo.
            </p>

            <hr>

            <p style='font-size:12px;color:#999;text-align:center;'>
            Cumbre Ganadera © {DateTime.Now.Year}
            </p>

            </div>

            </body>
            </html>";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;

            smtp.Credentials = new NetworkCredential(
                "mesiasgoat777@gmail.com",
                "qousnbnvolyairrq"
            );
            try
            {
                smtp.Send(mail);

                string script = @"
            Swal.fire({
            icon: 'success',
            title: 'Código enviado',
            text: 'Revisa tu correo electrónico.',
            confirmButtonText: 'Continuar'
            }).then((result) => {
            window.location='RestablecerContraseña.aspx';
            });";

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "alerta",
                    script,
                    true
                );

            }
            catch (Exception ex)
            {
                string script = $@"
            Swal.fire(
            'Error',
            '{ex.Message}',
            'error'
            );";

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "error",
                    script,
                    true
                );
            }
        }
    }
}