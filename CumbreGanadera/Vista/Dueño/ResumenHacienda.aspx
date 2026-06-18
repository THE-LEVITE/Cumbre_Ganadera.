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
        <asp:Button ID="btnVerHacienda" runat="server" CssClass="btn btn-success" Text="Registrar Gerente" OnClick="btnVerHacienda_Click" />
    </div>


    <div class="data-grid">
        <asp:GridView ID="gdGerentes" runat="server" AutoGenerateColumns="false">

            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                <asp:BoundField DataField="AreaAsignada" HeaderText="Area a cargo" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
            </Columns>

        </asp:GridView>
    </div>




</asp:Content>
