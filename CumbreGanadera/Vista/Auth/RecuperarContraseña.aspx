<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Auth/ControlDatos.Master" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="CumbreGanadera.Vista.Auth.RecuperarContraseña" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="login-card">

        <!-- TITULO -->
        <h2 class="mb-2 fw-bold">Recuperar Contraseña</h2>
        <p class="mb-4 small">
            Ingrese su correo electronico para enviar las instrucciones de recuperación
        </p>

        <!-- CORREO -->
        <label class="form-label small">Correo electrónico</label>
        <div class="input-icon mb-3">
            <i class="bi bi-envelope"></i>
            <asp:TextBox ID="txtCorreoRec" runat="server"
                CssClass="form-control"
                placeholder="usuario@gmail.com"></asp:TextBox>
        </div>

        <!-- BOTON -->
        <asp:Button ID="btnLogin" runat="server"
            Text="Enviar Instrucciones"
            CssClass="btn btn-main w-100" />

        <!-- FOOTER -->
        <div class="text-center mt-3 small">
            <i class="bi bi-arrow-left"></i> Volver al 
            <a href="InicioSesion.aspx" class="text-link">inicio de sesión</a>
        </div>

    </div>

</asp:Content>
