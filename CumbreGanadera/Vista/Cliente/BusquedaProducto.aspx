<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="BusquedaProducto.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.BusuqedaProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Source/CSS/StyleCliente.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="SeccionBusqueda" visible="true">
        <div class="Busqueda-titulo">
            <h3 class="TextoBusqueda"><i class="bi bi-basket-fill me-2"></i>Resultado de Busqueda</h3>
        </div>
        <div class="row">
            <asp:Repeater ID="rptBusqueda" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <img src="<%# Eval("FotoProducto") %>" class="card-img-top" alt="ImgProducto">
                            <div class="card-body">
                                <h5 class="card-title fw-bold"><%# Eval("Nombre") %></h5>
                                <p class="card-text text-white fw-bold"><%# Eval("Descripcion") %></p>                               
                                <div class="card-footer-content">
                                    <p class="card-text-precio fw-bold">Precio: $<%# Eval("Precio") %></p>
                                    <button class="btn-comprar">Agregar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <asp:Label ID="lblSinProductos" runat="server"
            CssClass="alert alert-success text-center d-block"
            Visible="false"
            Text="📢 No hay productos relacionados con la búsqueda." />

    </div>

</asp:Content>
