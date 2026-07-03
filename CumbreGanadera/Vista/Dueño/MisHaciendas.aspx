<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="MisHaciendas.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.MisHaciendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        /* ====== ESTILOS CORPORATIVOS ====== */
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }

        .page-header h3 {
            font-weight: 700;
            color: #1a202c;
            margin: 0;
            font-family: 'Inter', sans-serif;
        }

        .page-header h3 i {
            color: #4b6043;
            margin-right: 10px;
        }

        .page-header .badge-count {
            background: #4b6043;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.9rem;
            font-family: 'Inter', sans-serif;
        }

        .page-header .badge-count i {
            margin-right: 6px;
        }

        /* ====== CONTENEDOR DE TARJETAS ====== */
        .cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 25px;
            padding: 10px 0;
        }

        /* ====== TARJETA DE HACIENDA ====== */
        .card-hacienda {
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

        .card-hacienda:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.10);
            border-color: #4b6043;
        }

        /* ====== IMAGEN ====== */
        .card-hacienda .image-container {
            width: 100%;
            height: 220px;
            overflow: hidden;
            background: #f8f9fa;
            position: relative;
        }

        .card-hacienda .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .card-hacienda:hover .image-container img {
            transform: scale(1.05);
        }

        .card-hacienda .image-container .image-placeholder {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #e9ecef 0%, #dee2e6 100%);
            color: #adb5bd;
            font-size: 4rem;
        }

        /* ====== CUERPO DE LA TARJETA ====== */
        .card-hacienda .card-body {
            padding: 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .card-hacienda .card-body .hacienda-name {
            font-weight: 700;
            font-size: 1.3rem;
            color: #1a202c;
            margin-bottom: 8px;
            font-family: 'Inter', sans-serif;
        }

        .card-hacienda .card-body .hacienda-name i {
            color: #4b6043;
            margin-right: 8px;
        }

        .card-hacienda .card-body .hacienda-location {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 6px;
            font-family: 'Inter', sans-serif;
        }

        .card-hacienda .card-body .hacienda-location i {
            color: #4b6043;
        }

        .card-hacienda .card-body .hacienda-description {
            color: #495057;
            font-size: 0.95rem;
            flex: 1;
            margin-bottom: 15px;
            line-height: 1.5;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            font-family: 'Inter', sans-serif;
        }

        .card-hacienda .card-body .hacienda-description i {
            color: #4b6043;
            margin-right: 6px;
        }

        .card-hacienda .card-body .hacienda-type {
            display: inline-block;
            padding: 4px 14px;
            background: rgba(75, 96, 67, 0.10);
            color: #4b6043;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            margin-bottom: 15px;
            align-self: flex-start;
            font-family: 'Inter', sans-serif;
        }

        /* ====== PIE DE LA TARJETA ====== */
        .card-hacienda .card-footer {
            display: flex;
            justify-content: flex-end;
            padding-top: 15px;
            border-top: 1px solid #e9ecef;
            margin-top: auto;
        }

        .btn-ver {
            background: linear-gradient(135deg, #4b6043 0%, #3d5036 100%);
            border: none;
            color: white;
            padding: 10px 28px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 8px rgba(75, 96, 67, 0.2);
            font-family: 'Inter', sans-serif;
        }

        .btn-ver:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(75, 96, 67, 0.35);
            color: white;
        }

        .btn-ver:active {
            transform: scale(0.95);
        }

        .btn-ver i {
            font-size: 1.1rem;
        }

        /* ====== SIN HACIENDAS ====== */
        .alert-custom {
            padding: 30px 25px;
            border-radius: 12px;
            margin-top: 20px;
            font-weight: 500;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 15px;
            justify-content: center;
            font-family: 'Inter', sans-serif;
        }

        .alert-custom i {
            font-size: 2rem;
        }

        .alert-info-custom {
            background: #e7f3ff;
            border-left: 4px solid #4b6043;
            color: #2d3748;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 992px) {
            .cards-container {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
            }
        }

        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .page-header .badge-count {
                align-self: flex-start;
            }

            .cards-container {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 16px;
            }

            .card-hacienda .image-container {
                height: 180px;
            }

            .card-hacienda .card-body {
                padding: 15px;
            }

            .card-hacienda .card-body .hacienda-name {
                font-size: 1.1rem;
            }

            .card-hacienda .card-body .hacienda-description {
                font-size: 0.85rem;
            }

            .btn-ver {
                padding: 8px 20px;
                font-size: 0.8rem;
            }
        }

        @media (max-width: 576px) {
            .cards-container {
                grid-template-columns: 1fr;
                gap: 16px;
            }

            .card-hacienda .image-container {
                height: 200px;
            }

            .card-hacienda .card-body {
                padding: 15px;
            }

            .card-hacienda .card-body .hacienda-name {
                font-size: 1.1rem;
            }

            .card-hacienda .card-body .hacienda-description {
                font-size: 0.85rem;
            }

            .btn-ver {
                width: 100%;
                justify-content: center;
            }

            .page-header h3 {
                font-size: 1.2rem;
            }

            .page-header .badge-count {
                font-size: 0.75rem;
                padding: 5px 14px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid p-4">
        <!-- ====== ENCABEZADO ====== -->
        <div class="page-header">
            <h3>
                <i class="bi bi-building"></i> Mis Haciendas
            </h3>
            <span class="badge-count">
                <i class="bi bi-database"></i> Total: <asp:Label ID="lblTotalHaciendas" runat="server" Text="0" />
            </span>
        </div>

        <!-- ====== CONTENEDOR DE TARJETAS ====== -->
        <div class="cards-container" id="divCards" runat="server" visible="true">
            <asp:Repeater ID="rptHacienda" runat="server" OnItemCommand="rptHacienda_ItemCommand">
                <ItemTemplate>
                    <div class="card-hacienda">
                        <!-- IMAGEN -->
                        <div class="image-container">
                            <asp:Image ID="imgHacienda" runat="server"
                                ImageUrl='<%# Eval("FotoHacienda") %>'
                                AlternateText='<%# Eval("NombreHacienda") %>'
                                onerror="this.src='../Source/Img/ImgHaciendas/HaciendaDefault.jpg'; this.onerror=null;" />
                        </div>

                        <!-- CUERPO -->
                        <div class="card-body">
                            <h5 class="hacienda-name">
                                <i class="bi bi-house"></i> <%# Eval("NombreHacienda") %>
                            </h5>

                            <div class="hacienda-location">
                                <i class="bi bi-geo-alt"></i>
                                <%# Eval("NombreCiudad") %> / <%# Eval("Departamento") %>
                            </div>

                            <div class="hacienda-description">
                                <i class="bi bi-file-text"></i>
                                <%# Eval("PresentacionHacienda") %>
                            </div>

                            <span class="hacienda-type">
                                <i class="bi bi-tag"></i> <%# Eval("TipoProduccion") %>
                            </span>

                            <!-- PIE -->
                            <div class="card-footer">
                                <asp:Button ID="btnVerHacienda" runat="server" 
                                    Text="Ver Hacienda"
                                    CssClass="btn-ver"
                                    CommandName="VerHacienda" 
                                    CommandArgument='<%# Eval("Id") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- ====== MENSAJE CUANDO NO HAY HACIENDAS ====== -->
        <asp:Label ID="lblSinHaciendas" runat="server"
            CssClass="alert-custom alert-info-custom d-block"
            Visible="false">
            <i class="bi bi-building"></i> No tienes haciendas registradas actualmente.
        </asp:Label>
    </div>

</asp:Content>