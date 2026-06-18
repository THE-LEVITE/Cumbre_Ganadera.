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
    }
}