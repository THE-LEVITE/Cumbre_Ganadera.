   <%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="Tareas.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.CrudTareas.Tareas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <!-- Google Fonts -->
 <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
 <!-- Material Icons -->
 <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">

 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <style>
     body {
         font-family: 'Inter', sans-serif;
         background: #f4f5f7;
         overflow-x: hidden;
     }
     /* SIDEBAR */

     .sidebar {
         width: 260px;
         height: 100vh;
         position: fixed;
         top: 0;
         left: 0;
         background: #fff;
         border-right: 1px solid #dee2e6;
         padding: 20px;
         z-index: 1000;
     }

         .sidebar .logo {
             width: 60px;
             height: 60px;
             background: #39A900;
             border-radius: 18px;
             color: white;
             font-size: 32px;
             font-weight: bold;
             display: flex;
             align-items: center;
             justify-content: center;
         }

     .sidebar-menu a {
         text-decoration: none;
         color: #495057;
         display: flex;
         align-items: center;
         gap: 12px;
         padding: 14px 16px;
         border-radius: 14px;
         margin-bottom: 10px;
         transition: 0.3s;
         font-size: 18px;
     }

         .sidebar-menu a:hover {
             background: #edf3ff;
         }

     .sidebar-menu .active {
         background: #0d6efd;
         color: white;
     }
     /* MAIN */

     .main-container {
         margin-left: 260px;
         min-height: 100vh;
         width: calc(100% - 260px);
     }
     /* TOPBAR */

     .topbar {
         height: 75px;
         background: white;
         border-bottom: 1px solid #dee2e6;
         padding: 0 30px;
     }
     /* SEARCH */

     .search-box {
         position: relative;
         width: 350px;
     }

         .search-box input {
             padding-left: 45px;
             border-radius: 50px;
             height: 45px;
         }

         .search-box .material-symbols-outlined {
             position: absolute;
             left: 14px;
             top: 50%;
             transform: translateY(-50%);
             color: gray;
         }
     /* CARDS */

     .stats-card {
         border: none;
         border-radius: 24px;
         box-shadow: 0 8px 24px rgba(0,0,0,0.08);
         padding: 30px;
     }
     /* TABLE */

     .table-container {
         background: white;
         border-radius: 25px;
         overflow: hidden;
         box-shadow: 0 8px 24px rgba(0,0,0,0.08);
     }

     .table tbody tr:hover {
         background: #f8fafc;
     }
     /* BUTTON GREEN */

     .btn-green {
         background: #39A900;
         color: white;
         border: none;
     }

         .btn-green:hover {
             background: #2d8700;
             color: white;
         }

     .badge-tech {
         background: #dbeafe;
         color: #0d6efd;
         font-size: 14px;
     }

     .badge-tec {
         background: #e9ecef;
         color: #495057;
         font-size: 14px;
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content -->

    <div class="container-fluid p-4">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">
            <div>
                <h2 class="fw-bold">Gestión de Tareas </h2>
                <p class="text-muted">Administra y organiza las tareas de los trabajadores. </p>
            </div>
            <div class="d-flex gap-2">
                <asp:Button ID="btnAgregarTarea" class="btn btn-green" runat="server" Text="Agregar Tarea" OnClick="btnAgregarTarea_Click" />
            </div>
        </div>
        <!-- Table -->
        <div class="table-container">
            <div class="p-4 border-bottom d-flex justify-content-between align-items-center">
                <h4 class="m-0">Listado de Tareas </h4>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvTareas" class="table align-middle mb-0" runat="server" AutoGenerateColumns="false" OnRowCommand="gvTareas_RowCommand">
                    <columns>
                        <asp:TemplateField HeaderText="Titulo">
                            <itemtemplate>
                                <%# Eval("Titulo") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descripción">
                            <itemtemplate>
                                <%# Eval("Descripcion") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sector">
                            <itemtemplate>
                                <%# Eval("Sector.Nombre") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Trabajador Asignado">
                            <itemtemplate>
                                    <%# Eval("DatosUsuario.Nombre") %>
                               
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha de Asignación">
                            <itemtemplate>
                                <%# Eval("FechaAsignacion") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Estado">
                            <itemtemplate>
                                <%# Eval("Estado") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones">
                            <itemtemplate>

                                <asp:Button ID="btnEliminar"
                                    runat="server"
                                    Text="Eliminar"
                                    CssClass="btn btn-sm btn-outline-danger"
                                    CommandName="Eliminar"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClientClick="return confirmarEliminar(this);" />

                            </itemtemplate>
                        </asp:TemplateField>
                    </columns>
                </asp:GridView>
                <script>

                    function confirmarEliminar() {

                        event.preventDefault();

                        let boton = event.target;

                        Swal.fire({
                            title: '¿Eliminar Tarea?',
                            text: 'Esta acción no se puede deshacer',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Sí, eliminar',
                            cancelButtonText: 'Cancelar'
                        }).then((result) => {

                            if (result.isConfirmed) {

                                boton.onclick = null;

                                boton.click();

                            }

                        });

                        return false;
                    }

</script>
            </div>
        </div>
    </div>
</asp:Content>
