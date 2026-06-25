<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Auth/ControlDatos.Master" AutoEventWireup="true" CodeBehind="RestablecerContraseña.aspx.cs" Inherits="CumbreGanadera.Vista.Auth.RestablecerContraeña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="login-card">

        <!-- TITULO -->
        <h2 class="mb-2 fw-bold">Nueva Contraseña</h2>
        <p class="mb-4 small">
            Ingrese el código de verificación y su nueva contraseña
       
        </p>

        <!-- PANEL CÓDIGO -->
        <asp:Panel ID="pnlCodigo" runat="server">

            <div class="d-flex justify-content-between">
                <label class="form-label small">Código de Verificación</label>
            </div>

            <div class="input-icon mb-3">
                <i class="bi bi-shield-lock"></i>
                <asp:TextBox ID="txtCodigo" runat="server"
                    CssClass="form-control"
                    placeholder="Ingresa el código de 6 dígitos"
                    MaxLength="6">
                </asp:TextBox>
            </div>

            <asp:Button ID="btnValidarCodigo"
                runat="server"
                Text="Validar Código"
                CssClass="btn btn-main w-100"
                OnClick="btnValidarCodigo_Click" />

        </asp:Panel>

        <!-- PANEL CONTRASEÑA -->
        <asp:Panel ID="pnlPassword" runat="server" Visible="false">

            <!-- NUEVA CONTRASEÑA -->
            <div class="d-flex justify-content-between mt-2">
                <label class="form-label small">Nueva Contraseña</label>
            </div>

            <div class="input-icon mb-3">
                <i class="bi bi-arrow-clockwise"></i>
                <asp:TextBox ID="txtNewPassword" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="********">
                </asp:TextBox>
            </div>

            <!-- CONFIRMAR CONTRASEÑA -->
            <div class="d-flex justify-content-between">
                <label class="form-label small">Confirmar Contraseña</label>
            </div>

            <div class="input-icon mb-3">
                <i class="bi bi-lock"></i>
                <asp:TextBox ID="txtConfirmarPassword" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="********">
                </asp:TextBox>
            </div>

            <!-- BOTON RESTABLECER -->
            <asp:Button ID="btnRestablecer"
                runat="server"
                Text="Restablecer Contraseña"
                CssClass="mt-3 btn btn-main w-100"
                OnClick="btnRestablecer_Click" />

        </asp:Panel>

        <!-- FOOTER -->
        <div class="text-center mt-3 small">
            <i class="bi bi-arrow-left"></i>
            Volver al
           
            <a href="InicioSesion.aspx" class="text-link">inicio de sesión</a>
        </div>

    </div>

</asp:Content>
