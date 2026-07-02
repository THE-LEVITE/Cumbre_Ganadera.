<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Auth/ControlDatos.Master" AutoEventWireup="true" CodeBehind="SeleccionRol.aspx.cs" Inherits="CumbreGanadera.Vista.Auth.SeleccionRol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200;300;400;500;600;700;800&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "primary-fixed": "#6bff8f",
                        "on-background": "#dce5db",
                        "outline-variant": "#3d4a3d",
                        "inverse-primary": "#006e2f",
                        "surface-dim": "#0d150f",
                        "on-tertiary": "#60130d",
                        "surface-variant": "#2e3730",
                        "on-primary": "#003915",
                        "error": "#ffb4ab",
                        "surface-container": "#19221b",
                        "primary-container": "#22c55e",
                        "surface-tint": "#4ae176",
                        "secondary": "#96d59d",
                        "secondary-fixed-dim": "#96d59d",
                        "on-error": "#690005",
                        "inverse-surface": "#dce5db",
                        "on-tertiary-fixed": "#410001",
                        "surface-container-highest": "#2e3730",
                        "on-tertiary-container": "#76231b",
                        "primary": "#4be277",
                        "inverse-on-surface": "#2a322c",
                        "on-primary-container": "#004b1e",
                        "on-secondary": "#003915",
                        "surface-container-high": "#242c25",
                        "on-surface-variant": "#bccbb9",
                        "surface": "#0d150f",
                        "tertiary-container": "#ff8b7c",
                        "surface-container-low": "#151d17",
                        "secondary-fixed": "#b2f2b7",
                        "on-primary-fixed-variant": "#005321",
                        "on-error-container": "#ffdad6",
                        "tertiary": "#ffb5ab",
                        "tertiary-fixed": "#ffdad5",
                        "surface-bright": "#333b34",
                        "error-container": "#93000a",
                        "background": "#0d150f",
                        "tertiary-fixed-dim": "#ffb4a9",
                        "primary-fixed-dim": "#4ae176",
                        "on-surface": "#dce5db",
                        "on-secondary-fixed-variant": "#145126",
                        "surface-container-lowest": "#08100a",
                        "secondary-container": "#175428",
                        "on-tertiary-fixed-variant": "#7f2a21",
                        "outline": "#869585",
                        "on-secondary-fixed": "#002109",
                        "on-secondary-container": "#89c78f",
                        "on-primary-fixed": "#002109"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                    "fontFamily": {
                        "headline": ["Manrope"],
                        "display": ["Manrope"],
                        "body": ["Manrope"],
                        "label": ["Manrope"]
                    }
                },
            }
        }
    </script>
    <style>
        body {
            font-family: 'Manrope', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .neon-glow:hover {
            box-shadow: 0 0 20px rgba(34, 197, 94, 0.2);
        }

        .glass-card {
            backdrop-filter: blur(12px);
            background: rgba(36, 44, 37, 0.4);
        }

        .logincardRol {
            margin: 20px;
            background: #0b2001b3;
            backdrop-filter: blur(12px);
            border-radius: 18px;
            padding: 30px;
            width: 100%;
            max-width: 1000px;
            color: white;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
            height: 100%;
            max-height: 250px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            transition: 0.3s;
        }

            .logincardRol:hover {
                transform: translateY(-5px);
            }
    </style>

</asp:Content>
<asp:Content class="bg-surface text-on-surface antialiased min-h-screen flex flex-col" ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LinkButton ID="btnDueño" runat="server" CssClass="logincardRol group w-full text-left cursor-pointer transition-all active:scale-[0.98] focus:outline-none focus:ring-2 focus:ring-primary/50 rounded-xl" OnClick="btnDueño_Click" Visible="false">

    <div class="group">
        <!-- Dueño Card -->
        <div class="bg-primary-container/10 flex items-center justify-center group-hover:bg-primary-container transition-colors duration-500 w-10 h-10 rounded-lg" >
            <span class="material-symbols-outlined text-primary group-hover:text-on-primary text-xl" style="font-variation-settings: 'FILL' 1;">account_balance</span>
        </div>

        <div>
            <h3 class="font-bold text-on-surface tracking-tight text-base mb-1.5">Dueño</h3>
            <p class="text-on-surface-variant leading-relaxed text-xs">
                Control total de la propiedad, gestión de finanzas, activos y toma de decisiones estratégicas.
            </p>
        </div>
    </div>

    </asp:LinkButton>



    <!-- Gerente Card -->
    <asp:LinkButton ID="btnGerente" runat="server" CssClass="logincardRol group w-full text-left cursor-pointer transition-all active:scale-[0.98] focus:outline-none focus:ring-2 focus:ring-primary/50 rounded-xl" OnClick="btnGerente_Click" Visible="false">
       
      <div class="group">
   
            <div class="bg-primary-container/10 flex items-center justify-center group-hover:bg-primary-container transition-colors duration-500 w-10 h-10 rounded-lg">
                <span class="material-symbols-outlined text-primary group-hover:text-on-primary text-xl" style="font-variation-settings: 'FILL' 1;">analytics</span>
            </div>
            <div>
                <h3 class="font-bold text-on-surface tracking-tight text-base mb-1.5">Gerente</h3>
                <p class="text-on-surface-variant leading-relaxed text-xs">
                    Análisis de datos, reportes detallados y toma de decisiones operativas basadas en KPIs.
                </p>
            </div>
        </div>
    </asp:LinkButton>
    <!-- Trabajador Card -->
    <asp:LinkButton ID="btnTrabajador" runat="server" CssClass="logincardRol group w-full text-left cursor-pointer transition-all active:scale-[0.98] focus:outline-none focus:ring-2 focus:ring-primary/50 rounded-xl" OnClick="btnTrabajador_Click" Visible="false">
        <div class=" group">
            <div class="bg-primary-container/10 flex items-center justify-center group-hover:bg-primary-container transition-colors duration-500 w-10 h-10 rounded-lg">
                <span class="material-symbols-outlined text-primary group-hover:text-on-primary text-xl" style="font-variation-settings: 'FILL' 1;">precision_manufacturing</span>
            </div>
            <div>
                <h3 class="font-bold text-on-surface tracking-tight text-base mb-1.5">Trabajador</h3>
                <p class="text-on-surface-variant leading-relaxed text-xs">
                    Registro de tareas diarias, control de ganado en campo y mantenimiento de infraestructura.
                </p>
            </div>
           
        </div>
    </asp:LinkButton>

    <!-- Cliente Card -->
    <asp:LinkButton ID="btnCliente" runat="server" CssClass="logincardRol group w-full text-left cursor-pointer transition-all active:scale-[0.98] focus:outline-none focus:ring-2 focus:ring-primary/50 rounded-xl" OnClick="btnCliente_Click" Visible="false">

        <div class=" group">
            <div class="bg-primary-container/10 flex items-center justify-center group-hover:bg-primary-container transition-colors duration-500 w-10 h-10 rounded-lg">
                <span class="material-symbols-outlined text-primary group-hover:text-on-primary text-xl" style="font-variation-settings: 'FILL' 1;">shopping_cart</span>
            </div>
            <div>
                <h3 class="font-bold text-on-surface tracking-tight text-base mb-1.5">Cliente</h3>
                <p class="text-on-surface-variant leading-relaxed text-xs">
                    Visualización de inventario disponible, trazabilidad de productos y pedidos directos.
                </p>
            </div>

        </div>
    </asp:LinkButton>



</asp:Content>
