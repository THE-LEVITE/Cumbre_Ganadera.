<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="TareasTrabajador.aspx.cs" Inherits="CumbreGanadera.Vista.Trabajador.TareasTrabajador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        /* ====== ESTILOS CORPORATIVOS ====== */
        
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

        .page-header h3 {
            font-weight: 700;
            color: #1a202c;
            margin: 0;
        }

        .page-header h3 i {
            color: #4b6043;
            margin-right: 10px;
        }

        .page-header .badge-count {
            background: #4b6043;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .page-header .badge-count i {
            margin-right: 6px;
        }

        .table-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            overflow-x: auto;
        }

        .table-container .table {
            margin-bottom: 0;
        }

        .table-container .table thead th {
            background: linear-gradient(135deg, #4b6043 0%, #3d5036 100%);
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
            background-color: rgba(75, 96, 67, 0.04);
        }

        .table-container .table tbody td {
            vertical-align: middle;
            padding: 12px 12px;
            text-align: center;
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
            background: #4b6043;
            color: white;
            border-color: #4b6043;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(75, 96, 67, 0.3);
        }

        .pagination-container span {
            background: linear-gradient(135deg, #4b6043 0%, #3d5036 100%);
            color: white;
            border-color: #4b6043;
        }

        /* ====== ALERTA ====== */
        .alert-custom {
            padding: 20px 25px;
            border-radius: 12px;
            margin-top: 20px;
            font-weight: 500;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .alert-custom i {
            font-size: 1.5rem;
        }

        .alert-warning-custom {
            background: #fff8e7;
            border-left: 4px solid #f59e0b;
            color: #2d3748;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .page-header .badge-count {
                align-self: flex-start;
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
            <h3>
                <i class="bi bi-list-task"></i> Mis Tareas
            </h3>
            <span class="badge-count" id="spanContador" runat="server">
                <i class="bi bi-database"></i> Total: <asp:Label ID="lblTotalTareas" runat="server" Text="0" />
            </span>
        </div>

        <!-- ====== TABLA DE TAREAS ====== -->
        <div class="table-container" id="divTablaTareas" runat="server" visible="true">
            <asp:GridView ID="gvTareasTrabajador" runat="server"
                AutoGenerateColumns="false"
                AllowPaging="true"
                PageSize="5"
                OnPageIndexChanging="gvTareasTrabajador_PageIndexChanging"
                CssClass="table table-striped table-bordered"
                GridLines="None"
                PagerStyle-CssClass="pagination-container"
                PagerStyle-HorizontalAlign="Center">

                <PagerSettings Mode="NumericFirstLast"
                    PageButtonCount="5"
                    FirstPageText="Primero"
                    LastPageText="Último"
                    PreviousPageText="Anterior"
                    NextPageText="Siguiente" />

                <Columns>
                    <asp:BoundField DataField="Titulo" HeaderText="Título de la Tarea" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción de la Tarea" />
                </Columns>

                <HeaderStyle CssClass="text-center" />
                <RowStyle CssClass="align-middle" />
            </asp:GridView>
        </div>

        <!-- ====== MENSAJE CUANDO NO HAY TAREAS ====== -->
        <asp:Label ID="lblSintareas" runat="server"
            CssClass="alert-custom alert-warning-custom d-block"
            Visible="false">
            <i class="bi bi-exclamation-triangle"></i> No hay tareas actualmente.
        </asp:Label>
    </div>

</asp:Content>