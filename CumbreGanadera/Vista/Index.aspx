<<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CumbreGanadera.Vista.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Space+Grotesk:wght@500;600;700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "primary-container": "#10b981",
                        "outline": "#86948a",
                        "primary-fixed": "#6ffbbe",
                        "on-surface": "#cce9d9",
                        "secondary-fixed": "#68fcbf",
                        "inverse-primary": "#006c49",
                        "primary": "#4edea3",
                        "primary-fixed-dim": "#4edea3",
                        "tertiary-fixed-dim": "#8fdb00",
                        "error-container": "#93000a",
                        "tertiary-fixed": "#a8f928",
                        "surface-container-lowest": "#00120a",
                        "secondary-fixed-dim": "#45dfa4",
                        "on-tertiary-fixed-variant": "#314f00",
                        "background": "#00170e",
                        "on-primary-fixed": "#002113",
                        "on-tertiary": "#203600",
                        "error": "#ffb4ab",
                        "surface-container-highest": "#213a2e",
                        "on-secondary": "#003825",
                        "inverse-surface": "#cce9d9",
                        "surface-bright": "#253e33",
                        "on-secondary-fixed": "#002114",
                        "surface": "#00170e",
                        "on-surface-variant": "#bbcabf",
                        "tertiary": "#8fdb00",
                        "surface-variant": "#213a2e",
                        "on-tertiary-fixed": "#112000",
                        "on-error-container": "#ffdad6",
                        "on-background": "#cce9d9",
                        "on-secondary-fixed-variant": "#005137",
                        "surface-container-low": "#062016",
                        "tertiary-container": "#75b400",
                        "inverse-on-surface": "#1c352a",
                        "on-primary-fixed-variant": "#005236",
                        "surface-tint": "#4edea3",
                        "secondary-container": "#00bd85",
                        "on-primary-container": "#00422b",
                        "on-tertiary-container": "#274000",
                        "surface-dim": "#00170e",
                        "surface-container-high": "#162f24",
                        "secondary": "#45dfa4",
                        "on-primary": "#003824",
                        "surface-container": "#0a241a",
                        "outline-variant": "#3c4a42",
                        "on-secondary-container": "#00452e",
                        "on-error": "#690005"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "spacing": {
                        "margin": "32px",
                        "unit": "4px",
                        "stack-lg": "32px",
                        "container-max": "1440px",
                        "gutter": "24px",
                        "stack-sm": "8px",
                        "stack-md": "16px"
                    },
                    "fontFamily": {
                        "headline-xl": ["Space Grotesk"],
                        "headline-md": ["Space Grotesk"],
                        "body-md": ["Inter"],
                        "label-sm": ["Space Grotesk"],
                        "body-sm": ["Inter"],
                        "body-lg": ["Inter"],
                        "label-md": ["Space Grotesk"],
                        "headline-lg": ["Space Grotesk"]
                    },
                    "fontSize": {
                        "headline-xl": ["40px", { "lineHeight": "48px", "letterSpacing": "-0.02em", "fontWeight": "700" }],
                        "headline-md": ["24px", { "lineHeight": "32px", "fontWeight": "600" }],
                        "body-md": ["16px", { "lineHeight": "24px", "fontWeight": "400" }],
                        "label-sm": ["12px", { "lineHeight": "14px", "letterSpacing": "0.03em", "fontWeight": "500" }],
                        "body-sm": ["14px", { "lineHeight": "20px", "fontWeight": "400" }],
                        "body-lg": ["18px", { "lineHeight": "28px", "fontWeight": "400" }],
                        "label-md": ["14px", { "lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600" }],
                        "headline-lg": ["32px", { "lineHeight": "40px", "letterSpacing": "-0.01em", "fontWeight": "600" }]
                    }
                },
            },
        }
    </script>
    <style>
        body {
            background-color: #00170e;
            color: #cce9d9;
        }

        .glass-panel {
            background: rgba(16, 185, 129, 0.05);
            border: 1px solid rgba(78, 222, 163, 0.1);
        }

            .glass-panel:hover {
                border-color: rgba(78, 222, 163, 0.3);
                background: rgba(16, 185, 129, 0.1);
            }

        #hero-carousel-container {
            display: flex;
            transition: transform 1.5s cubic-bezier(0.645, 0.045, 0.355, 1);
            height: 100%;
        }

        .carousel-item {
            min-width: 100%;
            height: 100%;
        }
    </style>
