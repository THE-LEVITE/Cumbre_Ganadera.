const STORAGE = "carritoCompras";

document.addEventListener("DOMContentLoaded", () => {

    MtActualizarContador();

    if (document.getElementById("contenedorCarrito")) {
        MtCargarCarrito();
    }

    document.addEventListener("click", function (e) {

        const boton = e.target.closest(".btn-agregar");

        if (!boton) return;

        const producto = {

            id: boton.dataset.id,

            nombre: boton.dataset.nombre,

            precio: parseFloat(boton.dataset.precio),

            imagen: boton.dataset.imagen,

            cantidad: 1


        };

        MtAgregarAlCarrito(producto);

    });

});

function ObtenerCarrito() {

    return JSON.parse(localStorage.getItem(STORAGE)) || [];

}

function GuardarCarrito(carrito) {

    localStorage.setItem(STORAGE, JSON.stringify(carrito));

}

function MtAgregarAlCarrito(producto) {

    let carrito = ObtenerCarrito();

    const existente = carrito.find(x => x.id == producto.id);

    if (existente) {

        existente.cantidad++;

    }

    else {

        carrito.push(producto);

    }

    GuardarCarrito(carrito);

    MtActualizarContador();

}

function MtActualizarContador() {

    const carrito = ObtenerCarrito();

    const total = carrito.reduce((a, b) => a + b.cantidad, 0);

    const badge = document.getElementById("cart-count");

    if (badge)
        badge.innerText = total;

}

function MtCargarCarrito() {

    const carrito = ObtenerCarrito();

    const contenedor = document.getElementById("contenedorCarrito");

    const panelVacio = document.getElementById("panelVacio");

    const subtotal = document.getElementById("subtotal");

    const total = document.getElementById("total");

    contenedor.innerHTML = "";

    if (carrito.length == 0) {

        panelVacio.style.display = "block";

        subtotal.innerHTML = "0";

        total.innerHTML = "0";

        return;

    }

    panelVacio.style.display = "none";

    let totalPedido = 0;

    carrito.forEach((producto, i) => {

        const subtotalProducto = producto.precio * producto.cantidad;

        totalPedido += subtotalProducto;

        contenedor.innerHTML += `

<div class="producto-row p-3">

<div class="row align-items-center">

<div class="col-md-2">

<img
src="../Source/Img/ImgProductos/${producto.Imagen}"
class="img-fluid rounded"/>

</div>

<div class="col-md-4">

<h5>${producto.nombre}</h5>

<p class="text-success fw-bold">

$${producto.precio.toLocaleString()}

</p>

</div>

<div class="col-md-3 text-center">

<button
class="btn btn-outline-secondary btn-sm"
onclick="MtDisminuir(${i})">

-

</button>

<span class="mx-3">

${producto.cantidad}

</span>

<button
class="btn btn-outline-secondary btn-sm"
onclick="MtAumentar(${i})">

+

</button>

</div>

<div class="col-md-2">

<strong>

$${subtotalProducto.toLocaleString()}

</strong>

</div>

<div class="col-md-1">

<button
class="btn btn-outline-danger border-0"
onclick="MtEliminarProducto(${i})">

<i class="bi bi-trash"></i>

</button>

</div>

</div>

</div>

`;

    });

    subtotal.innerHTML = totalPedido.toLocaleString();

    total.innerHTML = totalPedido.toLocaleString();

}

function MtAumentar(posicion) {

    let carrito = ObtenerCarrito();

    carrito[posicion].cantidad++;

    GuardarCarrito(carrito);

    MtActualizarContador();

    MtCargarCarrito();

}

function MtDisminuir(posicion) {

    let carrito = ObtenerCarrito();

    if (carrito[posicion].cantidad > 1) {

        carrito[posicion].cantidad--;

    }

    else {

        carrito.splice(posicion, 1);

    }

    GuardarCarrito(carrito);

    MtActualizarContador();

    MtCargarCarrito();

}

function MtEliminarProducto(posicion) {

    let carrito = ObtenerCarrito();

    carrito.splice(posicion, 1);

    GuardarCarrito(carrito);

    MtActualizarContador();

    MtCargarCarrito();

}

function MtVaciarCarrito() {

    localStorage.removeItem(STORAGE);

    MtActualizarContador();

    MtCargarCarrito();

}

function MtPrepararEnvio() {

    const carrito = JSON.parse(localStorage.getItem("carritoCompras")) || [];

    let total = 0;

    carrito.forEach(producto => {
        total += producto.precio * producto.cantidad;
    });

    document.querySelector('[id$="CarritoData"]').value =
        JSON.stringify(carrito);

    document.querySelector('[id$="TotalPedido"]').value =
        total;

    return true;
}