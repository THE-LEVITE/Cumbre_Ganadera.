<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="CrearTarea.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.CrearTarea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        /* ====== ESTILOS GENERALES ====== */
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f5f7;
        }

        /* ====== BREADCRUMB ====== */
        .breadcrumb-custom {
            padding: 12px 0;
            margin-bottom: 20px;
        }

        .breadcrumb-custom a {
            color: #4b6043;
            text-decoration: none;
            font-weight: 500;
        }

        .breadcrumb-custom a:hover {
            color: #2d8700;
        }

        .breadcrumb-custom .separator {
            color: #6c757d;
            margin: 0 8px;
        }

        .breadcrumb-custom .active {
            color: #6c757d;
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
            color: #4b6043;
            margin-right: 10px;
        }

        .page-header .subtitle {
            color: #6c757d;
            font-size: 0.95rem;
            margin-top: 5px;
        }

        /* ====== BOTONES ====== */
        .btn-cancelar {
            background: #6c757d;
            border: none;
            color: white;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-cancelar:hover {
            background: #5a6268;
            transform: translateY(-2px);
            color: white;
        }

        .btn-guardar {
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
            box-shadow: 0 2px 10px rgba(75, 96, 67, 0.3);
        }

        .btn-guardar:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(75, 96, 67, 0.4);
            color: white;
        }

        .btn-guardar:active {
            transform: scale(0.95);
        }

        /* ====== FORM CARD ====== */
        .form-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
        }

        .form-card .section-title {
            font-weight: 600;
            font-size: 1.1rem;
            color: #1a202c;
            padding-bottom: 12px;
            border-bottom: 2px solid #e9ecef;
            margin-bottom: 25px;
        }

        .form-card .section-title i {
            color: #4b6043;
            margin-right: 8px;
        }

        /* ====== CAMPOS DEL FORMULARIO ====== */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 600;
            color: #2d3748;
            font-size: 0.9rem;
            margin-bottom: 5px;
            display: block;
        }

        .form-group label i {
            color: #4b6043;
            margin-right: 6px;
        }

        .form-control-custom {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            font-family: 'Inter', sans-serif;
        }

        .form-control-custom:focus {
            border-color: #4b6043;
            box-shadow: 0 0 0 0.2rem rgba(75, 96, 67, 0.25);
            outline: none;
        }

        .form-control-custom::placeholder {
            color: #adb5bd;
        }

        select.form-control-custom {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%234b6043' viewBox='0 0 16 16'%3E%3Cpath d='M8 11L3 6h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 16px center;
            padding-right: 40px;
        }

        /* ====== ESTADO ====== */
        .status-section {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 25px 30px;
            margin-top: 30px;
            border: 1px solid #e9ecef;
        }

        .status-section .status-title {
            font-weight: 600;
            color: #1a202c;
            margin-bottom: 5px;
        }

        .status-section .status-subtitle {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 0;
        }

        .status-section .status-options {
            display: flex;
            gap: 30px;
            align-items: center;
        }

        .status-section .status-options .form-check {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
        }

        .status-section .status-options .form-check input[type="radio"] {
            width: 18px;
            height: 18px;
            accent-color: #4b6043;
            cursor: pointer;
        }

        .status-section .status-options .form-check label {
            font-weight: 500;
            color: #2d3748;
            cursor: pointer;
            margin: 0;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .page-header .btn-group {
                width: 100%;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .page-header .btn-group .btn {
                width: 100%;
                justify-content: center;
            }

            .form-card {
                padding: 20px;
            }

            .status-section {
                padding: 20px;
            }

            .status-section .status-options {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start;
                margin-top: 10px;
            }
        }

        @media (max-width: 576px) {
            .form-card {
                padding: 15px;
            }

            .form-control-custom {
                font-size: 0.85rem;
                padding: 10px 14px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid p-4">
        <!-- ====== BREADCRUMB ====== -->
        <div class="breadcrumb-custom">
            <a href="Tareas.aspx">Tareas</a>
            <span class="separator">/</span>
            <span class="active">Nueva Tarea</span>
        </div>

        <!-- ====== ENCABEZADO ====== -->
        <div class="page-header">
            <div>
                <h2>
                    <i class="bi bi-plus-circle"></i> Crear Nueva Tarea
                </h2>
                <p class="subtitle">Registre la información básica para una nueva tarea.</p>
            </div>
            <div class="btn-group" style="display: flex; gap: 12px;">
                <asp:HyperLink ID="hlCancelar" runat="server" NavigateUrl="Tareas.aspx" CssClass="btn-cancelar">
                    <i class="bi bi-x-circle"></i> Cancelar
                </asp:HyperLink>
                <asp:Button ID="btnGuargarTarea" class="btn-guardar" runat="server" 
                    Text="Guardar Tarea" OnClick="btnGuargarTarea_Click" />
            </div>
        </div>

        <!-- ====== FORM CARD ====== -->
        <div class="form-card">
            <div class="section-title">
                <i class="bi bi-info-circle"></i> Información General
            </div>

            <div class="row g-4">
                <!-- TÍTULO -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label><i class="bi bi-tag"></i> Título</label>
                        <asp:TextBox ID="txtTitulo" class="form-control-custom" runat="server" 
                            placeholder="Ingrese el título de la tarea" />
                    </div>
                </div>

                <!-- DESCRIPCIÓN -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label><i class="bi bi-file-text"></i> Descripción</label>
                        <asp:TextBox ID="txtDescripcion" class="form-control-custom" runat="server" 
                            placeholder="Ingrese una descripción detallada" />
                    </div>
                </div>

                <!-- SECTOR -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label><i class="bi bi-building"></i> Sector</label>
                        <asp:DropDownList ID="ddlSectores" class="form-control-custom" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- TRABAJADOR -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label><i class="bi bi-person"></i> Trabajador Asignado</label>
                        <asp:DropDownList ID="ddlTrabajadores" class="form-control-custom" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- ====== ESTADO ====== -->
            <div class="status-section">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h5 class="status-title">
                            <i class="bi bi-toggle-on" style="color: #4b6043;"></i> Estado de la Tarea
                        </h5>
                        <p class="status-subtitle">Seleccione el estado inicial de la tarea.</p>
                    </div>
                    <div class="col-md-6">
                        <div class="status-options">
                            <div class="form-check">
                                <asp:RadioButton ID="rbActivo" GroupName="estado" runat="server" Checked="true" />
                                <label for="rbActivo">Activo</label>
                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="rbInactivo" GroupName="estado" runat="server" />
                                <label for="rbInactivo">Inactivo</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>