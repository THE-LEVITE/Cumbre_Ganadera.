using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class ProductoD
    {
        public List<Producto> MtBuscarProductos(DatosLoginUser oDatosProducto)
        {
            List<Producto> listProducto = new List<Producto>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "Sp_BuscarProductos";

                //El objeto Command esta reemplazando al adaptador, permitiendo hacer una conexion y consulta a la base de datos
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    //Esto evita la Inyeccion SQL ya que solo muestra y almacena los parametros de la consulta de la parte superior
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    cmd.Parameters.AddWithValue("@NombreProducto", oDatosProducto.BusquedaProducto);


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Producto oProducto = new Producto()
                            {
                                Id = Convert.ToInt32(dr["ID"]),
                                Nombre = dr["NombreProducto"].ToString(),
                                Codigo = dr["CodigoProducto"].ToString(),
                                Precio = Convert.ToDouble(dr["Precio"]),
                                Descripcion = dr["Descipcion"].ToString(),
                                Calificacion = Convert.ToDouble(dr["Calificacion"] == DBNull.Value ? null : dr["Calificacion"]),
                                StockDisponible = Convert.ToInt32(dr["StockDisponible"] == DBNull.Value ? null : dr["StockDisponible"]),
                                FotoProducto = dr["FotoProducto"].ToString()

                            };
                            listProducto.Add(oProducto);
                        }

                    }
                }
            }
            return listProducto;
        }

    }
}