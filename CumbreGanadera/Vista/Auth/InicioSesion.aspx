<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Auth/ControlDatos.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="CumbreGanadera.Vista.Auth.InicioSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="login-card">

        <!-- TITULO -->
        <h2 class="mb-2 fw-bold">Bienvenido</h2>
        <p class="mb-4 small">
            Ingrese sus credenciales para acceder al sistema
        </p>

        <!-- CORREO -->
        <label class="form-label small">Correo electrónico</label>
        <div class="input-icon mb-3">
            <i class="bi bi-envelope"></i>
            <asp:TextBox ID="txtCorreo" runat="server"
                CssClass="form-control"
                placeholder="usuario@gmail.com"></asp:TextBox>
        </div>

        <!-- CONTRASEÑA -->
        <div class="d-flex justify-content-between">
            <label class="form-label small">Contraseña</label>
            <a href="RecuperarContraseña.aspx" class="text-link small">¿Olvidó su contraseña?
            </a>
        </div>

        <div class="input-icon mb-3">
            <i class="bi bi-lock"></i>
            <asp:TextBox ID="txtPassword" runat="server"
                TextMode="Password"
                CssClass="form-control"
                placeholder="********"></asp:TextBox>
        </div>

        <!-- CHECK -->
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
                Mantener sesión iniciada
            </label>
        </div>

        <!-- BOTON -->
        <asp:Button ID="btnLogin" runat="server"
            Text="Iniciar sesión"
            CssClass="mt-3 btn btn-main w-100" />

        <!-- FOOTER -->
        <div class="text-center mt-3 small">
            ¿No tienes cuenta?
            <a href="#" class="text-link">Regístrate</a>
        </div>

    </div>

</asp:Content>
