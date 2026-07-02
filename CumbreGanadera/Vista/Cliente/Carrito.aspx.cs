//using CumbreGanadera.Modelo;
//using CumbreGanadera.Logica;
//using CumbreGanadera.Datos;
//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Linq;
//using System.Security.Cryptography;
//using System.Text;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace CumbreGanadera.Vista.Cliente
//{
//    public partial class Carrito : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }

//        protected void btnConfirmarPedido_Click(object sender, EventArgs e)
//        {
//            string jsonCarrito = CarritoData.Value;
//            decimal total = Convert.ToDecimal(TotalPedido.Value);

//            if (decimal.TryParse(txtMonto.Text, out decimal monto) && monto > 0)
//            {
//                string publickey = ConfigurationManager.AppSettings["WompiPublicKey"];
//                string integritySecret = ConfigurationManager.AppSettings["WompiIntegritySecret"];
//                string baseUrl = ConfigurationManager.AppSettings["WompiBaseUrl"];
//                string redirectUrl = ConfigurationManager.AppSettings["WompiRedirectUrl"];
//                string currency = ConfigurationManager.AppSettings["WompiCurrency"];
//                string referencia = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 15);
//                string montoCentavo = Math.Round(monto * 100).ToString();
//                string cadenaParaFirma = referencia + montoCentavo + currency + integritySecret;
//                string firmaIntegridad = GenerarSHA256(cadenaParaFirma);

//                Pago NuevoPago = new Pago
//                {
//                    Valor = monto,
//                    Moneda = currency,
//                    Referencia = referencia,
//                    Fecha = DateTime.Now,
//                    Estado = "Pendiente"
//                };

//                PagoL oPagoL = new PagoL();

//                oPagoL.CrearPago(NuevoPago);

//                string checkoutUrl = $"{baseUrl}?public-key={publickey}&currency={currency}" +
//                    $"&amount-in-cents={montoCentavo}&reference={referencia}&signature:integrity={firmaIntegridad}" +
//                    $"&redirect-url={Server.UrlEncode(redirectUrl)}";

//                Response.Redirect(checkoutUrl, false);
//                Context.ApplicationInstance.CompleteRequest();
//            }
//            else
//            {
//                ScriptManager.RegisterStartupScript(this, GetType(), "AlertMonto",
//                    "alert('Por favor, ingrese un monto Valido que sea mayor a 0.');", true);
//            }
//        }
//        private string GenerarSHA256(string texto)
//        {
//            using (SHA256 sha256 = SHA256.Create())
//            {
//                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(texto));

//                StringBuilder hashString = new StringBuilder();

//                foreach (byte b in hashBytes)
//                {
//                    hashString.Append(b.ToString("x2"));
//                }

//                return hashString.ToString();

//            }

//        }
//    }
//}
