<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ReportesDueño.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.ReportesDueño" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="gdReportesHacienda" runat="server"
        AutoGenerateColumns="true"
        AllowPaging="true"
        PageSize="3"
        OnPageIndexChanging="gdReportesHacienda_PageIndexChanging"
        CssClass="table table-bordered">

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
    <div class="modal fade" id="modalResponder" tabindex="-1" role="dialog" aria-labelledby="modalResponderLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalResponderLabel">Responder Reporte</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtRespuesta" class="font-weight-bold">Respuesta:</label>
                        <asp:TextBox ID="txtRespuesta" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Escriba su respuesta aquí..."></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnEnviarRespuesta" runat="server" Text="Enviar Respuesta" CssClass="btn btn-primary" OnClick="btnEnviarRespuesta_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
