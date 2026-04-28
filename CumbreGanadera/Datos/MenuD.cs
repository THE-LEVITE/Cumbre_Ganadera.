using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class MenuD
    {

        public List<MenuM> MtOpciones(int IdRol)
        {
            List<MenuM> Opciones = new List<MenuM>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"select m.Id, m.Menu, m.UrlMenu, m.Icono, m.Orden from Menu m Inner join MenuRol mr on m.Id = mr.IdMenu 
                Where mr.IdRol = @IdRol";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@IdRol", IdRol);

                    DataTable dt = new DataTable();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    foreach (DataRow item in dt.Rows)
                    {
                        MenuM oMenum = new MenuM();
                        oMenum.Id = Convert.ToInt32(item["Id"]);
                        oMenum.Nombre = item["Menu"].ToString();
                        oMenum.UrlMenu = item["UrlMenu"].ToString();
                        oMenum.Orden = Convert.ToInt32(item["Orden"]);
                        oMenum.Icono = item["Icono"].ToString();
                        Opciones.Add(oMenum);

                    }
                }
            }
            return Opciones;
        }

    }
}