<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="BusquedaProducto.aspx.cs" Inherits="CumbreGanadera.Vista.Cliente.BusuqedaProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        /* ====== ESTILOS GENERALES ====== */
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f5f7;
        }

        /* ====== ENCABEZADO DE BÚSQUEDA ====== */
        .search-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }

        .search-header h3 {
            font-weight: 700;
            color: #1a202c;
            margin: 0;
        }

        .search-header h3 i {
            color: #4b6043;
            margin-right: 10px;
        }

        .search-header .badge-count {
            background: #4b6043;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .search-header .badge-count i {
            margin-right: 6px;
        }

        /* ====== CONTENEDOR DE PRODUCTOS ====== */
        .products-container {
            padding: 10px 0;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }

        /* ====== TARJETA DE PRODUCTO ====== */
        .product-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.10);
            border-color: #4b6043;
        }

        /* ====== IMAGEN ====== */
        .product-card .product-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }

        .product-card .product-image-placeholder {
            width: 100%;
            height: 220px;
            background: linear-gradient(135deg, #e9ecef 0%, #dee2e6 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #adb5bd;
            font-size: 3rem;
            border-bottom: 1px solid #e9ecef;
        }

        /* ====== CUERPO DE LA TARJETA ====== */
        .product-card .card-body {
            padding: 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .product-card .card-body .product-name {
            font-weight: 700;
            font-size: 1.1rem;
            color: #1a202c;
            margin-bottom: 8px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-card .card-body .product-description {
            color: #6c757d;
            font-size: 0.9rem;
            flex: 1;
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        /* ====== PIE DE LA TARJETA ====== */
        .product-card .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 15px;
            border-top: 1px solid #e9ecef;
            margin-top: auto;
        }

        .product-card .card-footer .product-price {
            font-size: 1.3rem;
            font-weight: 700;
            color: #4b6043;
        }

        .product-card .card-footer .product-price i {
            font-size: 1rem;
            color: #6c757d;
        }

        /* ====== BOTÓN AGREGAR ====== */
        .btn-add {
            background: linear-gradient(135deg, #4b6043 0%, #3d5036 100%);
            border: none;
            color: white;
            padding: 8px 20px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 2px 8px rgba(75, 96, 67, 0.2);
        }

        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(75, 96, 67, 0.35);
            color: white;
        }

        .btn-add:active {
            transform: scale(0.95);
        }

        /* ====== ALERTAS ====== */
        .alert-custom {
            padding: 20px 25px;
            border-radius: 12px;
            margin-top: 30px;
            font-weight: 500;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .alert-custom i {
            font-size: 1.5rem;
        }

        .alert-warning-custom {
            background: #fff8e7;
            border-left: 4px solid #f59e0b;
            color: #2d3748;
        }

        .alert-info-custom {
            background: #e7f3ff;
            border-left: 4px solid #4b6043;
            color: #2d3748;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 992px) {
            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
                gap: 20px;
            }
        }

        @media (max-width: 768px) {
            .search-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .search-header .badge-count {
                align-self: flex-start;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 16px;
            }

            .product-card .product-image,
            .product-card .product-image-placeholder {
                height: 170px;
            }

            .product-card .card-body {
                padding: 15px;
            }

            .product-card .card-body .product-name {
                font-size: 1rem;
            }

            .product-card .card-footer .product-price {
                font-size: 1.1rem;
            }

            .btn-add {
                padding: 6px 16px;
                font-size: 0.8rem;
            }
        }

        @media (max-width: 576px) {
            .products-grid {
                grid-template-columns: 1fr 1fr;
                gap: 12px;
            }

            .product-card .product-image,
            .product-card .product-image-placeholder {
                height: 140px;
            }

            .product-card .card-body {
                padding: 12px;
            }

            .product-card .card-body .product-name {
                font-size: 0.9rem;
            }

            .product-card .card-body .product-description {
                font-size: 0.8rem;
                -webkit-line-clamp: 1;
            }

            .product-card .card-footer {
                flex-direction: column;
                gap: 10px;
                align-items: stretch;
            }

            .product-card .card-footer .product-price {
                text-align: center;
                font-size: 1rem;
            }

            .btn-add {
                justify-content: center;
                padding: 8px 12px;
                font-size: 0.75rem;
            }

            .search-header h3 {
                font-size: 1.2rem;
            }

            .search-header .badge-count {
                font-size: 0.75rem;
                padding: 5px 14px;
            }

            .alert-custom {
                padding: 15px 18px;
                font-size: 0.85rem;
            }

            .alert-custom i {
                font-size: 1.2rem;
            }
        }

        @media (max-width: 400px) {
            .products-grid {
                grid-template-columns: 1fr;
                gap: 16px;
            }

            .product-card .product-image,
            .product-card .product-image-placeholder {
                height: 200px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid p-4">
        <!-- ====== ENCABEZADO ====== -->
        <div class="search-header">
            <h3>
                <i class="bi bi-basket-fill"></i> Resultado de Búsqueda
            </h3>
            <span class="badge-count">
                <i class="bi bi-box-seam"></i> 
                <asp:Label ID="lblCantidadProductos" runat="server" Text="0" /> productos
            </span>
        </div>

        <!-- ====== GRID DE PRODUCTOS ====== -->
        <div class="products-container">
            <div class="products-grid">
                <asp:Repeater ID="rptBusqueda" runat="server">
                    <ItemTemplate>
                        <div class="product-card">
                            <!-- IMAGEN -->
                            <asp:Image ID="imgProducto" runat="server"
                                ImageUrl='<%# Eval("FotoProducto") %>'
                                CssClass="product-image"
                                AlternateText='<%# Eval("Nombre") %>'
                                onerror="this.src='../Source/Img/ImgProductos/ProductoDefault.jpg'; this.onerror=null;" />

                            <!-- CUERPO -->
                            <div class="card-body">
                                <h5 class="product-name">
                                    <%# Eval("Nombre") %>
                                </h5>
                                <p class="product-description">
                                    <%# Eval("Descripcion") %>
                                </p>

                                <!-- PIE -->
                                <div class="card-footer">
                                    <span class="product-price">
                                        <i class="bi bi-currency-dollar"></i> <%# Eval("Precio") %>
                                    </span>
                                    <asp:LinkButton ID="btnAgregar" runat="server"
                                        CssClass="btn-add"
                                        OnClick="btnAgregar_Click"
                                        CommandArgument='<%# Eval("Id") %>'>
                                        <i class="bi bi-cart-plus"></i> Agregar
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- ====== ALERTAS ====== -->
        <asp:Label ID="lblSinProductos" runat="server"
            CssClass="alert-custom alert-warning-custom d-block"
            Visible="false">
            <i class="bi bi-exclamation-triangle"></i> No hay productos relacionados con la búsqueda.
        </asp:Label>

        <asp:Label ID="lblBusquedaVacia" runat="server"
            CssClass="alert-custom alert-info-custom d-block"
            Visible="false">
            <i class="bi bi-search"></i> Ingrese un producto para buscar.
        </asp:Label>
    </div>

</asp:Content>