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

        public List<Compra> MtBuscarCompras(int IdUser)
        {
            List<Compra> listHistorial = new List<Compra>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "Sp_ConsultaHistorial";

                //El objeto Command esta reemplazando al adaptador, permitiendo hacer una conexion y consulta a la base de datos
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    //Esto evita la Inyeccion SQL ya que solo muestra y almacena los parametros de la consulta de la parte superior
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IdUsuario", IdUser);


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Compra oCompras = new Compra()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Codigo = dr["CodigoCompra"].ToString(),
                                ValorCompra = Convert.ToDouble(dr["ValorCompra"]),
                                FechaPedido = Convert.ToDateTime(dr["FechaPedido"]),
                                Productos = dr["Productos"].ToString()
                            };
                            listHistorial.Add(oCompras);
                        }

                    }
                }
            }
            return listHistorial;
        }
        public List<Producto> MTListarProductosHacienda(int IdHacienda)
        {
            List<Producto> listaProductos = new List<Producto>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "select p.Id, p.FotoProducto, p.NombreProducto, p.Descipcion, p.Precio from Producto p join Hacienda h on h.Id = p.IdHacienda where h.Id = @IdHacienda and p.StockDisponible > 0";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@IdHacienda", IdHacienda);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Producto oProducto = new Producto()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                FotoProducto = dr["FotoProducto"].ToString(),
                                Nombre = dr["NombreProducto"].ToString(),
                                Descripcion = dr["Descipcion"].ToString(),
                                Precio = Convert.ToDouble(dr["Precio"])
                            };

                            listaProductos.Add(oProducto);
                        }
                    }
                }
            }
            return listaProductos;
        }
        public Producto MTObtenerProducto(int IdProducto)
        {
            Producto oDatosProducto = new Producto();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "select Id, NombreProducto, Precio, Descipcion, Calificacion, StockDisponible, FotoProducto from Producto where Id = @IdProducto";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@IdProducto", IdProducto);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Producto oProducto = new Producto()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["NombreProducto"].ToString(),
                                Precio = Convert.ToDouble(dr["Precio"]),
                                Descripcion = dr["Descipcion"].ToString(),
                                Calificacion = Convert.ToDouble(dr["Calificacion"]),
                                StockDisponible = Convert.ToInt32(dr["StockDisponible"]),
                                FotoProducto = dr["FotoProducto"].ToString()
                            };

                            return oProducto;
                        }
                    }
                }
            }
            return oDatosProducto;
        }
    }
}