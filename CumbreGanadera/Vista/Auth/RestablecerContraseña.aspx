<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Auth/ControlDatos.Master" AutoEventWireup="true" CodeBehind="RestablecerContraseña.aspx.cs" Inherits="CumbreGanadera.Vista.Auth.RestablecerContraeña" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-card">

        <!-- TITULO -->
        <h2 class="mb-2 fw-bold">Nueva Contraseña</h2>
        <p class="mb-4 small">
            Ingrese y confirme su nueva contraseña para acceder al sistema de Cumbre Ganadera
        </p>

        <!-- NUEVA CONTRASEÑA -->
        <div class="d-flex justify-content-between">
            <label class="form-label small">Nueva Contraseña</label>
        </div>

        <div class="input-icon mb-3">
            <i class="bi bi-arrow-clockwise"></i>
            <asp:TextBox ID="txtNewPassword" runat="server"
                TextMode="Password"
                CssClass="form-control"
                placeholder="********"></asp:TextBox>
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
                placeholder="********"></asp:TextBox>
        </div>


        <!-- BOTON -->
        <asp:Button ID="btnLogin" runat="server"
            Text="Confirmar Contraseña"
            CssClass="mt-3 btn btn-main w-100" />

        <!-- FOOTER -->
        <div class="text-center mt-3 small">
            <i class="bi bi-arrow-left"></i> Volver al 
            <a href="#" class="text-link"> inicio de sesión</a>
        </div>

    </div>
</asp:Content>
