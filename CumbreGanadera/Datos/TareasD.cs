using CumbreGanadera.Modelo;
using CumbreGanadera.Vista.Gerente.CrudTareas;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CumbreGanadera.Datos
{
    public class TareasD
    {
        public List<TareasM> MtObtenerTareasGerente(int IdGerente)
        {
            List<TareasM> listaTareas = new List<TareasM>();

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string Consulta = "Select UT.Nombre as NombreTrabajador, UT.Apellido as ApellidoTrabajador, * From Tarea T inner join SectorArea SA on SA.IdTarea = T.Id inner join Sector S on SA.IdSector = S.Id inner join AsignacionTarea AT on AT.IdTarea = T.Id inner join Usuario U on AT.IdGerente = U.Id inner join Usuario UT on AT.IdTrabajador = UT.Id where AT.IdGerente = @IdGerente";

                using(SqlCommand cmd = new SqlCommand(Consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@IdGerente", IdGerente);

                    DataTable dt = new DataTable();

                    SqlDataAdapter dr = new SqlDataAdapter(cmd);
                    dr.Fill(dt);


                    foreach (DataRow item in dt.Rows)
                    {
                        TareasM oTareaM = new TareasM()
                        {
                            Titulo = item["Titulo"].ToString(),
                            Descripcion = item["Descripcion"].ToString(),
                            Sector = new Sector()
                            {
                                Nombre = item["Nombre"].ToString(),
                            },
                            Estado = item["EstadoTarea"].ToString(),
                            FechaAsignacion = Convert.ToDateTime(item["FechaAsignacion"]),
                            DatosUsuario = new Usuario()
                            {
                                Nombre = item["NombreTrabajador"].ToString(),
                                Apellido = item["ApellidoTrabajador"].ToString()
                            }
                        };
                        listaTareas.Add(oTareaM);
                    }
                }
            }
                return listaTareas;
        }

        public int MtRegistrarTarea(TareasM oTarea)
        {
            int Verificacion = 0;

            using(SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "";

                using( SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Titulo", oTarea.Titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", oTarea.Descripcion);
                    cmd.Parameters.AddWithValue("@IdSector", oTarea.Sector.Id);
                    cmd.Parameters.AddWithValue("@FechaAsignacion", oTarea.FechaAsignacion);
                    cmd.Parameters.AddWithValue("@Estado", oTarea.Estado);
                    cmd.Parameters.AddWithValue("@IdGerente", oTarea.IdGerente);
                    cmd.Parameters.AddWithValue("@IdTrabajador", oTarea.DatosUsuario.Id);
                    Verificacion = cmd.ExecuteNonQuery();
                }
            }
            return Verificacion;
        }

        public int MtEditarTarea(TareasM oTarea)
        {
            int Verificacion = 0;

            using (SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Titulo", oTarea.Titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", oTarea.Descripcion);
                    cmd.Parameters.AddWithValue("@IdSector", oTarea.Sector.Id);
                    cmd.Parameters.AddWithValue("@FechaAsignacion", oTarea.FechaAsignacion);
                    cmd.Parameters.AddWithValue("@Estado", oTarea.Estado);
                    cmd.Parameters.AddWithValue("@IdTrabajador", oTarea.DatosUsuario.Id);
                    Verificacion = cmd.ExecuteNonQuery();
                }
            }
            return Verificacion;
        }
        public int MtEliminarTarea(int IdTarea)
        {
            int Verificacion = 0;

            using(SqlConnection cn = ConexionBD.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@IdTarea", IdTarea);
                    Verificacion = cmd.ExecuteNonQuery();
                }
            }return Verificacion;
        }
    }
}