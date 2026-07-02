<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="BusquedaProducto.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.BusuqedaProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Source/CSS/StyleCliente.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="SeccionBusqueda" visible="true">
        <div class="Busqueda-titulo">
            <h3 class="TextoBusqueda"><i class="bi bi-basket-fill me-2"></i>Resultado de Busqueda</h3>
        </div>
        <div class="row g-4">

            <asp:Repeater ID="rptBusqueda" runat="server">
                <ItemTemplate>

                    <div class="col-lg-4 col-md-6">

                        <div class="card shadow-sm border-0 rounded-4 h-100">
                    <img src="<%# Eval("FotoProducto") %>"
                        class="card-img-top"
                        alt="Producto" />

                            <img src="../Source/Img/ImgProductos/LecheProbioticos.jpg"

                            <div class="card-body d-flex flex-column">

                                <h5 class="card-title fw-bold">
                                    <%# Eval("Nombre") %>
                        </h5>

                                <p class="card-text text-muted flex-grow-1">
                                    <%# Eval("Descripcion") %>
                                </p>

                                <div class="d-flex justify-content-between align-items-center mt-3">

                                    <span class="precio">$<%# Eval("Precio") %>
                            </span>

                                    <button class="btn btn-success rounded-3">
                                        <i class="bi bi-cart-plus"></i>
                                        Agregar
                           
                                    </button>

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
            Text="❌ No hay productos relacionados con la búsqueda." />

        <asp:Label ID="lblBusquedaVacia" runat="server"
            CssClass="alert alert-success text-center d-block"
            Visible="false"
            Text="🔍 Ingrese un producto para buscar" />

    </div>

</asp:Content>
