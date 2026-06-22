<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="ReportesDueño.aspx.cs" Inherits="CumbreGanadera.Vista.Dueño.ReportesDueño" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="gdReportesHacienda" runat="server" 
    AutoGenerateColumns="true" 
    AllowPaging="true" 
    PageSize="3" 
    OnPageIndexChanging="gdReportesHacienda_PageIndexChanging"
    CssClass="table table-bordered">
        </asp:GridView>


</asp:Content>
