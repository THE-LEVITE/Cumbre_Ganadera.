using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;

namespace CumbreGanadera.Vista.Auth
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Validar que los textos tengan datos
            if (!string.IsNullOrEmpty(txtCorreo.Text) && !string.IsNullOrEmpty(txtPassword.Text))
            {
                DatosLoginUser oLoginUser = new DatosLoginUser()
                {
                    Email = txtCorreo.Text,
                    PasswordUser = txtPassword.Text,
                };

                UsuarioL oUsuarioL = new UsuarioL();
                Usuario oUsuarioDatos = oUsuarioL.MtLoginUsuario(oLoginUser);

                //if () 
                //{

                //}

            }
        }
    }
}