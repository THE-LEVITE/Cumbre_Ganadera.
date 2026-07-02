<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="VerProducto.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.VerProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mt-3">
        <div class="col-5">
            <div class="recuadroImagenProducto">
                <img runat="server" id="ImagenProducto" class="verImagen" />
            </div>
        </div>
        <div class="col-7 textoProducto">
            <p id="pNombreProducto" runat="server" class="mb-3"></p>
            <p id="pDescripcion" runat="server" class="mb-3 textoDescripcion">></p>
            <p id="pPrecio" runat="server" class="mb-3"></p>
            <p id="pCalificacion" runat="server" class="mb-3"></p>
            <p visible="false" id="StockBajo" runat="server" class="pocoStock mb-3">Pocas unidades</p>
            <p id="IdProducto" runat="server" visible="false"></p>

            <%--<button
                id="btnAgregarCarrito"
                runat="server"
                type="button"
                class="btn-agregar">
                Agregar al carrito
            </button>--%>
        </div>
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
