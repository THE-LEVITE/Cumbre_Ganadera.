<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="MisHaciendas.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.MisHaciendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="contenedor-cards">
        <asp:Repeater ID="rptHacienda" runat="server" OnItemCommand="rptHacienda_ItemCommand">
            <ItemTemplate>

                <%--CARD--%>
                <div class="card-hacienda">

                    <div class="FormatoParaCard">
                        <div class="CentrarImagen">
                            <img class="FormatoImagenCard" src="../Source/Img/Haciendas/<%# Eval("FotoHacienda") %>" />
                        </div>
                        <div class="mt-4 row">
                            <div class="col">
                                <h1><%# Eval("NombreHacienda") %></h1>
                            </div>
                            <div class="MargenColumna Alinear col">
                                <h2>Ubicacion: <%# Eval("NombreCiudad") %> / <%# Eval("Departamento") %></h2>
                            </div>
                        </div>
                        <div class="mt-4 row">
                            <div class="col">
                                <h2><%# Eval("PresentacionHacienda") %></h2>
                            </div>
                        </div>
                        <div class="mt-4 row">
                            <div class="col">
                                <h2><%# Eval("TipoProduccion") %></h2>
                            </div>
                            <div class="MargenColumna Alinear col"> 
                                <asp:Button ID="btnVerHacienda" runat="server" Text= "Ver Hacienda" 
                                    CssClass="btn btn-success" CommandName="VerHacienda" CommandArgument='<%# Eval("Id") %>'/>
                            </div>
                        </div>
                    </div>
                </div>
                  

            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
