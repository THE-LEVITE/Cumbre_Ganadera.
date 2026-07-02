<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="EditarGerente.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.EditarGerente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <label class="labelTitulo mt-2">Editar gerente </label>
        <br>
        <label class="labelDescripcion">Aqui podra editar la infotmacion del gerente que seleccionó</label>
    </div>
    <div class="contenedorTextbox">
        <div class="container">

            <%--primera fila--%>
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



            <%--segudna fila--%>
            <div class="row">

                <div class="col mt-4">
                    <label class="form-label colorTexto">Seleccionar estado</label>
                    <asp:DropDownList class="form-control fondotxt" ID="dlEstado" ForeColor="White" BackColor="#2f4029" runat="server">
                        <asp:ListItem Text="Activo" Value="1" />
                        <asp:ListItem Text="Inactivo" Value="2" />
                    </asp:DropDownList>
                </div>


                <div class="col order-5 mt-4">
                    <label class="form-label colorTexto">Tipo de documento</label>
                    <asp:DropDownList class="form-control fondotxt" ID="dlTipoDocumento" ForeColor="White" BackColor="#2f4029" runat="server"></asp:DropDownList>
                </div>
            </div>
            <%--tercera fila--%>
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
    <div class="row">
        <div class="col mt-4 margenBotones boton">
            <asp:Button ID="btnEditar" CssClass="botonesCrudRegistrar btn w-100" runat="server" Text="Editar" OnClick="btnEditar_Click" />
        </div>
        <div class="col mt-4 margenBotones">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="botonesCrudCancelar btn w-100" OnClick="btnCancelar_Click" />

        </div>
    </div>



</asp:Content>
