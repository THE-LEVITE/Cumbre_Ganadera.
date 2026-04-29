<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Perfiles.Master" AutoEventWireup="true" CodeBehind="DatosCliente.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.DatosCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Fuentes -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600&family=Manrope:wght@600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
        }
        /* Cabecera blanca superior */
        .top-header {
            background-color: white;
            padding: 16px 0;
            border-bottom: 1px solid #dee2e6;
            margin-bottom: 40px;
        }

        .brand {
            font-family: 'Manrope', sans-serif;
            font-weight: 700;
            font-size: 1.6rem;
            color: #1e4b2e;
            text-decoration: none;
        }

        .nav-links a {
            color: #2c6e2f;
            text-decoration: none;
            font-weight: 500;
            margin: 0 1rem;
            transition: color 0.2s;
        }

            .nav-links a:hover {
                color: #1a4a1c;
            }
        /* Contenedor de la tarjeta */
        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        /* Tarjeta con el mismo estilo */
        .single-card {
            max-width: 896px;
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #000000;
            border-radius: 12px;
            padding: 32px 48px 48px;
        }

        .card-header-custom {
            margin-bottom: 32px;
        }

            .card-header-custom h1 {
                color: #000000;
                font-size: 32px;
                font-family: 'Manrope', sans-serif;
                font-weight: 700;
                margin-bottom: 4px;
            }

            .card-header-custom p {
                color: #808080;
                font-size: 14px;
                margin-bottom: 0;
            }

        .form-group {
            margin-bottom: 24px;
        }

        .form-label {
            color: #000000;
            font-size: 12px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            margin-bottom: 4px;
        }

        .form-control {
            background-color: #f4f6f9;
            border: 1px solid #262626;
            border-radius: 8px;
            color: #000000;
            font-size: 16px;
            padding: 10px 16px;
            transition: all 0.2s;
            width: 100%;
        }

            .form-control:focus {
                background-color: #0a0a0a;
                border-color: #4BE277;
                box-shadow: 0 0 0 0.2rem rgba(75, 226, 119, 0.25);
                color: #E5E2E1;
            }

        .danger-zone {
            margin-top: 32px;
            background: rgba(147, 0, 10, 0.10);
            border-radius: 12px;
            outline: 1px solid rgba(147, 0, 10, 0.30);
            padding: 24px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .danger-title {
            color: #FFB4AB;
            font-size: 20px;
            font-family: 'Manrope', sans-serif;
            font-weight: 600;
            line-height: 28px;
        }

        .danger-description {
            color: #FFB4AB;
            font-size: 14px;
            line-height: 20px;
            max-width: 580px;
        }

        .btn-danger-custom {
            background-color: #93000A;
            border: none;
            border-radius: 8px;
            padding: 12px 24px;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            transition: background 0.2s;
            color: #FFDAD6;
            font-size: 14px;
            font-weight: 600;
            line-height: 20px;
            text-align: center;
        }

            .btn-danger-custom:hover {
                background-color: #b00012;
            }

        .btn-actualizar {
            background-color: #2c6e2f;
            border: none;
            border-radius: 2rem;
            padding: 10px 24px;
            font-weight: 600;
            color: white;
            transition: all 0.2s;
            margin-top: 16px;
        }

            .btn-actualizar:hover {
                background-color: #1f5522;
                transform: translateY(-1px);
                box-shadow: 0 0.25rem 0.5rem rgba(0,0,0,0.2);
            }

        @media (max-width: 576px) {
            .single-card {
                padding: 20px;
            }

            .danger-zone {
                flex-direction: column;
                align-items: flex-start;
            }

            .top-header .container {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }

            .nav-links a {
                margin: 0 0.75rem;
            }
        }

        .text-muted {
            color: #6c757d;
        }

        .small {
            font-size: 0.875rem;
        }

        .d-block {
            display: block;
        }

        .mt-3 {
            margin-top: 1rem;
        }

        .text-center {
            text-align: center;
        }

        .btn-close-card {
            font-size: 1.5rem;
            line-height: 1;
            color: #6c757d;
            text-decoration: none;
            transition: color 0.2s;
            background: transparent;
            border: none;
        }

            .btn-close-card:hover {
                color: #dc3545;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!-- Tarjeta de Datos de la Cuenta -->
     <div class="card-container">
        <div class="single-card" style="position: relative;">
            <!-- Encabezado con botón X -->
            <div class="d-flex justify-content-between align-items-start mb-4">
                <div>
                    <h1>Datos de la Cuenta</h1>
                    <p>Administra tu información personal y la seguridad de tu acceso.</p>
                </div>
                <asp:LinkButton ID="btnCerrarCard" runat="server" CssClass="btn-close-card" OnClick="btnCerrarCard_Click">
                    <i class="bi bi-x-lg"></i>
                </asp:LinkButton>
            </div>

            <!-- Formulario -->
            <div>
                <div class="form-group">
                    <div class="form-label">EMAIL</div>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <div class="form-label">TELÉFONO</div>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <div class="form-label">NOMBRE DE USUARIO</div>
                    <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <asp:Button ID="btnActualizar" runat="server" CssClass="btn-actualizar px-4 py-2" Text="Actualizar Información" OnClick="btnActualizar_Click" />
                </div>
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="text-muted small d-block mt-3 text-center"></asp:Label>

            <div class="danger-zone">
                <div>
                    <div class="danger-title">Zona de Peligro</div>
                    <div class="danger-description">
                        Al eliminar tu cuenta, perderás todo el acceso a tus datos de ganado, historial de salud y<br />
                        reportes de inventario de forma permanente.
                    </div>
                </div>
                <asp:Button ID="btnEliminarCuenta" runat="server" CssClass="btn-danger-custom" Text="Eliminar Cuenta" OnClick="btnEliminarCuenta_Click" OnClientClick="return confirm('¿Estás completamente seguro? Esta acción es irreversible.');" />
            </div>
        </div>
    </div>
</asp:Content>