</head>
<body class="font-body-md text-body-md overflow-x-hidden">
    <!-- TopAppBar -->
    <header class="sticky top-0 w-full z-50 bg-background/90 backdrop-blur-xl border-b border-primary/10">
        <div class="max-w-container-max mx-auto px-margin py-4 flex justify-between items-center">
            <div class="flex items-center gap-stack-sm">
                <span class="material-symbols-outlined text-primary text-[32px]">agriculture</span>
                <span class="font-headline-md text-headline-md font-bold text-primary tracking-tight">Cumbre Ganadera</span>
            </div>

            <div class="flex items-center gap-stack-md">
                <button class="font-label-md text-label-md text-on-surface hover:text-primary transition-all">Login</button>
                <button class="bg-primary-container text-on-primary-container px-6 py-2 rounded-lg font-label-md text-label-md hover:bg-primary transition-all">
                    Registrarse
                </button>
            </div>
        </div>
    </header>
    <main class="min-h-screen">
        <!-- Hero Section with Auto Sliding Carousel -->
        <section class="relative w-full h-[85vh] flex flex-col items-center justify-center text-center overflow-hidden">
            <!-- Sliding Carousel Container -->
            <div class="absolute inset-0 z-0 overflow-hidden">
                <div id="hero-carousel-container">
                    <!-- Unique Hacienda Slide 1 -->
                    <div class="carousel-item">
                        <div class="w-full h-full bg-cover bg-center" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDdxRy5VJN1K_vt7kKJtsWQxSqv4kF0MhLU0pZwjnpGTj7xH6s96BEHpgC0uq9hnulBWkulTb4S8aRSb7GmGy6fM23GNoWI_M_FkjWt4hoxC5rGtDGgznb_IHb5nvaoggFKbNcwMEdIO0stjJUVIzMvCq54BRIqfffSBvf-08t0oP6RDlNEUwbJj_OFz-z_LdPVSI_6fALerA4jNltOD5Np7ZZSjOAXhvYX6d7SnALeKAwFwO74N_VPAgsgQnFMTIKiodfqESFFVA');"></div>
                    </div>
                    <!-- Unique Hacienda Slide 2 -->
                    <div class="carousel-item">
                        <div class="w-full h-full bg-cover bg-center" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuCFhz7zfenR1o4HMTH3_DW7h6LNOjOUXZyabfxmvogsXY1nstAzZpXaPHp8Y9x1u3k4-xfDhzT7-hPHOz_waQsrOF2vrVoETRKWgKbRpM5yMuaJpEq8e_2wqP9Y6T4Cg61ls8UFor0QQBjeClSvdWpGD_u8rBnb75iefwfL0uPw7OC9wjJHN0W_hq3CJCnRrHz6O7nsnm61lH732wcRVBrF27VURbKr0LcUzxyqXaGB79nR4-f2nY3YshLXd4nPTfw-69C-Y87imA');"></div>
                    </div>
                    <!-- Unique Hacienda Slide 3 -->
                    <div class="carousel-item">
                        <div class="w-full h-full bg-cover bg-center" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBVl6bUJoqzSHfcGNFZ95dThm-vasZ2Nvtfx9u6Gx9pGEfbCrqNANDTtaR5UfLReVQdzqQLbikeordlzazM5HaqDAJafhShdo4e6sgKeNGZhIfwIa6iAbpcxuOR29KjL1qzwkE_ftjHin1oGEwp911fYAUiAxFcwD-lgzeUn3srrIXlV0C7xTKhMmDn1wwVGhraZ1dagMd1MjW8xfjPLOt5-1iDWUR_f3apz4acOACf-Q2oWTCd1Fh8SgQhEQfqFQFRiZi0RKWR1Q');"></div>
                    </div>
                </div>
            </div>
            <div class="relative z-20 max-w-4xl w-full space-y-stack-lg px-margin">
                <h1 class="font-headline-xl text-headline-xl text-white uppercase tracking-[0.2em] drop-shadow-[0_4px_12px_rgba(0,0,0,0.8)]">Bienvenido a Cubre Ganadera!
                </h1>
                <p class="font-body-lg text-body-lg text-white max-w-2xl mx-auto drop-shadow-[0_2px_8px_rgba(0,0,0,0.8)] font-medium">
                    Conectando la tradición del campo con la tecnología del futuro.
                </p>
            </div>
            <script>
                let currentSlideIndex = 0;
                const slides = document.querySelectorAll('.carousel-item');
                const totalSlides = slides.length;
                const container = document.getElementById('hero-carousel-container');

                function updateCarousel() {
                    container.style.transform = `translateX(-${currentSlideIndex * 100}%)`;
                }

                function nextSlide() {
                    currentSlideIndex = (currentSlideIndex + 1) % totalSlides;
                    updateCarousel();
                }

                // Auto-rotation every 5 seconds
                setInterval(nextSlide, 5000);
            </script>
        </section>
        <!-- Catalog Section: Haciendas Disponibles -->
        <section class="max-w-container-max mx-auto px-margin py-20">
            <div class="flex flex-col md:flex-row justify-between items-end mb-stack-lg gap-stack-md pb-stack-md">
                <div>
                    <h2 class="font-headline-lg text-headline-lg text-on-surface">Haciendas Disponibles</h2>
                    <p class="font-body-sm text-body-sm text-outline">Synchronizing real-time telemetry from 144 global nodes.</p>
                </div>
                <div class="flex gap-stack-sm">
                    <button class="px-4 py-2 glass-panel rounded-full text-primary font-label-sm text-label-sm cursor-pointer hover:bg-primary/20 transition-colors">All Regions</button>
                    <button class="px-4 py-2 glass-panel rounded-full text-on-surface-variant font-label-sm text-label-sm cursor-pointer hover:bg-primary/20 transition-colors">Active Yield</button>
                </div>
            </div>
            <!-- Product-Style Catalog Grid (Maintained 6 Items) -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-gutter">
                <!-- Farm Card 1 -->
                <div class="glass-panel rounded-xl overflow-hidden group transition-all duration-500 hover:-translate-y-2 flex flex-col">
                    <div class="h-64 w-full relative overflow-hidden">
                        <img alt="High-quality realistic aerial view of hacienda" class="w-full h-full object-cover transition-all duration-700 scale-100 group-hover:scale-110" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCFhz7zfenR1o4HMTH3_DW7h6LNOjOUXZyabfxmvogsXY1nstAzZpXaPHp8Y9x1u3k4-xfDhzT7-hPHOz_waQsrOF2vrVoETRKWgKbRpM5yMuaJpEq8e_2wqP9Y6T4Cg61ls8UFor0QQBjeClSvdWpGD_u8rBnb75iefwfL0uPw7OC9wjJHN0W_hq3CJCnRrHz6O7nsnm61lH732wcRVBrF27VURbKr0LcUzxyqXaGB79nR4-f2nY3YshLXd4nPTfw-69C-Y87imA" />
                        <div class="absolute top-4 right-4 bg-primary/90 backdrop-blur-md text-on-primary font-label-sm px-3 py-1 rounded-full text-xs uppercase tracking-wider">VITALITY: 98%</div>
                    </div>
                    <div class="p-stack-md flex flex-col flex-grow space-y-stack-md bg-surface-container-low/40">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="font-headline-md text-headline-md text-primary">Hacienda El Dorado</h3>
                                <p class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Mato Grosso Cluster</p>
                            </div>
                            <span class="material-symbols-outlined text-primary-fixed" data-weight="fill">verified</span>
                        </div>
                        <div class="grid grid-cols-3 gap-2">
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-primary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Área</p>
                                <p class="font-bold text-on-surface">14.2k ha</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-tertiary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Ganadería</p>
                                <p class="font-bold text-on-surface">8,450</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-secondary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Vitality</p>
                                <p class="font-bold text-on-surface">98%</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between pt-stack-sm border-t border-outline-variant/10 mt-auto">
                            <span class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                Telemetry: <span class="text-primary">ON</span>
                            </span>
                            <button class="text-primary font-label-md text-label-md flex items-center gap-1 hover:gap-2 transition-all">
                                OPEN MODULE <span class="material-symbols-outlined text-sm">arrow_forward_ios</span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Farm Card 2 -->
                <div class="glass-panel rounded-xl overflow-hidden group transition-all duration-500 hover:-translate-y-2 flex flex-col">
                    <div class="h-64 w-full relative overflow-hidden">
                        <img alt="Real agriculture setting landscape" class="w-full h-full object-cover transition-all duration-700 scale-100 group-hover:scale-110" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBVl6bUJoqzSHfcGNFZ95dThm-vasZ2Nvtfx9u6Gx9pGEfbCrqNANDTtaR5UfLReVQdzqQLbikeordlzazM5HaqDAJafhShdo4e6sgKeNGZhIfwIa6iAbpcxuOR29KjL1qzwkE_ftjHin1oGEwp911fYAUiAxFcwD-lgzeUn3srrIXlV0C7xTKhMmDn1wwVGhraZ1dagMd1MjW8xfjPLOt5-1iDWUR_f3apz4acOACf-Q2oWTCd1Fh8SgQhEQfqFQFRiZi0RKWR1Q" />
                        <div class="absolute top-4 right-4 bg-secondary-container/90 backdrop-blur-md text-on-secondary-container font-label-sm px-3 py-1 rounded-full text-xs uppercase tracking-wider">VITALITY: 92%</div>
                    </div>
                    <div class="p-stack-md flex flex-col flex-grow space-y-stack-md bg-surface-container-low/40">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="font-headline-md text-headline-md text-primary">Santa Maria Node</h3>
                                <p class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Pampas Region</p>
                            </div>
                            <span class="material-symbols-outlined text-primary-fixed">monitoring</span>
                        </div>
                        <div class="grid grid-cols-3 gap-2">
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-primary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Área</p>
                                <p class="font-bold text-on-surface">6.8k ha</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-tertiary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Ganadería</p>
                                <p class="font-bold text-on-surface">3,200</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-secondary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Vitality</p>
                                <p class="font-bold text-on-surface">92%</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between pt-stack-sm border-t border-outline-variant/10 mt-auto">
                            <span class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                Telemetry: <span class="text-primary">ON</span>
                            </span>
                            <button class="text-primary font-label-md text-label-md flex items-center gap-1 hover:gap-2 transition-all">
                                OPEN MODULE <span class="material-symbols-outlined text-sm">arrow_forward_ios</span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Farm Card 3 -->
                <div class="glass-panel rounded-xl overflow-hidden group transition-all duration-500 hover:-translate-y-2 flex flex-col">
                    <div class="h-64 w-full relative overflow-hidden">
                        <img alt="Lush farmland and livestock setting" class="w-full h-full object-cover transition-all duration-700 scale-100 group-hover:scale-110" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDdxRy5VJN1K_vt7kKJtsWQxSqv4kF0MhLU0pZwjnpGTj7xH6s96BEHpgC0uq9hnulBWkulTb4S8aRSb7GmGy6fM23GNoWI_M_FkjWt4hoxC5rGtDGgznb_IHb5nvaoggFKbNcwMEdIO0stjJUVIzMvCq54BRIqfffSBvf-08t0oP6RDlNEUwbJj_OFz-z_LdPVSI_6fALerA4jNltOD5Np7ZZSjOAXhvYX6d7SnALeKAwFwO74N_VPAgsgQnFMTIKiodfqESFFVA" />
                        <div class="absolute top-4 right-4 bg-primary/90 backdrop-blur-md text-on-primary font-label-sm px-3 py-1 rounded-full text-xs uppercase tracking-wider">VITALITY: 89%</div>
                    </div>
                    <div class="p-stack-md flex flex-col flex-grow space-y-stack-md bg-surface-container-low/40">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="font-headline-md text-headline-md text-primary">Verde Valley Oasis</h3>
                                <p class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Northern Basin</p>
                            </div>
                            <span class="material-symbols-outlined text-primary-fixed">eco</span>
                        </div>
                        <div class="grid grid-cols-3 gap-2">
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-primary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Área</p>
                                <p class="font-bold text-on-surface">22.5k ha</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-tertiary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Ganadería</p>
                                <p class="font-bold text-on-surface">12,100</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-secondary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Vitality</p>
                                <p class="font-bold text-on-surface">89%</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between pt-stack-sm border-t border-outline-variant/10 mt-auto">
                            <span class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                Telemetry: <span class="text-primary">ON</span>
                            </span>
                            <button class="text-primary font-label-md text-label-md flex items-center gap-1 hover:gap-2 transition-all">
                                OPEN MODULE <span class="material-symbols-outlined text-sm">arrow_forward_ios</span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Farm Card 4 -->
                <div class="glass-panel rounded-xl overflow-hidden group transition-all duration-500 hover:-translate-y-2 flex flex-col">
                    <div class="h-64 w-full relative overflow-hidden">
                        <img alt="Aerial view of extensive crop fields" class="w-full h-full object-cover transition-all duration-700 scale-100 group-hover:scale-110" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCFhz7zfenR1o4HMTH3_DW7h6LNOjOUXZyabfxmvogsXY1nstAzZpXaPHp8Y9x1u3k4-xfDhzT7-hPHOz_waQsrOF2vrVoETRKWgKbRpM5yMuaJpEq8e_2wqP9Y6T4Cg61ls8UFor0QQBjeClSvdWpGD_u8rBnb75iefwfL0uPw7OC9wjJHN0W_hq3CJCnRrHz6O7nsnm61lH732wcRVBrF27VURbKr0LcUzxyqXaGB79nR4-f2nY3YshLXd4nPTfw-69C-Y87imA" />
                        <div class="absolute top-4 right-4 bg-primary/90 backdrop-blur-md text-on-primary font-label-sm px-3 py-1 rounded-full text-xs uppercase tracking-wider">VITALITY: 95%</div>
                    </div>
                    <div class="p-stack-md flex flex-col flex-grow space-y-stack-md bg-surface-container-low/40">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="font-headline-md text-headline-md text-primary">Aurora Heights</h3>
                                <p class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Andean Highlands</p>
                            </div>
                            <span class="material-symbols-outlined text-primary-fixed">landscape</span>
                        </div>
                        <div class="grid grid-cols-3 gap-2">
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-primary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Área</p>
                                <p class="font-bold text-on-surface">8.4k ha</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-tertiary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Ganadería</p>
                                <p class="font-bold text-on-surface">5,120</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-secondary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Vitality</p>
                                <p class="font-bold text-on-surface">95%</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between pt-stack-sm border-t border-outline-variant/10 mt-auto">
                            <span class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                Telemetry: <span class="text-primary">ON</span>
                            </span>
                            <button class="text-primary font-label-md text-label-md flex items-center gap-1 hover:gap-2 transition-all">
                                OPEN MODULE <span class="material-symbols-outlined text-sm">arrow_forward_ios</span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Farm Card 5 -->
                <div class="glass-panel rounded-xl overflow-hidden group transition-all duration-500 hover:-translate-y-2 flex flex-col">
                    <div class="h-64 w-full relative overflow-hidden">
                        <img alt="Modern farm buildings and silos" class="w-full h-full object-cover transition-all duration-700 scale-100 group-hover:scale-110" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBVl6bUJoqzSHfcGNFZ95dThm-vasZ2Nvtfx9u6Gx9pGEfbCrqNANDTtaR5UfLReVQdzqQLbikeordlzazM5HaqDAJafhShdo4e6sgKeNGZhIfwIa6iAbpcxuOR29KjL1qzwkE_ftjHin1oGEwp911fYAUiAxFcwD-lgzeUn3srrIXlV0C7xTKhMmDn1wwVGhraZ1dagMd1MjW8xfjPLOt5-1iDWUR_f3apz4acOACf-Q2oWTCd1Fh8SgQhEQfqFQFRiZi0RKWR1Q" />
                        <div class="absolute top-4 right-4 bg-secondary-container/90 backdrop-blur-md text-on-secondary-container font-label-sm px-3 py-1 rounded-full text-xs uppercase tracking-wider">VITALITY: 91%</div>
                    </div>
                    <div class="p-stack-md flex flex-col flex-grow space-y-stack-md bg-surface-container-low/40">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="font-headline-md text-headline-md text-primary">BioSync Node</h3>
                                <p class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Cerrado Corridor</p>
                            </div>
                            <span class="material-symbols-outlined text-primary-fixed">precision_manufacturing</span>
                        </div>
                        <div class="grid grid-cols-3 gap-2">
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-primary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Área</p>
                                <p class="font-bold text-on-surface">12.1k ha</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-tertiary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Ganadería</p>
                                <p class="font-bold text-on-surface">N/A</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-secondary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Vitality</p>
                                <p class="font-bold text-on-surface">91%</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between pt-stack-sm border-t border-outline-variant/10 mt-auto">
                            <span class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                Telemetry: <span class="text-primary">ON</span>
                            </span>
                            <button class="text-primary font-label-md text-label-md flex items-center gap-1 hover:gap-2 transition-all">
                                OPEN MODULE <span class="material-symbols-outlined text-sm">arrow_forward_ios</span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Farm Card 6 -->
                <div class="glass-panel rounded-xl overflow-hidden group transition-all duration-500 hover:-translate-y-2 flex flex-col">
                    <div class="h-64 w-full relative overflow-hidden">
                        <img alt="River winding through lush hacienda lands" class="w-full h-full object-cover transition-all duration-700 scale-100 group-hover:scale-110" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDdxRy5VJN1K_vt7kKJtsWQxSqv4kF0MhLU0pZwjnpGTj7xH6s96BEHpgC0uq9hnulBWkulTb4S8aRSb7GmGy6fM23GNoWI_M_FkjWt4hoxC5rGtDGgznb_IHb5nvaoggFKbNcwMEdIO0stjJUVIzMvCq54BRIqfffSBvf-08t0oP6RDlNEUwbJj_OFz-z_LdPVSI_6fALerA4jNltOD5Np7ZZSjOAXhvYX6d7SnALeKAwFwO74N_VPAgsgQnFMTIKiodfqESFFVA" />
                        <div class="absolute top-4 right-4 bg-primary/90 backdrop-blur-md text-on-primary font-label-sm px-3 py-1 rounded-full text-xs uppercase tracking-wider">VITALITY: 87%</div>
                    </div>
                    <div class="p-stack-md flex flex-col flex-grow space-y-stack-md bg-surface-container-low/40">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="font-headline-md text-headline-md text-primary">Riverbank Delta</h3>
                                <p class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Guayas Basin</p>
                            </div>
                            <span class="material-symbols-outlined text-primary-fixed">water_drop</span>
                        </div>
                        <div class="grid grid-cols-3 gap-2">
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-primary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Área</p>
                                <p class="font-bold text-on-surface">18.9k ha</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-tertiary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Ganadería</p>
                                <p class="font-bold text-on-surface">15,400</p>
                            </div>
                            <div class="glass-panel p-2 rounded-lg border-l-2 border-secondary bg-surface/20">
                                <p class="text-[10px] uppercase text-outline-variant leading-tight">Vitality</p>
                                <p class="font-bold text-on-surface">87%</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between pt-stack-sm border-t border-outline-variant/10 mt-auto">
                            <span class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                Telemetry: <span class="text-primary">ON</span>
                            </span>
                            <button class="text-primary font-label-md text-label-md flex items-center gap-1 hover:gap-2 transition-all">
                                OPEN MODULE <span class="material-symbols-outlined text-sm">arrow_forward_ios</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Stats Section -->
        <section class="w-full bg-surface-container-low/30 py-20 backdrop-blur-sm">
            <div class="max-w-container-max mx-auto px-margin grid grid-cols-2 lg:grid-cols-4 gap-gutter text-center">
                <div class="space-y-stack-sm">
                    <p class="font-label-sm text-label-sm text-outline uppercase tracking-widest">Global Hectares</p>
                    <p class="font-headline-xl text-headline-xl text-primary-fixed">1.2M+</p>
                </div>
                <div class="space-y-stack-sm">
                    <p class="font-label-sm text-label-sm text-outline uppercase tracking-widest">Total Livestock</p>
                    <p class="font-headline-xl text-headline-xl text-primary-fixed">450K</p>
                </div>
                <div class="space-y-stack-sm">
                    <p class="font-label-sm text-label-sm text-outline uppercase tracking-widest">Active Satellites</p>
                    <p class="font-headline-xl text-headline-xl text-primary-fixed">24/7</p>
                </div>
                <div class="space-y-stack-sm">
                    <p class="font-label-sm text-label-sm text-outline uppercase tracking-widest">Nodes Connected</p>
                    <p class="font-headline-xl text-headline-xl text-primary-fixed">892</p>
                </div>
            </div>
        </section>
    </main>
    <!-- Footer -->
    <footer class="w-full bg-surface-container-lowest py-12">
        <div class="max-w-container-max mx-auto px-margin">
            <div class="flex flex-col md:flex-row justify-between items-center gap-gutter">
                <div class="flex flex-col gap-stack-sm items-center md:items-start text-center md:text-left">
                    <div class="flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary text-3xl">agriculture</span>
                        <span class="font-headline-md text-headline-md text-primary">AgriControl</span>
                    </div>
                    <p class="font-body-sm text-body-sm text-on-surface-variant max-w-xs">
                        Leading the digital transformation of global haciendas with precision telemetry and biological insights.
                    </p>
                </div>
                <nav class="flex flex-wrap justify-center gap-gutter">
                    <a class="font-label-sm text-label-sm text-primary hover:text-primary-fixed transition-colors" href="#">Haciendas</a>
                    <a class="font-label-sm text-label-sm text-on-surface-variant hover:text-primary transition-colors" href="#">Telemetry</a>
                    <a class="font-label-sm text-label-sm text-on-surface-variant hover:text-primary transition-colors" href="#">Sustainability</a>
                    <a class="font-label-sm text-label-sm text-on-surface-variant hover:text-primary transition-colors" href="#">Privacy Protocol</a>
                </nav>
                <div class="flex gap-stack-md">
                    <span class="material-symbols-outlined text-outline-variant hover:text-primary cursor-pointer transition-all">hub</span>
                    <span class="material-symbols-outlined text-outline-variant hover:text-primary cursor-pointer transition-all">public</span>
                    <span class="material-symbols-outlined text-outline-variant hover:text-primary cursor-pointer transition-all">lan</span>
                </div>
            </div>
            <div class="mt-12 pt-8 border-t border-outline-variant/10 text-center">
                <p class="font-body-sm text-body-sm text-outline opacity-60">© 2024 AgriControl Systems. Digital Growth Optimized. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>
