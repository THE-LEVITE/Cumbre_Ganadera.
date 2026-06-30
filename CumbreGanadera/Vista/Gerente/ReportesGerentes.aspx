<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ReportesGerentes.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.ReportesGerentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Contenedor principal */
        .content-wrapper {
            background: white;
            border-radius: 12px;
            padding: 25px 30px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.06);
            border: 1px solid #e9ecef;
            margin-bottom: 25px;
        }

        /* Títulos */
        .section-title {
            color: #2d3748;
            font-weight: 600;
            font-size: 1.2rem;
            padding-bottom: 12px;
            border-bottom: 2px solid #e9ecef;
            margin-bottom: 20px;
        }

        .section-title i {
            color: #667eea;
            margin-right: 8px;
        }

        .subtitle {
            color: #6c757d;
            font-size: 0.95rem;
            margin-bottom: 25px;
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
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }

        /* ====== ALERTAS ====== */
        .alert-custom {
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .alert-info-custom {
            background: #e7f3ff;
            border-left: 4px solid #667eea;
            color: #2d3748;
        }

        .alert-warning-custom {
            background: #fff8e7;
            border-left: 4px solid #f59e0b;
            color: #2d3748;
        }

        /* ====== TARJETA DE RESPUESTA ====== */
        .response-card {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            border: 1px solid #e9ecef;
            margin-top: 20px;
        }

        .response-card .response-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e9ecef;
        }

        .response-card .response-title i {
            color: #667eea;
            margin-right: 8px;
        }

        .response-card .form-group {
            margin-bottom: 18px;
        }

        .response-card .form-group label {
            font-weight: 600;
            color: #2d3748;
            font-size: 0.9rem;
            margin-bottom: 5px;
            display: block;
        }

        .response-card .form-group label i {
            color: #667eea;
            margin-right: 6px;
        }

        .response-card .form-control {
            border-radius: 8px;
            border: 2px solid #e9ecef;
            padding: 10px 15px;
            transition: all 0.3s ease;
            background: white;
            min-height: 45px;
        }

        .response-card .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }

        .response-card .form-control[readonly] {
            background: #f1f3f5;
            cursor: not-allowed;
        }

        /* ====== TARJETA DE CREAR SOLICITUD ====== */
        .card-solicitud {
            background: white;
            border-radius: 12px;
            padding: 25px;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            margin-top: 30px;
        }

        .card-solicitud .card-header {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2d3748;
            padding-bottom: 15px;
            border-bottom: 2px solid #e9ecef;
            margin-bottom: 20px;
        }

        .card-solicitud .card-header i {
            color: #11998e;
            margin-right: 8px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-row .form-group {
            margin-bottom: 18px;
        }

        .form-row .form-group label {
            font-weight: 600;
            color: #2d3748;
            font-size: 0.9rem;
            margin-bottom: 5px;
            display: block;
        }

        .form-row .form-group label i {
            color: #667eea;
            margin-right: 6px;
        }

        .form-row .form-group .form-control {
            border-radius: 8px;
            border: 2px solid #e9ecef;
            padding: 10px 15px;
            transition: all 0.3s ease;
            width: 100%;
            min-height: 60px;
            resize: vertical;
        }

        .form-row .form-group .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }

        /* ====== BOTONES ====== */
        .btn-container {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn-save {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            border: none;
            color: white;
            padding: 12px 35px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-save:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 20px rgba(56, 239, 125, 0.4);
            color: white;
        }

        .btn-save:active {
            transform: scale(0.95);
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }

            .custom-select {
                max-width: 100%;
            }

            .content-wrapper {
                padding: 15px;
            }

            .btn-container {
                flex-direction: column;
            }

            .btn-container .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ====== SECCIÓN DE SELECCIÓN DE SOLICITUD ====== -->
    <div class="content-wrapper">
        <div class="section-title">
            <i class="bi bi-search"></i> Consultar Respuesta de Solicitud
        </div>

        <div class="filter-section">
            <div class="row align-items-end">
                <div class="col-md-8">
                    <label for="<%= ddlSolicitudes.ClientID %>" class="form-label">
                        <i class="bi bi-list-ul"></i> Seleccione una solicitud
                    </label>
                    <asp:DropDownList ID="ddlSolicitudes" runat="server"
                        OnSelectedIndexChanged="ddlSolicitudes_SelectedIndexChanged"
                        CssClass="form-select custom-select"
                        AutoPostBack="true">
                        <asp:ListItem Text="-- Seleccione una solicitud --" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-4 text-end">
                    <span class="badge bg-secondary p-2">
                        <i class="bi bi-info-circle"></i> Consulte el estado de sus solicitudes
                    </span>
                </div>
            </div>
        </div>

        <!-- ALERTAS -->
        <asp:Label ID="lblSinSolicitud" runat="server"
            CssClass="alert-custom alert-warning-custom d-block"
            Visible="false">
            <i class="bi bi-exclamation-triangle"></i> Elija una solicitud para buscar la respuesta.
        </asp:Label>

        <asp:Label ID="lblSinRespuesta" runat="server"
            CssClass="alert-custom alert-info-custom d-block"
            Visible="false">
            <i class="bi bi-info-circle"></i> La solicitud seleccionada aún no tiene respuesta.
        </asp:Label>

        <!-- RESPUESTA -->
        <div id="respuestaSolicitud" runat="server" visible="false">
            <div class="response-card">
                <div class="response-title">
                    <i class="bi bi-reply-all"></i> Respuesta a la Solicitud
                </div>

                <div class="form-group">
                    <label><i class="bi bi-tag"></i> Título</label>
                    <asp:TextBox ID="txtTituloRespuesta" runat="server" 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        Rows="2"
                        ReadOnly="true" />
                </div>

                <div class="form-group">
                    <label><i class="bi bi-textarea"></i> Descripción</label>
                    <asp:TextBox ID="txtDescripcionRespuesta" runat="server" 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        Rows="2"
                        ReadOnly="true" />
                </div>

                <div class="form-group">
                    <label><i class="bi bi-exclamation-triangle"></i> Motivo</label>
                    <asp:TextBox ID="txtMotivoRespuesta" runat="server" 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        Rows="2"
                        ReadOnly="true" />
                </div>

                <div class="form-group">
                    <label><i class="bi bi-calendar3"></i> Fecha de la Respuesta</label>
                    <asp:TextBox ID="txtFechaRespuesta" runat="server" 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        Rows="1"
                        ReadOnly="true" />
                </div>
            </div>
        </div>
    </div>

    <!-- ====== SECCIÓN DE CREAR SOLICITUD ====== -->
    <div class="content-wrapper">
        <div class="card-solicitud">
            <div class="card-header">
                <i class="bi bi-file-earmark-plus"></i> CREAR NUEVA SOLICITUD
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label><i class="bi bi-tag"></i> Título de la Solicitud</label>
                    <asp:TextBox ID="txtTitulo" runat="server" 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        Rows="2"
                        placeholder="Ingrese el título de la solicitud..." />
                </div>

                <div class="form-group">
                    <label><i class="bi bi-exclamation-triangle"></i> Motivo de la Solicitud</label>
                    <asp:TextBox ID="txtMotivo" runat="server" 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        Rows="2"
                        placeholder="Ingrese el motivo de la solicitud..." />
                </div>

                <div class="form-group" style="grid-column: 1 / -1;">
                    <label><i class="bi bi-textarea"></i> Descripción de la Solicitud</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" 
                        CssClass="form-control" 
                        TextMode="MultiLine" 
                        Rows="3"
                        placeholder="Ingrese la descripción detallada de la solicitud..." />
                </div>
            </div>

            <div class="btn-container">
                <asp:Button ID="btnEnviarSolicitud" runat="server" 
                    Text="📤 ENVIAR SOLICITUD" 
                    CssClass="btn-save" 
                    OnClick="btnEnviarSolicitud_Click" />
            </div>
        </div>
    </div>

</asp:Content>