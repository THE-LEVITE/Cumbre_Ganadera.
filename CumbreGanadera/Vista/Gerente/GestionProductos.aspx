<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="GestionProductos.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.GestionProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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

        .page-header .badge-count {
            background: #3b82f6;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 500;
        }

        /* ====== BOTÓN REGISTRAR ====== */
        .btn-registrar {
            background: linear-gradient(135deg, #2965ca 0%, #2591eb 100%);
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
            box-shadow: 0 2px 10px rgba(59, 130, 246, 0.3);
        }

        .btn-registrar:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(59, 130, 246, 0.4);
            color: white;
        }

        .btn-registrar:active {
            transform: scale(0.95);
        }

        /* ====== MODAL ====== */
        .modal-content {
            border-radius: 15px;
            border: none;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
        }

        /* Encabezado Modal*/
        .modal-header {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 20px 30px;
            border-bottom: none;
        }

        .modal-header .modal-title {
            font-weight: 600;
        }

        .modal-header .modal-title i {
            margin-right: 10px;
        }

        .modal-header .btn-close {
            filter: brightness(0) invert(1);
            opacity: 0.8;
        }

        .modal-header .btn-close:hover {
            opacity: 1;
        }

        .modal-body {
            padding: 30px;
        }

        .modal-footer {
            border-top: none;
            padding: 0 30px 30px 30px;
            gap: 10px;
        }

        /* ====== CAMPOS DEL MODAL ====== */
        .modal-body .form-group {
            margin-bottom: 18px;
        }

        .modal-body .form-group label {
            font-weight: 600;
            color: #2d3748;
            font-size: 0.9rem;
            margin-bottom: 5px;
            display: block;
        }

        .modal-body .form-group label i {
            color: #3b82f6;
            margin-right: 6px;
        }

        .modal-body .form-control,
        .modal-body .form-select {
            border-radius: 8px;
            border: 2px solid #e9ecef;
            padding: 10px 15px;
            transition: all 0.3s ease;
            width: 100%;
        }

        .modal-body .form-control:focus,
        .modal-body .form-select:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.25);
        }

        .modal-body .form-select {
            cursor: pointer;
        }

        /* ====== BOTONES DEL MODAL ====== */
        .btn-cancelar {
            background: #6c757d;
            border: none;
            color: white;
            padding: 10px 30px;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-cancelar:hover {
            background: #5a6268;
            transform: translateY(-2px);
            color: white;
        }

        .btn-guardar {
            background: linear-gradient(135deg, #3ab73b 0%, #34d509 100%);
            border: none;
            color: white;
            padding: 10px 30px;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 2px 10px rgba(16, 185, 129, 0.3);
        }

        .btn-guardar:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(16, 185, 129, 0.4);
            color: white;
        }

        .btn-guardar:active {
            transform: scale(0.95);
        }

        /* ====== TABLA ====== */
        .table-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            margin-top: 25px;
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

        /* ====== BOTONES DE ACCIÓN ====== */
        .btn-editar {
            background: #f0b314;
            border: none;
            color: #1f2937;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .btn-editar:hover {
            background: #f59e0b;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(251, 191, 36, 0.3);
            color: #1f2937;
        }

        .btn-eliminar {
            background: #f03030;
            border: none;
            color: white;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            margin-left: 5px;
        }

        .btn-eliminar:hover {
            background: #ef4444;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(248, 113, 113, 0.3);
            color: white;
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

            .btn-registrar {
                width: 100%;
                justify-content: center;
            }

            .modal-body {
                padding: 20px;
            }

            .modal-footer {
                flex-direction: column;
                padding: 0 20px 20px 20px;
            }

            .modal-footer .btn {
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

            .btn-editar,
            .btn-eliminar {
                padding: 4px 12px;
                font-size: 0.7rem;
            }

            .btn-editar i,
            .btn-eliminar i {
                font-size: 0.8rem;
            }
        }

        @media (max-width: 576px) {
            .modal-dialog {
                margin: 10px;
            }

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

    <div class="page-header">
        <h3>
            <i class="bi bi-box-seam"></i> Gestión de Productos
        </h3>
    </div>

    <button type="button" class="btn-registrar" data-bs-toggle="modal" data-bs-target="#miModal">
        <i class="bi bi-plus-circle"></i> Registrar Producto
    </button>

    <!-- MODAL CREAR -->
    <div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel">
                        <i class="bi bi-plus-circle"></i> Nuevo Producto
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hdnIdProducto" value="0" />

                    <div class="form-group">
                        <label><i class="bi bi-tags"></i> Tipo de Producto</label>
                        <asp:DropDownList ID="ddlTipoProducto" runat="server" CssClass="form-select">
                            <asp:ListItem Text="-- Seleccione un tipo --" Value="" />
                        </asp:DropDownList>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-upc-scan"></i> Código Producto</label>
                                <input id="txtCodigo" class="form-control" runat="server" placeholder="Ej: PRD-001" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-box"></i> Nombre Producto</label>
                                <input type="text" id="txtNombreProducto" class="form-control" runat="server" placeholder="Ingrese el nombre" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-currency-dollar"></i> Precio Producto</label>
                                <input type="number" id="txtPrecioProducto" class="form-control" runat="server" placeholder="0.00" step="0.01" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-boxes"></i> Stock del Producto</label>
                                <input type="number" id="txtCantidad" class="form-control" runat="server" placeholder="Cantidad disponible" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label><i class="bi bi-file-text"></i> Descripción Producto</label>
                        <input type="text" id="txtDescripcion" class="form-control" runat="server" placeholder="Descripción detallada del producto" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-cancelar" data-bs-dismiss="modal">
                        <i class="bi bi-x-circle"></i> Cancelar
                    </button>
                    <asp:Button ID="btnCrear" runat="server" Text="Crear Producto" CssClass="btn-guardar" OnClick="btnCrear_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL EDITAR -->
    <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalLabelEditar" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabelEditar">
                        <i class="bi bi-pencil-square"></i> Editar Producto
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hdnIdEdit" runat="server" Value="0" />

                    <div class="form-group">
                        <label><i class="bi bi-tags"></i> Tipo de Producto</label>
                        <asp:DropDownList ID="ddlTipoProductoEdit" runat="server" CssClass="form-select">
                            <asp:ListItem Text="-- Seleccione un tipo --" Value="" />
                        </asp:DropDownList>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-upc-scan"></i> Código Producto</label>
                                <input id="txtCodigoEdit" class="form-control" runat="server" placeholder="Ej: PRD-001" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-box"></i> Nombre Producto</label>
                                <input type="text" id="txtNombreEdit" class="form-control" runat="server" placeholder="Ingrese el nombre" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-currency-dollar"></i> Precio Producto</label>
                                <input type="number" id="txtPrecioEdit" class="form-control" runat="server" placeholder="0.00" step="0.01" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="bi bi-boxes"></i> Stock del Producto</label>
                                <input type="number" id="txtCantidadEdit" class="form-control" runat="server" placeholder="Cantidad disponible" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label><i class="bi bi-file-text"></i> Descripción Producto</label>
                        <input type="text" id="txtDescripcionEdit" class="form-control" runat="server" placeholder="Descripción detallada del producto" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-cancelar" data-bs-dismiss="modal">
                        <i class="bi bi-x-circle"></i> Cancelar
                    </button>
                    <asp:Button ID="btnGuardarCambios" runat="server" Text="Guardar Cambios" CssClass="btn-guardar" OnClick="btnGuardarCambios_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- TABLA DE PRODUCTOS -->
    <div class="table-container">
        <asp:GridView ID="gvProductos" runat="server"
            AutoGenerateColumns="false"
            CssClass="table table-striped table-bordered"
            GridLines="None"
            AllowPaging="True"
            PageSize="5"
            OnPageIndexChanging="gvProductos_PageIndexChanging"
            PagerStyle-CssClass="pagination-container"
            PagerStyle-HorizontalAlign="Center">

            <PagerSettings Mode="NumericFirstLast"
                PageButtonCount="5"
                FirstPageText="Primero"
                LastPageText="Último"
                PreviousPageText="Anterior"
                NextPageText="Siguiente" />

            <Columns>
                <asp:BoundField HeaderText="Código" DataField="Codigo" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C}" />
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                <asp:BoundField HeaderText="Cantidad" DataField="StockDisponible" />
                <asp:BoundField HeaderText="Tipo Producto" DataField="NombreTipo" />
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="200px">
                    <ItemTemplate>
                        <asp:LinkButton class="btn-editar" ID="btnEditar" runat="server"
                            OnClick="btnEditar_Click"
                            CommandArgument='<%# Eval("Id") %>'>
                            <i class="bi bi-pencil-square"></i> Editar
                        </asp:LinkButton>
                        <asp:LinkButton class="btn-eliminar" ID="btnEliminar" runat="server"
                            OnClick="btnEliminar_Click"
                            CommandArgument='<%# Eval("Id") %>'>
                            <i class="bi bi-trash"></i> Eliminar
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>