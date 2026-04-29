<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Perfiles.Master" AutoEventWireup="true" CodeBehind="Seguridad.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.Seguridad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600&family=Manrope:wght@600;700&display=swap" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Inter', sans-serif;
            padding: 2rem 0;
        }

        .security-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 1rem;
        }

        .main-card {
            max-width: 896px;
            width: 100%;
            background-color: #E5E2E1;
            border: 1px solid #0a0a0a;
            border-radius: 1rem;
            padding: 2rem;
        }

        .page-title {
            color: #0a0a0a;
            font-family: 'Manrope', sans-serif;
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .page-subtitle {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 2rem;
        }

        .security-item-btn {
            background-color: #f4f6f9;
            border: 1px solid #262626;
            border-radius: 1rem;
            padding: 1rem;
            margin-bottom: 1rem;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            text-align: left;
            cursor: pointer;
            transition: all 0.2s ease;
        }

            .security-item-btn:hover {
                background-color: #e9ecef;
                transform: translateY(-1px);
                border-color: #4BE277;
            }

        .item-left {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex: 1;
        }

        .icon-circle {
            width: 48px;
            height: 48px;
            background-color: #171717;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #96D5A3;
            font-size: 1.5rem;
        }

        .item-title {
            color: #0a0a0a;
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 0.25rem;
        }

        .item-subtitle {
            color: #6c757d;
            font-size: 0.85rem;
        }

        .btn-cambiar-span {
            background-color: #2c6e2f;
            border: none;
            border-radius: 2rem;
            padding: 0.4rem 1.2rem;
            font-weight: 500;
            font-size: 0.85rem;
            color: white;
            display: inline-block;
        }

        .chevron {
            color: #6c757d;
            font-size: 1.2rem;
            margin-left: 1rem;
        }

        .inner-card {
            background-color: #f4f6f9;
            border: 1px solid #262626;
            border-radius: 1rem;
            padding: 1.5rem;
            height: 100%;
            transition: transform 0.2s;
        }

            .inner-card:hover {
                transform: translateY(-2px);
                border-color: #4BE277;
            }

        .score-title {
            color: black;
            font-weight: 600;
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .score-description {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .progress-custom {
            background-color: #262626;
            border-radius: 1rem;
            height: 0.6rem;
        }

        .progress-bar-custom {
            background-color: #4BE277;
            border-radius: 1rem;
            width: 85%;
        }

        .btn-outline-modern {
            background: transparent;
            border: 1px solid #4BE277;
            color: #4BE277;
            border-radius: 2rem;
            padding: 0.4rem 1.2rem;
            font-weight: 500;
            transition: all 0.2s;
        }

            .btn-outline-modern:hover {
                background-color: rgba(75, 226, 119, 0.1);
                color: #6ef38f;
            }

        .verification-panel {
            background-color: #fff;
            border-radius: 1rem;
            padding: 1.5rem;
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: 1px solid #dee2e6;
        }

        @media (max-width: 576px) {
            .main-card {
                padding: 1.5rem;
            }

            .security-item-btn {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .item-left {
                width: 100%;
            }

            .chevron {
                margin-left: 0;
                align-self: flex-end;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="security-wrapper">
        <div class="main-card">
            <div class="d-flex justify-content-end mb-3">
                <asp:LinkButton ID="btnCerrarCard" runat="server" CssClass="btn btn-link text-dark p-0" OnClick="btnCerrarCard_Click" Style="font-size: 1.5rem;">
        <i class="bi bi-x-lg"></i>
                </asp:LinkButton>
            </div>
            <div class="page-title">Seguridad</div>
            <div class="page-subtitle">Administra tus métodos de acceso y la protección de tu cuenta.</div>


            <!-- Botones de opciones de seguridad (ahora son asp:Button) -->
            <asp:LinkButton ID="btnTelefono" runat="server" CssClass="security-item-btn" OnClick="btnTelefono_Click">
    <div class="item-left">
        <div class="icon-circle"><i class="bi bi-telephone"></i></div>
        <div>
            <div class="item-title">Teléfono</div>
            <div class="item-subtitle">Verifica tu número</div>
        </div>
    </div>
    <i class="bi bi-chevron-right chevron"></i>
            </asp:LinkButton>

            <asp:LinkButton ID="btnContraseña" runat="server" CssClass="security-item-btn" OnClick="btnContraseña_Click">
    <div class="item-left">
        <div class="icon-circle"><i class="bi bi-lock"></i></div>
        <div>
            <div class="item-title">Contraseña</div>
            <div class="item-subtitle">Cambia tu contraseña</div>
        </div>
    </div>
    <div class="d-flex align-items-center gap-2">
        <span class="btn-cambiar-span">Cambiar</span>
        <i class="bi bi-chevron-right chevron"></i>
    </div>
            </asp:LinkButton>

            <asp:LinkButton ID="btnEmail" runat="server" CssClass="security-item-btn" OnClick="btnEmail_Click">
    <div class="item-left">
        <div class="icon-circle"><i class="bi bi-envelope"></i></div>
        <div>
            <div class="item-title">Correo electrónico</div>
            <div class="item-subtitle">Verifica tu email</div>
        </div>
    </div>
    <i class="bi bi-chevron-right chevron"></i>
            </asp:LinkButton>
            <!-- Panel Cambiar Contraseña (oculto inicialmente) -->
            <asp:Panel ID="pnlCambiarContraseña" runat="server" Visible="false" CssClass="verification-panel">
                <h4>Cambiar Contraseña</h4>
                <div class="mb-3">
                    <label>Contraseña actual</label>
                    <asp:TextBox ID="txtContraseñaActual" runat="server" TextMode="Password" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label>Nueva contraseña</label>
                    <asp:TextBox ID="txtNuevaContraseña" runat="server" TextMode="Password" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label>Confirmar nueva contraseña</label>
                    <asp:TextBox ID="txtConfirmarContrasenia" runat="server" TextMode="Password" CssClass="form-control" />
                </div>
                <asp:Button ID="btnGuardarContraseña" runat="server" Text="Guardar Contraseña" CssClass="btn btn-success" OnClick="btnGuardarContraseña_Click" />
                <asp:Button ID="btnCancelarContraseña" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelarContraseña_Click" />
            </asp:Panel>

           

            <!-- Mensajes generales -->
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-muted small d-block mt-3 text-center"></asp:Label>

            <!-- Tarjetas de estado (solo visual) -->
            <div class="row g-4 mt-3">
                <div class="col-md-6">
                    <div class="inner-card d-flex flex-column">
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="icon-circle"><i class="bi bi-shield-check fs-3"></i></div>
                            <h3 class="text-black mb-0" style="font-family: 'Manrope', sans-serif; font-size: 1.25rem;">Escaneo de Seguridad</h3>
                        </div>
                        <p class="score-description mb-3">Tu cuenta está protegida al 85%. Activa la verificación en dos pasos para mayor seguridad.</p>
                        <div class="progress progress-custom mb-3">
                            <div class="progress-bar progress-bar-custom" role="progressbar" style="width: 85%;"></div>
                        </div>
                        <asp:Button ID="btnMejorarProteccion" runat="server" CssClass="btn-outline-modern w-100 mt-auto" Text="Mejorar protección" OnClick="btnMejorarProteccion_Click" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="inner-card d-flex flex-column">
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="icon-circle"><i class="bi bi-laptop fs-3"></i></div>
                            <h3 class="text-black mb-0" style="font-family: 'Manrope', sans-serif; font-size: 1.25rem;">Dispositivos activos</h3>
                        </div>
                        <p class="score-description mb-3">3 sesiones abiertas en Mac, iPad y iPhone.</p>
                        <asp:Button ID="btnAdministrarDispositivos" runat="server" CssClass="btn-outline-modern w-100 mt-auto" Text="Administrar dispositivos" OnClick="btnAdministrarDispositivos_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
