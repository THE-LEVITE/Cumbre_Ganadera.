<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="CrearTarea.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.CrudTareas.CrearTarea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 -->
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
</style></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- CONTENT -->
    <main class="p-4">
        <!-- BREADCRUMB -->
        <nav class="mb-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Tareas.aspx">Tareas </a></li>
                <li class="breadcrumb-item active">Nueva Tarea </li>
            </ol>
        </nav>
        <!-- HEADER -->
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">
            <div>
                <h2 class="fw-bold">Crear Nueva Tarea </h2>
                <p class="text-muted">Registre la información básica para una nueva tarea. </p>
            </div>
            <div class="d-flex gap-3">
                <button class="btn btn-outline-secondary px-4" href="Tareas.aspx">Cancelar </button>
                <asp:Button ID="btnGuargarTarea" class="btn btn-green px-4" runat="server" Text="Guardar Tarea" OnClick="btnGuargarTarea_Click" />
            </div>
        </div>
        <!-- FORM CARD -->
        <div class="form-card">
            <form>
                <!-- SECTION -->
                <div class="section-title">Información General </div>
                <div class="row g-4">
                    <!-- CODIGO -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Titulo </label>
                        <asp:TextBox ID="txtTitulo" class="form-control form-control-lg" runat="server" placeholder="Ingrese el titulo"></asp:TextBox>
                    </div>
                    <!-- VERSION -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Descripción </label>
                        <asp:TextBox ID="txtDescripcion" class="form-control form-control-lg" placeholder="Ingrese una descripción" runat="server"></asp:TextBox>
                    </div>
                    <!-- NIVEL -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Sector </label>
                        <asp:DropDownList ID="ddlSectores" class="form-select form-select-lg" runat="server">
                        </asp:DropDownList>
                    </div>
                    
                    <!-- NIVEL -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Trabajadores </label>
                        <asp:DropDownList ID="ddlTrabajadores" class="form-select form-select-lg" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <!-- STATUS -->
                <div class="bg-light rounded-4 p-4 mt-5">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                        <div>
                            <h5 class="fw-bold">Estado de la Tarea </h5>
                            <p class="text-muted mb-0">Disponible para inscripciones. </p>
                        </div>
                        <div class="d-flex gap-4">
                            <asp:RadioButton ID="rbEstado" class="form-check-label" GroupName="estado" runat="server" Text="Activo" />
                            <asp:RadioButton ID="rb" class="form-check-label" GroupName="estado" runat="server" Text="Inactivo" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>
    <!-- BOOTSTRAP -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
