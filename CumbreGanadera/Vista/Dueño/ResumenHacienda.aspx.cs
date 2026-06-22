using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CumbreGanadera.Vista.Dueño
{
    public partial class ResumenHacienda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HaciendaL oHaciendaL = new HaciendaL();

                int HaciendaId = Convert.ToInt32(Session["IdHacienda"]);

                List<Hacienda> cantidades = oHaciendaL.MTCantidades(HaciendaId);

                if (cantidades != null)
                {
                    CantidadGerentes.InnerText = cantidades[0].CantidadGerentes.ToString();
                    CantidadTrabajdores.InnerText = cantidades[0].CantidadTrabajadores.ToString();
                    CantidadAreas.InnerText = cantidades[0].CantidadAreas.ToString();
                    NombreHacienda.InnerText = cantidades[0].NombreHacienda.ToString();
                }
            }

            if (!IsPostBack)
            {
                UsuarioL oHaciendaL = new UsuarioL();

                int IdHacienda = Convert.ToInt32(Session["IdHacienda"]);

                List<Usuario> gerentes = oHaciendaL.MTListaGerentes(IdHacienda);

                if (gerentes != null)
                {
                    gdGerentes.DataSource = gerentes;
                    gdGerentes.DataBind();
                }
            }
        }

        protected void btnRegistrarGerente_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistroGerente.aspx");
        }

        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {
            if (!IsPostBack)
            {
                int IdUsuario = Convert.ToInt32(e.CommandArgument);

                UsuarioL oUsuarioL = new UsuarioL();

                int FilasAfectadas = oUsuarioL.MTEliminarUsuario(IdUsuario);

                if (FilasAfectadas > 0)
                {
                    string script = "const swalWithBootstrapButtons = Swal.mixin({\r\n  customClass: {\r\n    confirmButton: \"btn btn-success\",\r\n    cancelButton: \"btn btn-danger\"\r\n  },\r\n  buttonsStyling: false\r\n});\r\nswalWithBootstrapButtons.fire({\r\n  title: \"Eliminar Gerente\",\r\n  text: \"Esta seguro de retirar este gerente del sistema?\",\r\n  icon: \"warning\",\r\n  showCancelButton: true,\r\n  confirmButtonText: \"Si, Eliminar!\",\r\n  cancelButtonText: \"No, Cancelar!\",\r\n  reverseButtons: true\r\n}).then((result) => {\r\n  if (result.isConfirmed) swalWithBootstrapButtons.fire({\r\n    title: \"Gerente eliminado\",\r\n    text: \"Gerente removido del sistema.\",\r\n    icon: \"success\"\r\n  });\r\n  else if (result.dismiss === Swal.DismissReason.cancel)\r\n /* Read more about handling dismissals below */\r\n  swalWithBootstrapButtons.fire({\r\n    title: \"Accion Detenida\",\r\n    text: \"No se realizaron cambios\",\r\n    icon: \"error\"\r\n  });\r\n});";

                    ClientScript.RegisterStartupScript(this.GetType(), "Acceso", script, true);
                    Response.Redirect(Request.RawUrl);
                }   
            }
            
        }

        protected void bntEditar_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            MTGerenteEditar(id);

            Response.Redirect("EditarGerente.aspx");
        }

        public int MTGerenteEditar(int Gerente)
        {
            int IdGerente = Gerente;
            return IdGerente;
        }
    }
}