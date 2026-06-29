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

    }
}