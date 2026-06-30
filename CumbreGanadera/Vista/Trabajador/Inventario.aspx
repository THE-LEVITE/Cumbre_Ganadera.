<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="CumbreGanadera.Vista.Trabajador.Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DropDownList ID="ddlTipoRecurso" runat="server"
        OnSelectedIndexChanged="ddlTipoRecurso_SelectedIndexChanged"
        CssClass="form-select custom-select"
        AutoPostBack="true">
         <asp:ListItem Text="-- Seleccione un recurso --" Value="" />
         <asp:ListItem Text="Insumo" Value="Insumo" />
         <asp:ListItem Text="Herramienta" Value="Herramienta" />
         <asp:ListItem Text="Maquinaria" Value="Maquinaria" />
    </asp:DropDownList>

    <div id="tablaInsumo" runat="server" visible="false">

        <asp:GridView ID="gvTablaInsumo" runat="server"
            AutoGenerateColumns="false"
            AllowPaging="true"
            PageSize="10"
            OnPageIndexChanging="gvTablaInsumo_PageIndexChanging"
            CssClass="table table-striped">

            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre del Insumo" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad del Insumo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion del Insumo" />
                <asp:BoundField DataField="Categoria" HeaderText="Tipo del insumo" />
            </Columns>

            <PagerStyle CssClass="pagination" />
        </asp:GridView>


    </div>




    <!-- ALERTAS -->
    <asp:Label ID="lblSinTipoRecurso" runat="server"
        CssClass="alert-custom alert-warning-custom d-block"
        Visible="false">
    <i class="bi bi-exclamation-triangle"></i> Elija un tipo de recurso para buscar en el inventario.
    </asp:Label>

    <asp:Label ID="lblSinRecurso" runat="server"
        CssClass="alert-custom alert-info-custom d-block"
        Visible="false">
    <i class="bi bi-info-circle"></i> El tipo de recurso seleccionado aún no tiene respuesta.
    </asp:Label>

</asp:Content>
