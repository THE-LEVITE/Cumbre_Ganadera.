<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="Tareas.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.Tareas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        /* ====== ESTILOS GENERALES ====== */
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f5f7;
        }

        /* ====== ENCABEZADO ====== */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }

        .page-header h2 {
            font-weight: 700;
            color: #1a202c;
            margin: 0;
        }

        .page-header h2 i {
            color: #39A900;
            margin-right: 10px;
        }

        .page-header .subtitle {
            color: #6c757d;
            font-size: 0.95rem;
            margin-top: 5px;
        }

        /* ====== BOTONES ====== */
        .btn-primary-custom {
            background: linear-gradient(135deg, #4b6043 0%, #4b6043 100%);
            border: none;
            color: white;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 10px rgba(57, 169, 0, 0.3);
        }

        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(57, 169, 0, 0.4);
            color: white;
        }

        .btn-primary-custom:active {
            transform: scale(0.95);
        }

        .btn-eliminar {
            background: #bb3333;
            border: none;
            color: white;
            padding: 6px 18px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-eliminar:hover {
            background: #dc2626;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);
            color: white;
        }

        /* ====== CONTENEDOR DE TABLA ====== */
        .table-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            overflow-x: auto;
        }

        .table-container .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 15px;
            border-bottom: 2px solid #e9ecef;
            margin-bottom: 20px;
        }

        .table-container .table-header h4 {
            font-weight: 600;
            color: #1a202c;
            margin: 0;
        }

        .table-container .table-header h4 i {
            color: #39A900;
            margin-right: 8px;
        }

        .table-container .table-header .badge-count {
            background: #4b6043;
            color: white;
            padding: 6px 16px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.85rem;
        }

        /* ====== TABLA ====== */
        .table-container .table {
            margin-bottom: 0;
        }

        .table-container .table thead th {
            background: linear-gradient(135deg, #4b6043 0%, #4b6043 100%);
            color: white;
            border-bottom: none;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            padding: 14px 12px;
            white-space: nowrap;
            text-align: center;
        }

        .table-container .table thead th:first-child {
            border-radius: 8px 0 0 0;
        }

        .table-container .table thead th:last-child {
            border-radius: 0 8px 0 0;
        }

        .table-container .table tbody tr:hover {
            background-color: transparent !important;
        }

        .table-container .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: rgba(57, 169, 0, 0.04);
        }

        .table-container .table tbody td {
            vertical-align: middle;
            padding: 12px 12px;
            text-align: center;
        }

        /* ====== SECTOR (SOLO CAMBIO EL COLOR DEL TEXTO A BLANCO) ====== */
        .badge-sector {
            background: #4b6043;
            color: white !important;
            padding: 6px 14px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.8rem;
        }

        /* ====== ESTADOS ====== */
        .badge-estado {
            padding: 6px 14px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.8rem;
        }

        .badge-estado.pendiente {
            background: #fef3c7;
            color: #d97706;
        }

        .badge-estado.en-progreso {
            background: #dbeafe;
            color: #2563eb;
        }

        .badge-estado.completada {
            background: #d1fae5;
            color: #059669;
        }

        /* ====== PAGINACIÓN ====== */
        .pagination-container {
            margin-top: 20px;
            padding-top: 18px;
            border-top: 2px solid #e9ecef;
            text-align: center;
            background: white;
        }

        .pagination-container table {
            margin: 0 auto;
            background: white;
        }

        .pagination-container td {
            padding: 0 5px;
            background: white;
        }

        .pagination-container a,
        .pagination-container span {
            display: inline-block;
            padding: 8px 16px;
            min-width: 40px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            color: #495057;
            background: white;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .pagination-container a:hover {
            background: #39A900;
            color: white;
            border-color: #39A900;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(57, 169, 0, 0.3);
        }

        .pagination-container span {
            background: linear-gradient(135deg, #39A900 0%, #2d8700 100%);
            color: white;
            border-color: #39A900;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .btn-primary-custom {
                width: 100%;
                justify-content: center;
            }

            .table-container {
                padding: 10px;
            }

            .table-container .table thead th {
                font-size: 0.7rem;
                padding: 10px 8px;
            }

            .table-container .table tbody td {
                padding: 8px 8px;
                font-size: 0.85rem;
            }

            .table-container .table-header {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start;
            }
        }

        @media (max-width: 576px) {
            .pagination-container a,
            .pagination-container span {
                padding: 6px 12px;
                min-width: 34px;
                font-size: 0.85rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid p-4">
        <!-- ====== ENCABEZADO ====== -->
        <div class="page-header">
            <div>
                <h2>
                    <i class="bi bi-check2-square"></i> Gestión de Tareas
                </h2>
                <p class="subtitle">Administra y organiza las tareas de los trabajadores.</p>
            </div>
            <div>
                <asp:Button ID="btnAgregarTarea" class="btn-primary-custom" runat="server" 
                    Text="Agregar Tarea" OnClick="btnAgregarTarea_Click" />
            </div>
        </div>

        <!-- ====== TABLA ====== -->
        <div class="table-container">
            <div class="table-header">
                <h4>
                    <i class="bi bi-list-task"></i> Listado de Tareas
                </h4>
                <span class="badge-count">
                    <i class="bi bi-database"></i> Total: <asp:Label ID="lblTotalTareas" runat="server" Text="0" />
                </span>
            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvTareas" runat="server" 
                    CssClass="table table-striped table-bordered"
                    GridLines="None"
                    AutoGenerateColumns="false" 
                    OnRowCommand="gvTareas_RowCommand"
                    AllowPaging="true"
                    PageSize="5"
                    OnPageIndexChanging="gvTareas_PageIndexChanging"
                    PagerStyle-CssClass="pagination-container"
                    PagerStyle-HorizontalAlign="Center">

                    <PagerSettings Mode="NumericFirstLast"
                        PageButtonCount="5"
                        FirstPageText="Primero"
                        LastPageText="Último"
                        PreviousPageText="Anterior"
                        NextPageText="Siguiente" />

                    <Columns>
                        <asp:TemplateField HeaderText="Título" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <strong><%# Eval("Titulo") %></strong>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <%# Eval("Descripcion") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sector" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <span class="badge-sector">
                                    <%# Eval("Sector.Nombre") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Trabajador" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <i class="bi bi-person-circle me-1"></i>
                                <%# Eval("DatosUsuario.Nombre") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha Asignación" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("FechaAsignacion")).ToString("dd/MM/yyyy") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Estado" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <%# ObtenerBadgeEstado(Eval("Estado").ToString()) %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones" HeaderStyle-CssClass="text-center" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:Button ID="btnEliminar"
                                    runat="server"
                                    Text="Eliminar"
                                    CssClass="btn-eliminar"
                                    CommandName="Eliminar"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClientClick="return confirmarEliminar(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <script>
        function confirmarEliminar(btn) {
            event.preventDefault();

            Swal.fire({
                title: '¿Eliminar Tarea?',
                text: 'Esta acción no se puede deshacer',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#ef4444',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    btn.onclick = null;
                    btn.click();
                }
            });
            return false;
        }
    </script>
</asp:Content>