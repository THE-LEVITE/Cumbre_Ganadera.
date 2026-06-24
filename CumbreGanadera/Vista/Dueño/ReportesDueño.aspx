<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ReportesDueño.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.ReportesDueño" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="gdReportesHacienda" runat="server"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="3"
        OnPageIndexChanging="gdReportesHacienda_PageIndexChanging"
        CssClass="table table-hover table-striped table-bordered">

        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
            <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
            <asp:BoundField DataField="Motivo" HeaderText="Motivo" />
            <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha Creacion" />
            <asp:BoundField DataField="Hacienda" HeaderText="Hacienda" />
            
            <asp:TemplateField HeaderText="Acción">
                <ItemTemplate>
                    <asp:Button ID="btnResponder" runat="server" 
                        Text="Responder" 
                        CommandName="SeleccionarFila" 
                        CommandArgument='<%# Eval("Id") %>' 
                        CssClass="btn btn-primary" OnClick="btnResponder_Click"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
        <PagerSettings Mode="NumericFirstLast" />
    </asp:GridView>

    <!-- MODAL SIMPLE -->
    <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalLabelEditar" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabelEditar">Editar Instructor</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <asp:HiddenField ID="hdnIdEdit" runat="server" Value="0" />

                <div class="mb-3">
                    <label class="form-label">Nombre</label>
                    <input type="text" id="txtNombreEdit" class="form-control" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Apellido</label>
                    <input type="text" id="txtApellidoEdit" class="form-control" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Correo</label>
                    <input type="text" id="txtCorreoEdit" class="form-control" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Contraseña</label>
                    <input type="text" id="txtContraEdit" class="form-control" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Especialidad</label>
                    <input type="text" id="txtEspecialidadEdit" class="form-control" runat="server" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <asp:Button ID="btnEnviarRespuesta" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnEnviarRespuesta_Click" />
            </div>
        </div>
    </div>
</div>

</asp:Content>
