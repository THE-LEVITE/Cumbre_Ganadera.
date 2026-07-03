<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ResumenHacienda.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.ResumenHacienda" %>

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
            font-family: 'Inter', sans-serif;
        }

        .page-header h3 i {
            color: #4b6043;
            margin-right: 10px;
        }

        .page-header .hacienda-name {
            color: #4b6043;
            font-weight: 600;
            font-size: 1.1rem;
            font-family: 'Inter', sans-serif;
        }

        .page-header .hacienda-name i {
            margin-right: 6px;
        }

        /* ====== TARJETAS DE ESTADÍSTICAS ====== */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 35px;
        }

        .stat-card {
            background: white;
            border-radius: 16px;
            padding: 25px 20px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            text-align: center;
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            border-color: #4b6043;
        }

        .stat-card .stat-icon {
            font-size: 2.2rem;
            color: #4b6043;
            margin-bottom: 10px;
        }

        .stat-card .stat-label {
            font-size: 0.9rem;
            color: #6c757d;
            font-weight: 500;
            font-family: 'Inter', sans-serif;
            margin-bottom: 5px;
        }

        .stat-card .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1a202c;
            font-family: 'Inter', sans-serif;
        }

        /* ====== SECCIÓN GERENTES ====== */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
            padding-top: 10px;
        }

        .section-header h3 {
            font-weight: 700;
            color: #1a202c;
            margin: 0;
            font-family: 'Inter', sans-serif;
        }

        .section-header h3 i {
            color: #4b6043;
            margin-right: 10px;
        }

        /* ====== BOTÓN REGISTRAR ====== */
        .btn-registrar {
            background: linear-gradient(135deg, #4b6043 0%, #3d5036 100%);
            border: none;
            color: white;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 8px rgba(75, 96, 67, 0.2);
            font-family: 'Inter', sans-serif;
        }

        .btn-registrar:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(75, 96, 67, 0.35);
            color: white;
        }

        .btn-registrar:active {
            transform: scale(0.95);
        }

        .btn-registrar i {
            font-size: 1.1rem;
        }

        /* ====== TABLA ====== */
        .table-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            overflow-x: auto;
            margin-top: 10px;
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
            font-family: 'Inter', sans-serif;
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
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
        }

        /* ====== BOTONES DE ACCIÓN ====== */
        .btn-action-group {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .btn-eliminar {
            background: #ef4444;
            border: none;
            color: white;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-family: 'Inter', sans-serif;
        }

        .btn-eliminar:hover {
            background: #dc2626;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);
            color: white;
        }

        .btn-editar {
            background: #f59e0b;
            border: none;
            color: #1f2937;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-family: 'Inter', sans-serif;
        }

        .btn-editar:hover {
            background: #d97706;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.3);
            color: #1f2937;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .stats-container {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 15px;
            }

            .stat-card .stat-number {
                font-size: 2rem;
            }

            .section-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .btn-registrar {
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

            .btn-action-group {
                flex-direction: column;
                gap: 5px;
            }

            .btn-eliminar,
            .btn-editar {
                justify-content: center;
                font-size: 0.7rem;
                padding: 5px 12px;
            }
        }

        @media (max-width: 576px) {
            .stats-container {
                grid-template-columns: 1fr;
            }

            .stat-card {
                padding: 20px 15px;
            }

            .stat-card .stat-number {
                font-size: 1.8rem;
            }

            .page-header h3 {
                font-size: 1.2rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid p-4">
        <!-- ====== ENCABEZADO ====== -->
        <div class="page-header">
            <div>
                <h3>
                    <i class="bi bi-building"></i> Resumen de Hacienda
                </h3>
                <span class="hacienda-name">
                    <i class="bi bi-pin"></i> <span id="NombreHacienda" runat="server"></span>
                </span>
            </div>
        </div>

        <!-- ====== TARJETAS DE ESTADÍSTICAS ====== -->
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="bi bi-people"></i>
                </div>
                <div class="stat-label">Cantidad de Gerentes</div>
                <div class="stat-number">
                    <span id="CantidadGerentes" runat="server">0</span>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon">
                    <i class="bi bi-person-workspace"></i>
                </div>
                <div class="stat-label">Cantidad de Trabajadores</div>
                <div class="stat-number">
                    <span id="CantidadTrabajdores" runat="server">0</span>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon">
                    <i class="bi bi-grid"></i>
                </div>
                <div class="stat-label">Áreas Pertenecientes</div>
                <div class="stat-number">
                    <span id="CantidadAreas" runat="server">0</span>
                </div>
            </div>
        </div>

        <!-- ====== SECCIÓN GERENTES ====== -->
        <div class="section-header">
            <h3>
                <i class="bi bi-person-badge"></i> Gerentes
            </h3>
            <asp:Button ID="btnRegistrarGerente" runat="server" 
                CssClass="btn-registrar" 
                Text="Registrar Gerente" 
                OnClick="btnRegistrarGerente_Click" />
        </div>

        <!-- ====== TABLA DE GERENTES ====== -->
        <div class="table-container">
            <asp:GridView ID="gdGerentes" runat="server" 
                AutoGenerateColumns="false"
                CssClass="table table-striped table-bordered"
                GridLines="None">

                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="20%" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="20%" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="AreaAsignada" HeaderText="Área a Cargo" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" ItemStyle-Width="10%" />

                    <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <div class="btn-action-group">
                                <asp:Button CssClass="btn-editar" ID="bntEditar" runat="server" 
                                    Text="Editar" 
                                    CommandArgument='<%# Eval("Id") %>' 
                                    OnCommand="bntEditar_Command" />
                                <asp:Button CssClass="btn-eliminar" ID="btnEliminar" runat="server" 
                                    Text="Eliminar" 
                                    CommandArgument='<%# Eval("Id") %>' 
                                    OnCommand="btnEliminar_Command" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <HeaderStyle CssClass="text-center" />
                <RowStyle CssClass="align-middle" />
            </asp:GridView>
        </div>
    </div>

</asp:Content>