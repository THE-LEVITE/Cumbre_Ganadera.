<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ReportesDueño.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.ReportesDueño" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
            max-width: 300px;
            border-radius: 8px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        
        .custom-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .table-container {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            border: 1px solid #e9ecef;
        }
        
        .table-container .table {
            margin-bottom: 0;
        }
        
        .table-container .table thead th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-bottom: none;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            padding: 15px 10px;
        }
        
        .table-container .table thead th:first-child {
            border-radius: 8px 0 0 0;
        }
        
        .table-container .table thead th:last-child {
            border-radius: 0 8px 0 0;
        }
        
        .table-container .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .table-container .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: rgba(102, 126, 234, 0.05);
        }
        
       
        .btn-responder {
            background: linear-gradient(135deg, #91fc5b 0%, #8bd33a 100%);
            border: none;
            color: white;
            padding: 6px 20px;
            border-radius: 20px;
            font-size: 0.85rem;
            transition: all 0.3s ease;
        }
        
        .btn-responder:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            color: white;
        }
       
        .pagination-custom {
            margin-top: 25px;
            padding-top: 20px;
            border-top: 2px solid #e9ecef;
            text-align: center;
            background: #eaebf1; 
        }

        .pagination-custom table {
            margin: 0 auto;
            background: #eaebf1; 
        }

        .pagination-custom td {
            padding: 0 5px;
            background: #eaebf1; 
        }

        /* BOTONES DE PAGINACIÓN */
        .pagination-custom a, 
        .pagination-custom span {
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

        /* HOVER DE PAGINACIÓN */
        .pagination-custom a:hover {
            background: #a0e649; 
            color: white;
            border-color: #a0e649; 
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        
        .pagination-custom span {
            background: linear-gradient(135deg, #91fc5b 0%, #8bd33a 100%); 
            color: white;
            border-color: rgb(12, 65, 144); 
        }

        /* Estilos Modal */
        .modal-content {
            border-radius: 15px;
            border: none;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        
        .modal-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 20px 30px;
        }
        
        .modal-header .btn-close {
            filter: brightness(0) invert(1);
        }
        
        .modal-body {
            padding: 30px;
        }
        
        .modal-footer {
            border-top: none;
            padding: 0 30px 30px 30px;
        }
        
        .modal-footer .btn {
            border-radius: 20px;
            padding: 8px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .modal-footer .btn-secondary {
            background: #6c757d;
            border: none;
        }
        
        .modal-footer .btn-success {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            border: none;
        }
        
        .modal-footer .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(56, 239, 125, 0.4);
        }
        
        .modal-body .form-label {
            font-weight: 600;
            color: #495057;
            font-size: 0.9rem;
        }
        
        .modal-body .form-control {
            border-radius: 8px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        
        .modal-body .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .modal-body .info-label {
            background: #f8f9fa;
            padding: 10px 15px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
            display: inline-block;
            width: 100%;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="filter-section">
        <div class="row align-items-end">
            <div class="col-md-6">
                <label for="<%= ddlHaciendas.ClientID %>" class="form-label">
                    <i class="bi bi-building"></i> Seleccionar Hacienda
                </label>
                <asp:DropDownList ID="ddlHaciendas" runat="server" 
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlHaciendas_SelectedIndexChanged" 
                    CssClass="form-select custom-select">
                    <asp:ListItem Text="-- Seleccione una hacienda --" Value="" />
                </asp:DropDownList>
            </div>            
        </div>
    </div>

    <div id="tablaReportes" runat="server" visible="false">
        <div class="table-container">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="mb-0">
                    <i class="bi bi-file-text"></i> Solicitudes de la Hacienda                    
                </h5>
            </div>
            
            <asp:GridView ID="gdReportesHacienda" runat="server"
                AutoGenerateColumns="false"
                AllowPaging="true"
                PageSize="15"
                OnPageIndexChanging="gdReportesHacienda_PageIndexChanging"
                CssClass="table table-hover table-striped table-bordered"
                GridLines="None">
                
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="60px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Titulo" HeaderText="Título" HeaderStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" HeaderStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Motivo" HeaderText="Motivo" HeaderStyle-CssClass="text-center" />
                    <asp:BoundField DataField="FechaCreacion" 
                        HeaderText="Fecha Creación" 
                        HeaderStyle-CssClass="text-center" 
                        DataFormatString="{0:dd/MM/yyyy}" 
                        HtmlEncode="false" />
                    
                    <asp:TemplateField HeaderText="Acción" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                        <ItemTemplate>
                            <asp:Button ID="btnResponder" runat="server"
                                Text="Responder"
                                CommandName="SeleccionarFila"
                                CommandArgument='<%# Eval("Id") %>'
                                CssClass="btn btn-responder btn-sm" 
                                OnClick="btnResponder_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-custom" HorizontalAlign="Center" />
                <HeaderStyle CssClass="text-center" />
                <RowStyle CssClass="align-middle" />
            </asp:GridView>
        </div>
    </div>

    <div class="modal fade" id="modalResponder" tabindex="-1" aria-labelledby="modalLabelResponder" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabelEditar">
                        <i class="bi bi-reply-all"></i> Responder Solicitud
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="modal-body">
                    <asp:HiddenField ID="hdnIdEdit" runat="server" Value="0" />
                    
                    <div class="row">
                        <div class="col-12 mb-3">
                            <label class="form-label">
                                <i class="bi bi-person"></i> Nombre del Gerente
                            </label>
                            <div class="info-label">
                                <asp:Label ID="lblGerente" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                <i class="bi bi-tag"></i> Título
                            </label>
                            <input type="text" id="txtTitulo" class="form-control" runat="server" placeholder="Ingrese el título " />
                        </div>
                        
                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                <i class="bi bi-exclamation-triangle"></i> Motivo
                            </label>
                            <input type="text" id="txtMotivo" class="form-control" runat="server" placeholder="Ingrese un motivo" />
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-12 mb-3">
                            <label class="form-label">
                                <i class="bi bi-textarea"></i> Descripción
                            </label>
                            <input type="text" id="txtDescripcion" class="form-control" runat="server" placeholder="Ingrese una descripcion detallada" />
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="bi bi-x-circle"></i> Cancelar
                    </button>
                    <asp:Button ID="btnEnviarRespuesta" runat="server" 
                        Text="Enviar Respuesta" 
                        CssClass="btn btn-success" 
                        OnClick="btnEnviarRespuesta_Click" />
                </div>
            </div>
        </div>
    </div>

    <asp:Label ID="lblSinHacienda" runat="server"
    CssClass="alert alert-success text-center d-block"
    Visible="false"
    Text="‼️ Elija una Hacienda para la busqueda. ‼️" />

<asp:Label ID="lblSinSolicitudes" runat="server"
    CssClass="alert alert-success text-center d-block"
    Visible="false"
    Text="🔍 Esta Hacienda no tiene solicitudes actualmente" />

</asp:Content>