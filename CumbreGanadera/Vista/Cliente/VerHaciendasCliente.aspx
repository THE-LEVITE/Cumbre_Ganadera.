<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="VerHaciendasCliente.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.VerHaciendasCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <asp:Repeater ID="rptHaciendas" runat="server">
            <itemtemplate>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="<%# Eval("FotoHacienda") %>" class="card-img-top" alt="ImgProducto">
                        <div class="card-body">
                            <h5 class="card-title fw-bold"><%# Eval("NombreHacienda") %></h5>
                            <p class="card-text text-white fw-bold"><%# Eval("TipoProduccion") %></p>
                            <div class="card-footer-content">
                                <p class="card-text-precio fw-bold">Ubicacion: <%# Eval("NombreCiudad") %>/ <%# Eval("Departamento") %> </p>
                                <asp:Button CssClass="btn-comprar" ID="btnVerProductos" runat="server" Text="Ver Productos" CommandArgument='<%# Eval("Id") %>' OnCommand="btnVerProductos_Command" />
                            </div>
                        </div>
                    </div>
                </div>
            </itemtemplate>
        </asp:Repeater>
    </div>
</asp:Content>
