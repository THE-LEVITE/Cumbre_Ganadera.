<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Auth/ControlDatos.Master" AutoEventWireup="true" CodeBehind="RegistroCliente.aspx.cs" Inherits="CumbreGanadera.Vista.Auth.RegistroCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="auth-center">
        <div class="CardRegistro">
            <div>
                <h2>Registro de clientes</h2>
            </div>
            <div class="registro-body">

                <%--primera fila--%>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Documento de identidad</label>
                        <asp:TextBox runat="server" ID="txtDocumento" CssClass="form-control" placeholder="Ingrese su documento" oninput="this.value = this.value.replace(/[^0-9]/g, '')"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Tipo de documento*</label>
                        <asp:DropDownList CssClass="form-control fondotxt" ForeColor="White" BackColor="#2f4029" ID="dlTipoDocumento" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </div>

            <%--segunda fila--%>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Nombre*</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control mb-3" placeholder="Primer nombre"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Apellido*</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control mb-3" placeholder="Apellidos"></asp:TextBox>
                </div>
            </div>

            <%--tercera fila--%>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Correo Electrónico*</label>
                    <div class="input-icon mb-3">
                        <i class="bi bi-envelope"></i>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="ejemplo@gmail.com"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Teléfono</label>
                    <div class="input-icon mb-3">
                        <i class="bi bi-telephone"></i>
                        <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" placeholder="+57 300 000 0000" oninput="this.value = this.value.replace(/[^0-9]/g, '')"></asp:TextBox>
                    </div>
                </div>
            </div>

            <%--cuarta fila--%>
            <div class="row">
                <div class="col-md-4">
                    <label class="form-label">Fecha de nacimiento</label>
                    <div class="input-icon mb-3">
                        <i class="bi bi-calendar"></i>
                        <asp:TextBox runat="server" ID="txtFechaNacimiento" CssClass="form-control" placeholder="DD/MM/AAAA" TextMode="Date"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Departamento*</label>
                    <div class="input-icon mb-3">
                        <asp:DropDownList CssClass="form-control fondotxt" ID="dlDepartamento" runat="server" ForeColor="White" BackColor="#2f4029" AutoPostBack="true" OnSelectedIndexChanged="dlDepartamento_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Ciudad*</label>
                    <div class="input-icon mb-3">
                        <asp:DropDownList CssClass="form-control fondotxt" ID="dlCiudad" runat="server" ForeColor="White" BackColor="#2f4029"></asp:DropDownList>
                    </div>
                </div>
            </div>

            <%--cuarta fila--%>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Contraseña</label>
                    <div class="input-icon mb-3">
                        <i class="bi bi-lock"></i>
                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Confirmar contraseña</label>
                    <div class="input-icon mb-3">
                        <i class="bi bi-shield-lock"></i>
                        <asp:TextBox runat="server" ID="txtConfirmarPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <asp:Button runat="server" Text="Crear mi cuenta" CssClass="btn btn-main w-100" OnClick="btnRegistrar_Click" />

            <div class="text-center mt-3 small">
                ¿Ya tienes una cuenta?
                        <a href="InicioSesion.aspx" class="text-link">Inicia sesión aquí</a>
            </div>

        </div>

    </div>

    </div>
</asp:Content>
