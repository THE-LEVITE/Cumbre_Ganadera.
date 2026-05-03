<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.Historial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Source/CSS/StyleCliente.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="TituloCompra fw-bold ">HISTORIAL DE COMPRAS</h2>
    <span class="TextoHistorial">Gestiona y revisa tus pedidos anteriores realizados en la hacienda</span>


    <div class="historial-container">       

        <asp:Repeater ID="rptPedidos" runat="server">
            <ItemTemplate>
                <div class="pedido-card">
                    <div class="pedido-header">
                        <div class="pedido-info">
                            <h3 class="pedido-id "><%# Eval("Codigo") %></h3>
                            <p class="pedido-fecha ">
                                Realizado el <%# Convert.ToDateTime(Eval("FechaPedido")).ToString("dd 'de' MMMM, yyyy") %>
                            </p>
                        </div>
                        <div class="pedido-total">
                           $<%# Convert.ToDouble(Eval("ValorCompra")).ToString("N0") %>
                        </div>
                    </div>

                    <div class="pedido-productos bg-auth">
                        <div class="productos-agrupados">
                            <%# Eval("Productos") %>
                        </div>
                    </div>

                </div>
            </ItemTemplate>

        </asp:Repeater>

        <asp:Label ID="lblSinCompras" runat="server"
            CssClass="alert alert-success text-center d-block"
            Visible="false"
            Text="📢 No hay ninguna compra registrada" />

        <asp:Label ID="lblSinId" runat="server"
            CssClass="alert alert-success text-center d-block"
            Visible="false"
            Text="📢 Inicie Sesion para acceder al historial"/>

    </div>


</asp:Content>
