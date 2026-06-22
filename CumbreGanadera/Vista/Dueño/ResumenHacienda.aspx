<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ResumenHacienda.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.ResumenHacienda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Titulo">
        <h3>Resumen de Hacienda</h3>
        <h3 id="NombreHacienda" runat="server"></h3>

    </div>
    <div class="row Margen">
        <div class="col">
            <div class="FormatoRecuadro">
                <h1 class="TextoRecuadros">Cantidad de gerentes</h1>
                <h2 id="CantidadGerentes" class="Indicador" runat="server"></h2>
            </div>
        </div>

        <div class="col">
            <div class="FormatoRecuadro">
                <h1 class="TextoRecuadros">Cantidad de Trabajadores</h1>
                <h2 id="CantidadTrabajdores" class="Indicador" runat="server"></h2>
            </div>
        </div>

        <div class="col">
            <div class="FormatoRecuadro">
                <h1 class="TextoRecuadros">Areas Pertenecientes</h1>
                <h2 id="CantidadAreas" class="Indicador" runat="server"></h2>

            </div>
        </div>
    </div>

    <div class="Titulo">
        <h3>Gerentes</h3>
    </div>

    <div>
        <asp:Button ID="btnRegistrarGerente" runat="server" CssClass="btn btn-success" Text="Registrar Gerente" OnClick="btnRegistrarGerente_Click" />
    </div>


    <div class="data-grid" style="width:100%">
        <asp:GridView ID="gdGerentes" runat="server" AutoGenerateColumns="false">

            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="20%" ItemStyle-Height="50px" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="20%" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" ItemStyle-Width="15%" />
                <asp:BoundField DataField="AreaAsignada" HeaderText="Area a cargo" ItemStyle-Width="20%" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" ItemStyle-Width="10%" />

                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-danger" ID="btnEliminar" runat="server" Text="Eliminar" CommandArgument='<%# Eval("Id") %>' OnCommand="btnEliminar_Command" />
                            </div>
                            <div class="col">
                                <asp:Button CssClass="btn btn-warning" ID="bntEditar" runat="server" Text="Editar" CommandArgument='<%# Eval("Id") %>' OnCommand="bntEditar_Command" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
    </div>




</asp:Content>
