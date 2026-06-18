<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="RegistroGerente.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.RegistroGerente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <label class="labelTitulo mt-2">Registro de gerentes </label>
        <br>
        <label class="labelDescripcion">Aqui podra registrar gerentes para la administracion de las areas que componene su hacienda</label>
    </div>
    <div class="contenedorTextbox">
        <div class="container">

            <%--primera fila--%>
            <div class="row">
                <div class="col">
                    <label class="form-label colorTexto">Documento de Identidad</label>
                    <asp:TextBox runat="server" ID="txtDocumento" CssClass="form-control fondotxt" placeholder="Ingrese su documento" oninput="this.value = this.value.replace(/[^0-9]/g, '')"></asp:TextBox>
                </div>
                <div class="col order-5">
                    <label class="form-label colorTexto">Tipo de documento</label>
                    <asp:DropDownList class="form-control fondotxt" ID="dlTipoDocumento" ForeColor="White" BackColor="#2f4029" runat="server"></asp:DropDownList>
                </div>
            </div>

            <%--segudna fila--%>
            <div class="row">
                <div class="col mt-4">
                    <label class="form-label colorTexto">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control fondotxt" placeholder="Apellidos del gerente" oninput="this.value = this.value.replace(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ ]/g, '')"></asp:TextBox>
                </div>
                <div class="col order-5 mt-4">
                    <label class="form-label colorTexto">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control fondotxt" placeholder="Nombre del gerente" oninput="this.value = this.value.replace(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ ]/g, '')"></asp:TextBox>
                </div>
            </div>

            <%--tercera fila--%>
            <div class="row">
                <div class="col mt-4">
                    <label class="form-label colorTexto">Correo Electronico</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control fondotxt" placeholder="Ingrese el correo electrónico" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col order-5 mt-4">
                    <label class="form-label colorTexto">Telefono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control fondotxt" placeholder="Número telefónico" oninput="this.value = this.value.replace(/[^0-9]/g, '')"></asp:TextBox>
                </div>
            </div>

            <%--cuarta fila--%>
            <div class="row">
                <div class="col mt-4">
                    <label class="form-label colorTexto">Departamento</label>
                    <asp:DropDownList class="form-control fondotxt" ID="dlDepartamento" ForeColor="White"
                        BackColor="#2f4029" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlDepartamento_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="col mt-4">
                    <label class="form-label colorTexto">Ciudad</label>
                    <asp:DropDownList class="form-control fondotxt" ID="dlCiudad" ForeColor="White" BackColor="#2f4029" runat="server"></asp:DropDownList>

                </div>
                <div class="col order-5 mt-4">
                    <label class="form-label colorTexto">Fecha de nacimiento</label>
                    <asp:TextBox runat="server" ID="txtFechaNacimiento" CssClass="form-control fondotxt" TextMode="Date"></asp:TextBox>
                </div>

            </div>
        </div>
    </div>

    <%--    Asignacion laboral del gerente--%>
    <label class="labelTitulo mt-4">Asignacion laboral </label>
    <div class="contenedorTextbox">
        <div class="container">
            <div class="row">
                <div class="col mt-2">
                    <label class="form-label colorTexto">Fecha de Asignación</label>
                    <asp:TextBox runat="server" ID="txtFechaAsignacion" CssClass="form-control fondotxt" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col mt-4">
                    <label class="form-label colorTexto">Area a ingresar</label>
                    <asp:DropDownList class="form-control fondotxt" ForeColor="White" BackColor="#2f4029" ID="dlArea" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>

    </div>
    <h2 class="colorTextoLabel">NOTA: En caso de que el gerente a registrar no sea cliente aun, se le asignara la contraseña "Gerente123" de lo contrario se mantendra con la misma contraseña que uso en su primer registro.
    </h2>

    <div class="row">
        <div class="col mt-4 margenBotones">
            <asp:Button ID="btnRegistrar" runat ="server" Text="Completar registro" CssClass="btn w-100 boronesCrudRegistrar" OnClick="btnRegistrar_Click" />
        </div>
        <div class="col mt-4 margenBotones">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn w-100 boronesCrudCancelar" OnClick="btnCancelar_Click" />

        </div>
    </div>
</asp:Content>
