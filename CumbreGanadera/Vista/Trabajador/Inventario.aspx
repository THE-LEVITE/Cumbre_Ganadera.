<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="CumbreGanadera.Vista.Trabajador.Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Encabezado de la página */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e9ecef;
        }

        .page-header h3 {
            color: #2d3748;
            font-weight: 600;
            margin: 0;
        }

        .page-header h3 i {
            color: #3b82f6;
            margin-right: 10px;
        }

        /* ====== FILTRO DROPDOWN ====== */
        .filter-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            border: 1px solid #e9ecef;
        }

        .filter-section label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 5px;
        }

        .custom-select {
            max-width: 400px;
            border-radius: 8px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
            padding: 10px 15px;
        }

        .custom-select:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.25);
        }

        /* ====== ALERTAS ====== */
        .alert-custom {
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .alert-warning-custom {
            background: #fff8e7;
            border-left: 4px solid #f59e0b;
            color: #2d3748;
        }

        .alert-info-custom {
            background: #e7f3ff;
            border-left: 4px solid #3b82f6;
            color: #2d3748;
        }

        /* ====== CONTADOR ====== */
        .counter-card {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            padding: 12px 25px;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }

        .counter-card i {
            font-size: 1.5rem;
        }

        .counter-card .counter-number {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0 5px;
        }

        .counter-card .counter-label {
            font-size: 0.95rem;
            opacity: 0.9;
        }

        /* ====== TABLA ====== */
        .table-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            margin-top: 5px;
            overflow-x: auto;
        }

        .table-container .table {
            margin-bottom: 0;
        }

        .table-container .table thead th {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
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

        .table-container .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: rgba(59, 130, 246, 0.04);
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
            background: #eaedf2;
        }

        .pagination-container table {
            margin: 0 auto;
            background: #eaedf2;
        }

        .pagination-container td {
            padding: 0 5px;
            background: #eaedf2;
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
            background: #3b82f6;
            color: white;
            border-color: #3b82f6;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }

        .pagination-container span {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            border-color: #3b82f6;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .custom-select {
                max-width: 100%;
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

            .counter-card {
                padding: 10px 18px;
                font-size: 0.9rem;
            }

            .counter-card .counter-number {
                font-size: 1.4rem;
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

    <!-- ====== ENCABEZADO ====== -->
    <div class="page-header">
        <h3>
            <i class="bi bi-box-seam"></i> Inventario de la Hacienda
        </h3>
    </div>

    <!-- ====== FILTRO ====== -->
    <div class="filter-section">
        <div class="row align-items-end">
            <div class="col-md-8">
                <label for="<%= ddlTipoRecurso.ClientID %>" class="form-label">
                    <i class="bi bi-filter"></i> Seleccionar Tipo de Recurso
                </label>
                <asp:DropDownList ID="ddlTipoRecurso" runat="server"
                    OnSelectedIndexChanged="ddlTipoRecurso_SelectedIndexChanged"
                    CssClass="form-select custom-select"
                    AutoPostBack="true">
                    <asp:ListItem Text="-- Seleccione un recurso --" Value="" />
                    <asp:ListItem Text="Insumo" Value="Insumo" />
                    <asp:ListItem Text="Herramienta" Value="Herramienta" />
                    <asp:ListItem Text="Maquinaria" Value="Maquinaria" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4 text-end">
                <span class="badge bg-secondary p-2">
                    <i class="bi bi-info-circle"></i> Consulte los recursos disponibles en la hacienda
                </span>
            </div>
        </div>
    </div>

    <!-- ====== ALERTAS ====== -->
    <asp:Label ID="lblSinTipoRecurso" runat="server"
        CssClass="alert-custom alert-warning-custom d-block"
        Visible="false">
        <i class="bi bi-exclamation-triangle"></i> Elija un tipo de recurso para buscar en el inventario.
    </asp:Label>

    <asp:Label ID="lblSinRecurso" runat="server"
        CssClass="alert-custom alert-info-custom d-block"
        Visible="false">
        <i class="bi bi-info-circle"></i> El tipo de recurso seleccionado no está en el inventario.
    </asp:Label>

    <!-- ====== SECCIÓN INSUMOS ====== -->
    <div id="tablaInsumo" runat="server" visible="false">
        <div class="counter-card">
            <i class="bi bi-box"></i>
            <span class="counter-label">Total de Insumos:</span>
            <span class="counter-number"><asp:Label ID="lblNumeroInsumos" runat="server" Text="0"></asp:Label></span>
        </div>

        <div class="table-container">
            <asp:GridView ID="gvTablaInsumo" runat="server"
                AutoGenerateColumns="false"
                AllowPaging="true"
                PageSize="5"
                OnPageIndexChanging="gvTablaInsumo_PageIndexChanging"
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
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre del Insumo" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="Categoria" HeaderText="Tipo de Insumo" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- ====== SECCIÓN HERRAMIENTAS ====== -->
    <div id="tablaHerramienta" runat="server" visible="false">
        <div class="counter-card">
            <i class="bi bi-tools"></i>
            <span class="counter-label">Total de Herramientas:</span>
            <span class="counter-number"><asp:Label ID="lblNumeroHerramientas" runat="server" Text="0"></asp:Label></span>
        </div>

        <div class="table-container">
            <asp:GridView ID="gvTablaHerramienta" runat="server"
                AutoGenerateColumns="false"
                AllowPaging="true"
                PageSize="5"
                OnPageIndexChanging="gvTablaHerramienta_PageIndexChanging"
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
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="Categoria" HeaderText="Tipo de Herramienta" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- ====== SECCIÓN MAQUINARIA ====== -->
    <div id="tablaMaquinaria" runat="server" visible="false">
        <div class="counter-card">
            <i class="bi bi-truck"></i>
            <span class="counter-label">Total de Máquinas:</span>
            <span class="counter-number"><asp:Label ID="lblNumeroMaquinaria" runat="server" Text="0"></asp:Label></span>
        </div>

        <div class="table-container">
            <asp:GridView ID="gvTablaMaquinaria" runat="server"
                AutoGenerateColumns="false"
                AllowPaging="true"
                PageSize="5"
                OnPageIndexChanging="gvTablaMaquinaria_PageIndexChanging"
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
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="Categoria" HeaderText="Tipo de Maquinaria" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>