<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ProductosHacienda.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.ProductosHacienda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <asp:Repeater ID="rptProductos" runat="server">
            <ItemTemplate>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">

                        <img src="<%# Eval("FotoProducto") %>" class="card-img-top" alt="ImgProducto" />

                        <div class="card-body">

                            <h5 class="card-title fw-bold">
                                <%# Eval("Nombre") %>
                            </h5>

                            <div class="card-footer-content">

                                <p class="card-text-precio fw-bold">
                                    Precio: $<%# Eval("Precio", "{0:N0}") %>
                                </p>

                                <!-- BOTÓN DETALLES -->
                                <asp:Button
                                    ID="btnVerProductos"
                                    runat="server"
                                    CssClass="btn-comprar"
                                    Text="Detalles"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnCommand="btnVerProductos_Command" />

                                <!-- BOTÓN AGREGAR AL CARRITO -->
                                <button
                                    type="button"
                                    class="btn-agregar"
                                    data-id="<%# Eval("Id") %>"
                                    data-nombre="<%# Eval("Nombre") %>"
                                    data-precio="<%# Eval("Precio") %>"
                                    data-imagen='<%# Eval("FotoProducto") %>'>
                                    Agregar al carrito

                                </button>

                            </div>

                        </div>

                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="cart-floating-button" onclick="window.location='Carrito.aspx'" style="position: fixed; bottom: 30px; right: 30px; cursor: pointer; z-index: 1000;">
        <div style="background-color: #28a745; width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 15px rgba(0,0,0,0.3); position: relative;">
            <i class="bi bi-cart-fill" style="color: white; font-size: 30px;"></i>

            <span id="cart-count" style="position: absolute; top: 0; right: 0; background-color: #e74c3c; color: white; border-radius: 50%; width: 26px; height: 26px; display: flex; align-items: center; justify-content: center; font-size: 13px; font-weight: bold; border: 2px solid white;"></span>
        </div>
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Se ejecuta apenas carga la página
            MtActualizarContador();

            document.addEventListener('click', function (e) {
                const boton = e.target.closest('.btn-agregar');

                if (boton) {
                    const producto = {
                        id: boton.getAttribute('data-id'),
                        nombre: boton.getAttribute('data-nombre'),
                        precio: parseFloat(boton.getAttribute('data-precio')),
                        Imagen: boton.getAttribute("data-imagen"),
                        cantidad: 1
                    };
                    MtAgregarAlCarrito(producto);
                }
            });
        });

        function MtAgregarAlCarrito(nuevoProducto) {
            let carrito = JSON.parse(localStorage.getItem('carritoCompras')) || [];
            const existe = carrito.find(p => p.id == nuevoProducto.id);

            if (existe) {
                existe.cantidad++;
            } else {
                carrito.push(nuevoProducto);
            }

            localStorage.setItem('carritoCompras', JSON.stringify(carrito));


            MtActualizarContador();


        }

        function MtActualizarContador() {
            let carrito = JSON.parse(localStorage.getItem('carritoCompras')) || [];
            // Sumamos las cantidades de todos los productos
            const total = carrito.reduce((acc, p) => acc + p.cantidad, 0);

            const badge = document.getElementById('cart-count');
            if (badge) {
                badge.innerText = total;
            }
        }
    </script>


</asp:Content>
