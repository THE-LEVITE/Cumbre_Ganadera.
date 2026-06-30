using CumbreGanadera.Logica;
using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CumbreGanadera.Datos
{
    public class HaciendaD
    {
        public List<Hacienda> MTDueñoHacienda(Usuario oHacienda)
        {
            List<Hacienda> ListaHaciendas = new List<Hacienda>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_HaciendasDueño";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdDueño", oHacienda.Id);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Hacienda oHaciendas = new Hacienda()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                NombreHacienda = dr["NombreHacienda"].ToString(),
                                PresentacionHacienda = dr["PresentacionHacienda"].ToString(),
                                TipoProduccion = dr["TipoProduccion"].ToString(),
                                NombreCiudad = dr["NombreCiudad"].ToString(),
                                Departamento = dr["Departamento"].ToString(),
                                FotoHacienda = dr["FotoHacienda"].ToString(),

                            };
                            ListaHaciendas.Add(oHaciendas);
                        }
                    }
                }
            }

            return ListaHaciendas;
        }

        public List<Hacienda> MTObtenerCantidades(int haciendaId)
        {

            List<Hacienda> CandiadesHacienda = new List<Hacienda>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string procedimiento = "sp_ObtenerCantidades";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IdHacienda", haciendaId);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        try
                        {
                            List<Hacienda> ListaHaciendas = new List<Hacienda>();
                            while (dr.Read())
                            {
                                Hacienda oHaciendas = new Hacienda()
                                {
                                    CantidadGerentes = Convert.ToInt32(dr["CantidadGerentes"]),
                                    CantidadTrabajadores = Convert.ToInt32(dr["CantidadTrabajadores"]),
                                    CantidadAreas = Convert.ToInt32(dr["CantidadAreas"]),
                                    NombreHacienda = dr["NombreHacienda"].ToString(),
                                };
                                CandiadesHacienda.Add(oHaciendas);
                            }
                            return CandiadesHacienda;
                        }
                        catch
                        {
                            CandiadesHacienda = null;
                            return CandiadesHacienda;
                        }
                    }
                }
            }
        }

        public List<Reporte> MtListarReportesD(int idHacienda)
        {
            List<Reporte> ListaReporte = new List<Reporte>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "Sp_ListarReportes";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdHacienda", idHacienda);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Reporte oReportes = new Reporte()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Descripcion = dr["Descripcion"].ToString(),
                                Titulo = dr["Titulo"].ToString(),
                                Motivo = dr["Motivo"].ToString(),
                                FechaCreacion = Convert.ToDateTime(dr["FechaCreacion"])

                            };
                            ListaReporte.Add(oReportes);
                        }
                    }
                }
            }

            return ListaReporte;
        }

        public string MtTraerGerenteD(int idReporte)
        {
            using (SqlConnection conn = ConexionBD.MtAbrirConexion())
            {
                conn.Open();
                string Nombre = "";
                string consulta = "Sp_BuscarGerenteReporte";
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdReporte", idReporte);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            Nombre = dr["NombreCompleto"].ToString();

                        }

                        return Nombre;
                    }
                }
            }
        }


        public int MtResponderSolicutudD(Reporte oReport, int idDueño, int IdReporte, int idHacienda)
        {
            using (SqlConnection conn = ConexionBD.MtAbrirConexion())
            {
                conn.Open();
                int num = 0;
                string consulta = "Sp_ResponderSolicitud";
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Titulo", oReport.Titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", oReport.Descripcion);
                    cmd.Parameters.AddWithValue("@Motivo", oReport.Motivo);
                    cmd.Parameters.AddWithValue("@Fecha", oReport.FechaCreacion);
                    cmd.Parameters.AddWithValue("@IdHacienda", idHacienda);
                    cmd.Parameters.AddWithValue("@IdUsuario", idDueño);
                    cmd.Parameters.AddWithValue("@EstadoReporte", "Respuesta");
                    cmd.Parameters.AddWithValue("@IdReporteRespuesta", IdReporte);

                    num = cmd.ExecuteNonQuery();

                    return num;


                }
            }
        }

        public bool MtActualizarSolicitudD(int IdReporte)
        {
            using (SqlConnection conn = ConexionBD.MtAbrirConexion())
            {
                conn.Open();
                bool num = false;
                string consulta = "Sp_ActualizarSolicitud";
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdReporte", IdReporte);

                    num = cmd.ExecuteNonQuery() > 0;

                    return num;


                }
            }
        }


        public List<Reporte> MtSolicitudGerenteD(int idGerente)
        {
            List<Reporte> ListaReporte = new List<Reporte>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "Sp_SolicitudesGerente";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdGerente", idGerente);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Reporte oReportes = new Reporte()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Descripcion = dr["Descripcion"].ToString(),
                                Titulo = dr["Titulo"].ToString(),
                                Motivo = dr["Motivo"].ToString(),
                                FechaCreacion = Convert.ToDateTime(dr["FechaCreacion"])

                            };
                            ListaReporte.Add(oReportes);
                        }
                    }
                }
            }

            return ListaReporte;
        }


        public List<Reporte> MtRespuestaSolicitudD(int idSoli)
        {
            List<Reporte> ListaReporte = new List<Reporte>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "Sp_BuscarRespuesta";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdSolicitud", idSoli);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Reporte oReportes = new Reporte()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Descripcion = dr["Descripcion"].ToString(),
                                Titulo = dr["Titulo"].ToString(),
                                Motivo = dr["Motivo"].ToString(),
                                FechaCreacion = Convert.ToDateTime(dr["FechaCreacion"])

                            };
                            ListaReporte.Add(oReportes);
                        }
                    }
                }
            }

            return ListaReporte;
        }


        public int MtCrearSolicitudD(Reporte oReport,int idGerente,int idHacienda)
        {
            using (SqlConnection conn = ConexionBD.MtAbrirConexion())
            {
                conn.Open();
                int num = 0;
                string consulta = "Sp_CrearSolicitud";
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Titulo", oReport.Titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", oReport.Descripcion);
                    cmd.Parameters.AddWithValue("@Motivo", oReport.Motivo);
                    cmd.Parameters.AddWithValue("@Fecha", oReport.FechaCreacion);
                    cmd.Parameters.AddWithValue("@IdHacienda", idHacienda);
                    cmd.Parameters.AddWithValue("@IdUsuario", idGerente);
                    cmd.Parameters.AddWithValue("@EstadoReporte", "Pendiente");

                    num = cmd.ExecuteNonQuery();

                    return num;


                }
            }
        }


        public List<Producto> MtCargarTipoProductoD()
        {
            List<Producto> listTipoProducto = new List<Producto>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "Select * from TipoProducto";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Producto oProduc = new Producto()
                            {
                                IdTipo = Convert.ToInt32(dr["Id"]),
                                NombreTipo = dr["NombreTipo"].ToString(),
                                

                            };
                            listTipoProducto.Add(oProduc);
                        }
                    }
                }
            }

            return listTipoProducto;
        }
        public List<Producto> MtCargarProductoD(int idHacienda)
        {
            List<Producto> listTipoProducto = new List<Producto>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "Sp_CargarProductos";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdHacienda", idHacienda);


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Producto oProduc = new Producto()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Codigo = dr["CodigoProducto"].ToString(),
                                Nombre = dr["NombreProducto"].ToString(),
                                Precio = Convert.ToDouble(dr["Precio"]),
                                Descripcion = dr["Descipcion"].ToString(),
                                StockDisponible = Convert.ToInt32(dr["StockDisponible"]),
                                NombreTipo = dr["NombreTipo"].ToString()                              

                            };
                            listTipoProducto.Add(oProduc);
                        }
                    }
                }
            }

            return listTipoProducto;
        }


        public Producto MtTraerProductoD(int idProducto)
        {
            Producto oProduc = null;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();
                string consulta = "Sp_BuscarProducto";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdProducto", idProducto);


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            oProduc = new Producto()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Codigo = dr["CodigoProducto"].ToString(),
                                Nombre = dr["NombreProducto"].ToString(),
                                Precio = Convert.ToDouble(dr["Precio"]),
                                Descripcion = dr["Descipcion"].ToString(),
                                StockDisponible = Convert.ToInt32(dr["StockDisponible"]),
                                NombreTipo = dr["NombreTipo"].ToString()
                            };
                        }

                    }
                }
            }
            return oProduc;
        }





        public int MtCrearProductoD(int idHacienda,Producto oProduct,int idTipo)
        {
            using (SqlConnection conn = ConexionBD.MtAbrirConexion())
            {
                conn.Open();
                int num = 0;
                string consulta = "Sp_CrearProducto";
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Codigo", oProduct.Codigo);
                    cmd.Parameters.AddWithValue("@Nombre", oProduct.Nombre);
                    cmd.Parameters.AddWithValue("@Precio", oProduct.Precio);
                    cmd.Parameters.AddWithValue("@Descipcion", oProduct.Descripcion);
                    cmd.Parameters.AddWithValue("@Stock", oProduct.StockDisponible);
                    cmd.Parameters.AddWithValue("@IdTipo", idTipo);
                    cmd.Parameters.AddWithValue("@IdHacienda", idHacienda);
                    num = cmd.ExecuteNonQuery();

                    return num;


                }
            }
        }
        public int MtEditarProductoD(int IdProducto, Producto oProduct,int idTipo)
        {
            using (SqlConnection conn = ConexionBD.MtAbrirConexion())
            {
                conn.Open();
                int num = 0;
                string consulta = "Sp_ActualizarProducto";
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdProducto", IdProducto);
                    cmd.Parameters.AddWithValue("@Codigo", oProduct.Codigo);
                    cmd.Parameters.AddWithValue("@Nombre", oProduct.Nombre);
                    cmd.Parameters.AddWithValue("@Precio", oProduct.Precio);
                    cmd.Parameters.AddWithValue("@Descipcion", oProduct.Descripcion);
                    cmd.Parameters.AddWithValue("@Stock", oProduct.StockDisponible);
                    cmd.Parameters.AddWithValue("@IdTipo", idTipo);
                    num = cmd.ExecuteNonQuery();

                    return num;


                }
            }
        }


        public bool MtEliminarProductoD(int idProducto)
        {
            using (SqlConnection conn = ConexionBD.MtAbrirConexion())
            {
                conn.Open();

                string consulta = "Sp_EliminarProducto";
                using (SqlCommand cmd = new SqlCommand(consulta, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdProducto", idProducto);

                    int num = cmd.ExecuteNonQuery();

                    bool delete = num > 0;

                    return delete;

                }
            }
        }

        public List<Recurso> MtEncontrarInsumoD(int idHacienda)
        {
            List<Recurso> listTipoProducto = new List<Recurso>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "Sp_ConsultarInsumo";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdHacienda", idHacienda);


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Recurso oRecurso = new Recurso()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Cantidad = Convert.ToInt32(dr["Cantidad"]),
                                Descripcion = dr["Descripcion"].ToString(),
                                Categoria = dr["Tipo"].ToString()

                            };
                            listTipoProducto.Add(oRecurso);
                        }
                    }
                }
            }

            return listTipoProducto;
        }


    }
}