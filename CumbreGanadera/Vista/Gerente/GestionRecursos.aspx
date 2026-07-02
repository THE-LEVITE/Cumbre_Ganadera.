<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="GestionRecursos.aspx.cs" Inherits="CumbreGanadera.Vista.Trabajador.GestionRecursos" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .card-recurso {
            border: none;
            border-radius: 15px;
            box-shadow: 0px 3px 10px rgba(0,0,0,.08);
            transition: .3s;
        }

            .card-recurso:hover {
                transform: translateY(-3px);
            }

        .titulo-dashboard {
            font-size: 35px;
            font-weight: 700;
        }

        .subtitulo-dashboard {
            color: gray;
        }

        .table td,
        .table th {
            vertical-align: middle;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-4">

        <!-- ENCABEZADO -->

        <div class="d-flex justify-content-between align-items-center mb-4">

            <div>

                <h2 class="titulo-dashboard">Gestión de Recursos
                </h2>

                <p class="subtitulo-dashboard">
                    Control de insumos, maquinaria y herramientas.
           
                </p>

            </div>
            <asp:Button
                ID="btnNuevo"
                runat="server"
                Text="+ Nuevo Registro"
                CssClass="btn btn-success btn-lg"
                OnClick="btnNuevo_Click" />

        </div>

        <!-- TARJETAS -->

        <div class="row mb-4">

            <div class="col-md-4">

                <div class="card card-recurso">

                    <div class="card-body text-center">

                        <h6>INSUMOS</h6>

                        <h2>

                            <asp:Label
                                ID="lblTotalInsumos"
                                runat="server"
                                Text="0"></asp:Label>

                        </h2>

                        <small>Total registrados</small>

                    </div>

                </div>

            </div>

            <div class="col-md-4">

                <div class="card card-recurso">

                    <div class="card-body text-center">

                        <h6>HERRAMIENTAS</h6>

                        <h2>

                            <asp:Label
                                ID="lblTotalHerramientas"
                                runat="server"
                                Text="0"></asp:Label>

                        </h2>

                        <small>Total registrados</small>

                    </div>

                </div>

            </div>

            <div class="col-md-4">

                <div class="card card-recurso">

                    <div class="card-body text-center">

                        <h6>MAQUINARIA</h6>

                        <h2>

                            <asp:Label
                                ID="lblTotalMaquinaria"
                                runat="server"
                                Text="0"></asp:Label>

                        </h2>

                        <small>Total registrados</small>

                    </div>

                </div>

            </div>

        </div>

        <!-- CONTENIDO -->

        <div class="row">

            <!-- TABLA -->

            <div class="col-lg-9">

                <div class="card card-recurso">

                    <div class="card-header bg-white">

                        <div class="d-flex justify-content-between align-items-center">

                            <h5 class="fw-bold mb-0">Recursos Registrados
                            </h5>

                            <asp:TextBox
                                ID="txtBuscar"
                                runat="server"
                                CssClass="form-control"
                                Width="300px"
                                AutoPostBack="true"
                                OnTextChanged="txtBuscar_TextChanged"
                                placeholder="Buscar recurso...">
                        </asp:TextBox>

                        </div>

                    </div>

                    <div class="card-body">

                        <asp:GridView
                            ID="gvRecursos"
                            runat="server"
                            CssClass="table table-hover"
                            AutoGenerateColumns="False"
                            GridLines="None">

                            <Columns>
                                <asp:BoundField DataField="Id" Visible="false" />

                                <asp:BoundField DataField="TipoRecurso" Visible="false" />

                                <asp:BoundField
                                    HeaderText="Nombre"
                                    DataField="Nombre" />

                                <asp:BoundField
                                    HeaderText="Categoría"
                                    DataField="Categoria" />

                                <asp:BoundField
                                    HeaderText="Estado / Cantidad"
                                    DataField="EstadoCantidad" />

                                <asp:BoundField
                                    HeaderText="Descripción"
                                    DataField="Descripcion" />

                                <asp:TemplateField HeaderText="Acciones">

                                    <ItemTemplate>

                                        <asp:LinkButton
                                            ID="btnEditar"
                                            runat="server"
                                            CssClass="btn btn-warning btn-sm me-2"
                                            CommandArgument='<%# Eval("Id") %>'
                                            CommandName='<%# Eval("TipoRecurso") %>'
                                            OnClick="btnEditar_Click">

                         <i class="bi bi-pencil-square"></i>

                        </asp:LinkButton>

                                        <asp:LinkButton
                                            ID="btnEliminar"
                                            runat="server"
                                            CssClass="btn btn-danger btn-sm"
                                            CommandArgument='<%# Eval("Id") %>'
                                            CommandName='<%# Eval("TipoRecurso") %>'
                                            OnClick="btnEliminar_Click"
                                            OnClientClick="return confirm('¿Está seguro de eliminar este recurso?');">

                            <i class="bi bi-trash"></i>

                        </asp:LinkButton>

                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>

                    </div>

                </div>

            </div>

            <!-- PANEL DERECHO -->

            <div class="col-lg-3">

                <div class="card card-recurso mb-3">

                    <div class="card-header bg-white">

                        <h6 class="fw-bold">Inventario Crítico
                        </h6>

                    </div>

                    <div class="card-body">

                        <div class="alert alert-danger">
                            Sin novedades.

                   
                        </div>

                    </div>

                </div>

                <div class="card card-recurso">

                    <div class="card-header bg-white">

                        <h6 class="fw-bold">Estadísticas

                        </h6>

                    </div>

                    <div class="card-body">

                        <p>
                            Total Recursos                       

                            <span class="float-end">

                                <asp:Label
                                    ID="lblTotal"
                                    runat="server"
                                    Text="0"></asp:Label>

                            </span>

                        </p>

                        <hr />

                        <p>
                            Operativos                       

                            <span class="float-end">

                                <asp:Label
                                    ID="lblOperativos"
                                    runat="server"
                                    Text="0"></asp:Label>

                            </span>

                        </p>

                        <hr />

                        <p>
                            En mantenimiento                      

                            <span class="float-end">

                                <asp:Label
                                    ID="lblMantenimiento"
                                    runat="server"
                                    Text="0"></asp:Label>

                            </span>

                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- MODAL REGISTRAR RECURSO -->

    <div class="modal fade" id="modalRecurso" tabindex="-1">

        <div class="modal-dialog modal-lg">

            <div class="modal-content">

                <div class="modal-header bg-success text-white">

                    <h5 class="modal-title">Registrar Recurso
                    </h5>

                    <button
                        type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal">
                    </button>

                </div>

                <div class="modal-body">

                    <div class="row">

                        <div class="col-md-6">

                            <label class="form-label">Tipo Recurso</label>

                            <asp:DropDownList
                                ID="ddlTipoRecurso"
                                runat="server"
                                CssClass="form-select"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlTipoRecurso_SelectedIndexChanged1">

                                <asp:ListItem Value="">Seleccione...</asp:ListItem>
                                <asp:ListItem Value="1">Insumo</asp:ListItem>
                                <asp:ListItem Value="2">Herramienta</asp:ListItem>
                                <asp:ListItem Value="3">Maquinaria</asp:ListItem>

                            </asp:DropDownList>

                        </div>

                        <div class="col-md-6">

                            <label class="form-label">Nombre</label>

                            <asp:TextBox
                                ID="txtNombre"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>

                    </div>

                    <br />

                    <div class="row">

                        <div class="col-md-12">

                            <label class="form-label">Descripción</label>

                            <asp:TextBox
                                ID="txtDescripcion"
                                runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Rows="3">
                            </asp:TextBox>

                        </div>

                    </div>

                    <br />

                    <asp:Panel
                        ID="pnlCampos"
                        runat="server"
                        Visible="false">

                        <div class="row">

                            <!-- Cantidad (Solo Insumos) -->

                            <div class="col-md-6">

                                <asp:Panel
                                    ID="pnlCantidad"
                                    runat="server"
                                    Visible="false">

                                    <label class="form-label">Cantidad</label>

                                    <asp:TextBox
                                        ID="txtCantidad"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Number">
                                    </asp:TextBox>

                                </asp:Panel>

                            </div>

                            <!-- Marca (Solo Maquinaria) -->

                            <div class="col-md-6">

                                <asp:Panel
                                    ID="pnlMarca"
                                    runat="server"
                                    Visible="false">

                                    <label class="form-label">Marca</label>

                                    <asp:TextBox
                                        ID="txtMarca"
                                        runat="server"
                                        CssClass="form-control">
                                    </asp:TextBox>

                                </asp:Panel>

                            </div>

                        </div>

                        <br />

                        <div class="row">

                            <!-- Estado (Herramienta y Maquinaria) -->

                            <div class="col-md-6">

                                <asp:Panel
                                    ID="pnlEstado"
                                    runat="server"
                                    Visible="false">

                                    <label class="form-label">Estado</label>

                                    <asp:DropDownList
                                        ID="ddlEstado"
                                        runat="server"
                                        CssClass="form-select">

                                        <asp:ListItem Value="Bueno">Bueno</asp:ListItem>
                                        <asp:ListItem Value="Regular">Regular</asp:ListItem>
                                        <asp:ListItem Value="Excelente">Excelente</asp:ListItem>
                                        <asp:ListItem Value="Desgastado">Desgastado</asp:ListItem>

                                    </asp:DropDownList>

                                </asp:Panel>

                            </div>

                            <!-- Tipo -->

                            <div class="col-md-6">

                                <label class="form-label">Tipo</label>

                                <asp:DropDownList
                                    ID="ddlTipo"
                                    runat="server"
                                    CssClass="form-select">
                                </asp:DropDownList>

                            </div>

                        </div>

                    </asp:Panel>

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
                        Text="Guardar"
                        CssClass="btn btn-success"
                        OnClick="btnGuardar_Click" />

                </div>

            </div>

        </div>

    </div>

</asp:Content>
