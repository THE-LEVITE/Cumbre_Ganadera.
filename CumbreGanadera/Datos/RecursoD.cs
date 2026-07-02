using CumbreGanadera.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class RecursoD
    {
        public List<Recurso> MTConsultarRecursos()
        {
            List<Recurso> ListaRecursos = new List<Recurso>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "SP_ConsultarRecursos";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Recurso oRecurso = new Recurso()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                TipoRecurso = Convert.ToInt32(dr["TipoRecurso"]),
                                Nombre = dr["Nombre"].ToString(),
                                Categoria = dr["Categoria"].ToString(),
                                Descripcion = dr["Descripcion"].ToString(),
                                Estado = dr["EstadoCantidad"].ToString()
                            };

                            ListaRecursos.Add(oRecurso);
                        }
                    }
                }
            }

            return ListaRecursos;
        }
        public void MTRegistrarRecurso(Recurso oRecurso)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_RegistrarRecurso";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@TipoRecurso", oRecurso.TipoRecurso);
                    cmd.Parameters.AddWithValue("@Nombre", oRecurso.Nombre);
                    cmd.Parameters.AddWithValue("@Descripcion", oRecurso.Descripcion);
                    cmd.Parameters.AddWithValue("@Cantidad", oRecurso.Cantidad);
                    cmd.Parameters.AddWithValue("@Estado", oRecurso.Estado);
                    cmd.Parameters.AddWithValue("@Marca", oRecurso.Marca);
                    cmd.Parameters.AddWithValue("@Tipo", oRecurso.IdTipo);
                    cmd.Parameters.AddWithValue("@IdHacienda", oRecurso.IdHacienda);

                    cmd.ExecuteNonQuery();
                }
            }
        }
        public void MTEditarRecurso(Recurso oRecurso)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_EditarRecurso";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Id", oRecurso.Id);
                    cmd.Parameters.AddWithValue("@TipoRecurso", oRecurso.TipoRecurso);
                    cmd.Parameters.AddWithValue("@Nombre", oRecurso.Nombre);
                    cmd.Parameters.AddWithValue("@Descripcion", oRecurso.Descripcion);
                    cmd.Parameters.AddWithValue("@Cantidad", oRecurso.Cantidad);
                    cmd.Parameters.AddWithValue("@Estado", oRecurso.Estado);
                    cmd.Parameters.AddWithValue("@Marca", oRecurso.Marca);
                    cmd.Parameters.AddWithValue("@IdTipo", oRecurso.IdTipo);

                    cmd.ExecuteNonQuery();
                }
            }
        }
        public Recurso MTConsultarRecursoPorId(int id, int tipoRecurso)
        {
            Recurso oRecurso = new Recurso();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_ConsultarRecursoPorId";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@TipoRecurso", tipoRecurso);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            oRecurso.Id = Convert.ToInt32(dr["Id"]);
                            oRecurso.Nombre = dr["Nombre"].ToString();
                            oRecurso.Descripcion = dr["Descripcion"].ToString();
                            oRecurso.IdTipo = Convert.ToInt32(dr["IdTipo"]);
                            oRecurso.Categoria = dr["Categoria"].ToString();

                            if (tipoRecurso == 1)
                            {
                                oRecurso.Cantidad = Convert.ToInt32(dr["Cantidad"]);
                            }
                            else if (tipoRecurso == 2)
                            {
                                oRecurso.Estado = dr["Estado"].ToString();
                            }
                            else
                            {
                                oRecurso.Estado = dr["Estado"].ToString();
                                oRecurso.Marca = dr["Marca"].ToString();
                            }
                        }
                    }
                }
            }

            return oRecurso;
        }
        public void MTEliminarRecurso(Recurso oRecurso)
        {
            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_EliminarRecurso";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Id", oRecurso.Id);
                    cmd.Parameters.AddWithValue("@TipoRecurso", oRecurso.TipoRecurso);

                    cmd.ExecuteNonQuery();
                }
            }
        }
        public List<Recurso> MTBuscarRecursos(string buscar)
        {
            List<Recurso> ListaRecursos = new List<Recurso>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string procedimiento = "sp_BuscarRecursos";

                using (SqlCommand cmd = new SqlCommand(procedimiento, cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Buscar", buscar);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Recurso oRecurso = new Recurso()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                TipoRecurso = Convert.ToInt32(dr["TipoRecurso"]),
                                Nombre = dr["Nombre"].ToString(),
                                Categoria = dr["Categoria"].ToString(),
                                Estado = dr["EstadoCantidad"].ToString(),
                                Descripcion = dr["Descripcion"].ToString()
                            };

                            ListaRecursos.Add(oRecurso);
                        }
                    }
                }
            }

            return ListaRecursos;
        }
    }
}

