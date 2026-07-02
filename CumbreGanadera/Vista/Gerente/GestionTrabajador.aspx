<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="GestionTrabajador.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.GestionTrabajador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .card-resumen {
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,.08);
        }

        .titulo {
            color: #556B2F;
            font-weight: bold;
        }

        .pagination-ys table {
            margin: auto;
        }

        .pagination-ys td {
            padding: 4px;
        }

        .pagination-ys a {
            padding: 7px 12px;
            border: 1px solid #556B2F;
            color: #556B2F;
            text-decoration: none;
            border-radius: 5px;
            margin: 2px;
        }

        .pagination-ys span {
            padding: 7px 12px;
            background: #556B2F;
            color: white;
            border-radius: 5px;
            margin: 2px;
        }

        .modal-header {
            background: #556B2F;
            color: white;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-4">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <div>

                <h2 class="titulo">Gestión de Trabajadores</h2>

                <p class="text-muted">
                    Visualice y administre el personal registrado en su hacienda.
           
                </p>

            </div>

            <asp:Button
                ID="btnNuevo"
                runat="server"
                Text="+ Nuevo Trabajador"
                CssClass="btn btn-success"
                OnClick="btnNuevo_Click" />

        </div>

        <div class="row mb-4">

            <div class="col-md-6">

                <div class="card card-resumen">

                    <div class="card-body">

                        <h6>Total Personal</h6>

                        <h2>

                            <asp:Label
                                ID="lblTotal"
                                runat="server"
                                Text="0" />

                        </h2>

                    </div>

                </div>

            </div>

            <div class="col-md-6">

                <div class="card card-resumen">

                    <div class="card-body">

                        <h6>Activos</h6>

                        <h2>

                            <asp:Label
                                ID="lblActivos"
                                runat="server"
                                Text="0" />

                        </h2>

                    </div>

                </div>

            </div>

        </div>

        <div class="card shadow">

            <div class="card-header">

                <div class="row">

                    <div class="col-md-6">

                        <h5 class="mt-2">Lista de Personal
                    </h5>

                    </div>

                    <div class="col-md-6 text-end">

                        <asp:TextBox
                            ID="txtBuscar"
                            runat="server"
                            CssClass="form-control d-inline"
                            Width="300px"
                            placeholder="Buscar trabajador..."
                            AutoPostBack="true"
                            OnTextChanged="txtBuscar_TextChanged" />

                    </div>

                </div>

            </div>

            <div class="card-body">

                <asp:GridView
                    ID="gvTrabajadores"
                    runat="server"
                    CssClass="table table-hover table-striped"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    AllowPaging="true"
                    PageSize="8"
                    OnPageIndexChanging="gvTrabajadores_PageIndexChanging">

                    <Columns>

                        <asp:BoundField
                            HeaderText="NOMBRE"
                            DataField="NombreCompleto" />

                        <asp:BoundField
                            HeaderText="CÉDULA"
                            DataField="Cedula" />

                        <asp:BoundField
                            HeaderText="TELÉFONO"
                            DataField="Telefono" />

                        <asp:BoundField
                            HeaderText="EMAIL"
                            DataField="Correo" />

                        <asp:BoundField
                            HeaderText="FECHA INGRESO"
                            DataField="FechaIngreso"
                            DataFormatString="{0:dd/MM/yyyy}" />

                        <asp:TemplateField HeaderText="ACCIONES">

                            <ItemTemplate>

                                <asp:LinkButton
                                    ID="btnEditar"
                                    runat="server"
                                    CssClass="btn btn-warning btn-sm"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="btnEditar_Click">

                                <i class="fa fa-pencil"></i>

                            </asp:LinkButton>

                                &nbsp;

                           

                                <asp:LinkButton
                                    ID="btnEliminar"
                                    runat="server"
                                    CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="btnEliminar_Click">

                                <i class="fa fa-trash"></i>

                            </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                    <PagerStyle
                        CssClass="pagination-ys"
                        HorizontalAlign="Center" />

                </asp:GridView>

            </div>

        </div>

    </div>

    <!-- MODAL -->

    <div class="modal fade"
        id="modalTrabajador"
        tabindex="-1"
        aria-hidden="true">

        <div class="modal-dialog modal-lg">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title">Trabajador
                </h5>

                    <button
                        type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal">
                    </button>

                </div>

                <div class="modal-body">

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label>Nombre Completo</label>

                            <asp:TextBox
                                ID="txtNombre"
                                runat="server"
                                CssClass="form-control" />

                        </div>

                        <div class="col-md-6 mb-3">

                            <label>Cédula</label>

                            <asp:TextBox
                                ID="txtCedula"
                                runat="server"
                                CssClass="form-control" />

                        </div>

                        <div class="col-md-6 mb-3">

                            <label>Teléfono</label>

                            <asp:TextBox
                                ID="txtTelefono"
                                runat="server"
                                CssClass="form-control" />

                        </div>

                        <div class="col-md-6 mb-3">

                            <label>Correo</label>

                            <asp:TextBox
                                ID="txtCorreo"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Email" />

                        </div>

                        <div class="col-md-6 mb-3">

                            <label>Contraseña</label>

                            <asp:TextBox
                                ID="txtClave"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Password" />

                        </div>

                        <div class="col-md-6 mb-3">

                            <label>Fecha de Ingreso</label>

                            <asp:TextBox
                                ID="txtFechaIngreso"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Date" />

                        </div>

                        <div class="col-md-6 mb-3">

                            <label>Estado</label>

                            <asp:DropDownList
                                ID="ddlEstado"
                                runat="server"
                                CssClass="form-select">

                                <asp:ListItem Text="Activo" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Inactivo" Value="0"></asp:ListItem>

                            </asp:DropDownList>

                        </div>

                    </div>

                </div>

                <div class="modal-footer">

                    <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">
                        Cancelar

               
                    </button>

                    <asp:Button
                        ID="btnGuardar"
                        runat="server"
                        CssClass="btn btn-success"
                        Text="Guardar"
                        OnClick="btnGuardar_Click" />

                </div>

            </div>

        </div>

    </div>

</asp:Content>
