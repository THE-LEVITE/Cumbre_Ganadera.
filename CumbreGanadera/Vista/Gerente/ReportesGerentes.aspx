<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ReportesGerentes.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.ReportesGerentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Source/CSS/StyleGerente.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <h3>REPORTES OPERATIVOS</h3>
        <p class="subtitle">Gestione y visualice el historial operativo de la hacienda en tiempo real.</p>

        <div class="card">

            <h4><i class="bi bi-file-earmark-bar-graph" style="color: green"></i>CREAR NUEVO REPORTE OPERATIVO</h4>

            <div class="form-row">




                <div class="form-group col-12">
                    <label>TITULO SOLICITUD</label>
                    <asp:TextBox ID="txtTitulo" runat="server" CssClass="textarea" TextMode="MultiLine"></asp:TextBox>
                </div>


                <div class="form-group">
                    <label>DESCRIPCIÓN DE LA ACTIVIDAD / INCIDENCIAS</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="textarea" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>FECHA SOLICITUD</label>
                    <asp:TextBox ID="txtFecha" runat="server" CssClass="input" TextMode="Date"></asp:TextBox>
                </div>

            </div>

            <div class="btn-container">
                <asp:Button ID="btnRegistrar" runat="server" Text="📤 ENVIAR SOLICITUD" CssClass="btnEnviar" />
            </div>

        </div>
    </div>
</asp:Content>
