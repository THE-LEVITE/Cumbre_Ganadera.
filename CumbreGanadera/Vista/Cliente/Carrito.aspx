<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Mi Carrito</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <style>
        body {
            background-color: #f4f7f6;
        }

        .carrito-card {
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.08);
            background: white;
            border: none;
        }

        .producto-row {
            border-radius: 12px;
            border: 1px solid #f0f0f0;
            transition: all 0.2s;
            background: #fff;
            margin-bottom: 15px;
        }

            .producto-row:hover {
                box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            }

        .total-card {
            border-radius: 20px;
            background-color: #ffffff;
            border: none;
            box-shadow: 0 0 20px rgba(0,0,0,0.08);
        }

        .btn-confirmar {
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="CarritoData" runat="server" />
        <asp:HiddenField ID="TotalPedido" runat="server" />

        <div class="container mt-5 mb-5">
            <h3 class="fw-bold mb-4"><i class="bi bi-cart3 me-2 text-success"></i>Mi Carrito</h3>

            <div class="row">
                <div class="col-md-8">
                    <div class="card carrito-card p-4">

                        <!-- CONTENEDOR DE PRODUCTOS -->
                        <div id="contenedorCarrito">
                        </div>

                        <!-- PANEL VACÍO -->
                        <div id="panelVacio" class="text-center py-5" style="display: none;">
                            <i class="bi bi-cart-x text-secondary" style="font-size: 4rem;"></i>
                            <h5 class="text-muted mt-3">Tu carrito está vacío</h5>
                            <a href="Productos.aspx" class="btn btn-success mt-3">Ir a Productos</a>
                        </div>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card total-card p-4">
                        <h5 class="fw-bold mb-4">Resumen del pedido</h5>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Subtotal</span>
                            <span class="fw-bold">$<span id="subtotal">0.00</span></span>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold fs-5">Total</span>
                            <span class="fw-bold fs-5 text-success">$<span id="total">0.00</span></span>
                        </div>

                        <asp:Button ID="btnConfirmarPedido" runat="server"
                            Text="Confirmar pedido"
                            CssClass="btn btn-success w-100 btn-confirmar"
                            OnClientClick="MtPrepararEnvio();"
                            OnClick="btnConfirmarPedido_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="../Source/JS/Carrito.js"></script>
</body>
</html>
