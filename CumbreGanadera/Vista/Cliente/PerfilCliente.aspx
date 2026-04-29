<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Perfiles.Master" AutoEventWireup="true" CodeBehind="PerfilCliente.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.PerfilCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="lblSesionId" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <style>
        .btn-option {
            background-color: white;
            border: 1px solid #dee2e6;
            border-radius: 0.75rem;
            transition: all 0.2s;
            text-align: left;
            width: 100%;
        }

            .btn-option:hover {
                background-color: #f8f9fa;
                transform: translateY(-1px);
            }

        .icon-circle {
            width: 48px;
            height: 48px;
            background-color: #f2f4f6;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .profile-header-bg {
            background: linear-gradient(135deg, #1e4b2e 0%, #2a6e3f 100%);
            border-radius: 1rem;
            color: white;
        }

        .btn-outline-cerrar {
            border: 1px solid #dc3545;
            color: #dc3545;
            background: transparent;
            width: 100%;
            padding: 12px;
            border-radius: 40px;
        }

            .btn-outline-cerrar:hover {
                background-color: #dc3545;
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-xl-7">
                <!-- Tarjeta de perfil (cabecera) -->
                <div class="profile-header-bg p-4 mb-4 shadow-sm">
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
                        <div>
                            <h2 class="fw-bold mb-1">
                                <asp:Label ID="lblNombreCompleto" runat="server" Text=""></asp:Label></h2>
                            <div class="d-flex gap-2 flex-wrap"></div>
                        </div>
                        <img src="../Source/Img/Perfiles/Cliente/fotoP.jpg" alt="Avatar" style="width: 60px; height: 60px; border-radius: 50%;" class="mt-3 mt-md-0" />
                    </div>
                </div>


                <!-- Botones de opciones como LinkButton -->
                <div class="card border-0 shadow-sm mb-4">
                    <div class="card-body p-0">
                        <div class="list-group list-group-flush">
                            <asp:LinkButton ID="lnkInfoPersonal" runat="server" CssClass="list-group-item border-0 p-3 btn-option" OnClick="lnkInfoPersonal_Click">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex gap-3">
                                        <div class="icon-circle"><i class="bi bi-person fs-4"></i></div>
                                        <div><h6 class="mb-0 fw-semibold">Información Personal</h6><p class="mb-0 text-muted small">Tus datos básicos</p></div>
                                    </div>
                                    <i class="bi bi-chevron-right"></i>
                                </div>
                            </asp:LinkButton>

                            <asp:LinkButton ID="lnkDatosCuenta" runat="server" CssClass="list-group-item border-0 p-3 btn-option" OnClick="lnkDatosCuenta_Click">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex gap-3">
                                        <div class="icon-circle"><i class="bi bi-envelope fs-4"></i></div>
                                        <div><h6 class="mb-0 fw-semibold">Datos de la Cuenta</h6><p class="mb-0 text-muted small">Email y teléfono</p></div>
                                    </div>
                                    <i class="bi bi-chevron-right"></i>
                                </div>
                            </asp:LinkButton>

                            <asp:LinkButton ID="lnkSeguridad" runat="server" CssClass="list-group-item border-0 p-3 btn-option" OnClick="lnkSeguridad_Click">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex gap-3">
                                        <div class="icon-circle"><i class="bi bi-shield-lock fs-4"></i></div>
                                        <div><h6 class="mb-0 fw-semibold">Seguridad</h6><p class="mb-0 text-muted small">Contraseña y accesos</p></div>
                                    </div>
                                    <i class="bi bi-chevron-right"></i>
                                </div>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>

                <!-- Cerrar sesión -->
                <asp:LinkButton ID="lnkCerrarSesion" runat="server" CssClass="btn btn-outline-cerrar" OnClick="lnkCerrarSesion_Click">
                    <i class="bi bi-box-arrow-right me-2"></i> Cerrar sesión
                </asp:LinkButton>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS (para el funcionamiento del navbar toggler) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
