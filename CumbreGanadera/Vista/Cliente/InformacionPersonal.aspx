<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Perfiles.Master" AutoEventWireup="true" CodeBehind="InformacionPersonal.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.InformacionPersonal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <style>
        
        .bento-card {
            border-radius: 28px;
            background: #ffffff;
            box-shadow: 0 20px 35px -12px rgba(0,0,0,0.1);
            border: 1px solid rgba(0,0,0,0.05);
        }

        .btn-actualizar {
            background: #2c6e2f;
            border-color: #2c6e2f;
            border-radius: 40px;
            transition: 0.2s;
        }

            .btn-actualizar:hover {
                background: #1e4f21;
                border-color: #1e4f21;
            }

        .gender-option input[type="radio"] {
            margin-right: 6px;
            transform: scale(1.05);
        }

        .bottom-decoration {
            height: 4px;
            background: linear-gradient(90deg, #2c6e2f, #a8e6a8);
            border-radius: 4px;
            width: 80px;
            margin: 0 auto;
        }

        .form-control:focus, .input-group-text:focus {
            box-shadow: none;
            border-color: #2c6e2f;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-xl-7">
                <!-- Tarjeta principal -->
                <div class="card bento-card p-4">
                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-start">
                            <div></div>
                            <!-- espacio izquierdo -->
                            <asp:LinkButton ID="btnCerrarCard" runat="server" CssClass="btn btn-link text-dark p-0" OnClick="btnCerrarCard_Click" Style="font-size: 1.5rem;">
        <i class="bi bi-x-lg"></i>
                            </asp:LinkButton>
                        </div>
                        <h3 class="fw-semibold mb-1">Información Personal</h3>
                        <p class="text-muted">Gestiona tus datos de identidad para el cumplimiento de normativas agrícolas.</p>
                    </div>

                    <!-- Campo: Nombres -->
                    <div class="mb-4">
                        <label class="form-label fw-semibold">Nombres</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" placeholder="Ej: Juan Carlos"></asp:TextBox>
                            <span class="input-group-text bg-transparent border-start-0">
                                <i class="bi bi-pencil-square text-secondary"></i>
                            </span>
                        </div>
                    </div>

                    <!-- Campo: Apellidos -->
                    <div class="mb-4">
                        <label class="form-label fw-semibold">Apellidos</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" placeholder="Ej: Pérez Gómez"></asp:TextBox>
                            <span class="input-group-text bg-transparent border-start-0">
                                <i class="bi bi-pencil-square text-secondary"></i>
                            </span>
                        </div>
                    </div>

                    <!-- Fila de dos columnas: Identificación y Fecha -->
                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Número de Documento</label>
                            <div class="input-group">
                                <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control" placeholder="DNI / CUIT / Pasaporte"></asp:TextBox>
                                <span class="input-group-text bg-transparent border-start-0">
                                    <i class="bi bi-card-text text-secondary"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Fecha de Nacimiento</label>
                            <div class="input-group">
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" placeholder="aaaa-mm-dd" TextMode="Date"></asp:TextBox>
                                <!-- El input date nativo muestra un calendario, mejor que dropdown falso -->
                                <span class="input-group-text bg-transparent border-start-0">
                                    <i class="bi bi-calendar3"></i>
                                </span>
                            </div>
                            <div class="form-text">Formato: año-mes-día</div>
                        </div>
                    </div>




                    <!-- Botón de actualización (asp:Button) -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-actualizar btn-primary px-4 py-2"
                            Text="Actualizar Información" OnClick="btnActualizar_Click" />
                    </div>
                </div>

                <!-- Label para mostrar mensajes (lblMensaje) -->
                <div class="mt-3 text-center">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-muted small" EnableViewState="false"></asp:Label>
                </div>

                <div class="bottom-decoration mt-4"></div>
            </div>
        </div>
    </div>
    
    

    <!-- Scripts de Bootstrap (opcional para interacciones) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 
</asp:Content>
