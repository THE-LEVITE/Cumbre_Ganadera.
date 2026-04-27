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

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string correo = txtCorreoRec.Text;

            UsuarioL oUsuarioL = new UsuarioL();
            Usuario usuario = oUsuarioL.MtRecuperarContraseña(correo);

            if (usuario == null)
            {
                Console.WriteLine("El correo no existe");
                return;
            }

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("mesiasgoat777@gmail.com"); // CORREO REAL
            mail.To.Add(usuario.Email);
            mail.Subject = "Recuperación de Contraseña";
            mail.Body = "Tu contraseña es: " + usuario.Password;

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
                Response.Write("Correo enviado exitosamente.");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }

        }
    }
}