<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="CrearTarea.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.CrudTareas.CrearTarea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
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
                        <asp:DropDownList ID="Sector" class="form-select form-select-lg" runat="server">
                        </asp:DropDownList>
                    </div>
                    
                    <!-- NIVEL -->
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Sector </label>
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
