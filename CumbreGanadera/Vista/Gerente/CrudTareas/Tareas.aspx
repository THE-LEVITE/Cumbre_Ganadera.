   <%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Estructura.Master" AutoEventWireup="true" CodeBehind="Tareas.aspx.cs" Inherits="CumbreGanadera.Vista.Gerente.CrudTareas.Tareas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content -->

    <div class="container-fluid p-4">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">
            <div>
                <h2 class="fw-bold">Gestión de Tareas </h2>
                <p class="text-muted">Administra y organiza las tareas de los trabajadores. </p>
            </div>
            <div class="d-flex gap-2">
                <asp:Button ID="btnAgregarTarea" class="btn btn-green" runat="server" Text="Agregar Tarea" OnClick="btnAgregarTarea_Click" />
            </div>
        </div>
        <!-- Table -->
        <div class="table-container">
            <div class="p-4 border-bottom d-flex justify-content-between align-items-center">
                <h4 class="m-0">Listado de Tareas </h4>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvTareas" class="table align-middle mb-0" runat="server" AutoGenerateColumns="false" OnRowCommand="gvTareas_RowCommand">
                    <columns>
                        <asp:TemplateField HeaderText="Titulo">
                            <itemtemplate>
                                <%# Eval("Titulo") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descripción">
                            <itemtemplate>
                                <%# Eval("Descripcion") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sector">
                            <itemtemplate>
                                <%# Eval("Sector") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Trabajador Asignado">
                            <itemtemplate>
                                <span class="badge badge-tech">
                                    <%# Eval("TrabajadorAsignado") %>
                                </span>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha de Asignación">
                            <itemtemplate>
                                <%# Eval("FechaAsignacion") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Estado">
                            <itemtemplate>
                                <%# Eval("Estado") %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones">
                            <itemtemplate>

                                <asp:Button ID="btnEditar"
                                    runat="server"
                                    Text="Editar"
                                    CssClass="btn btn-sm btn-outline-primary"
                                    CommandName="Editar"
                                    CommandArgument='<%# Eval("Id") %>' />

                                <asp:Button ID="btnEliminar"
                                    runat="server"
                                    Text="Eliminar"
                                    CssClass="btn btn-sm btn-outline-danger"
                                    CommandName="Eliminar"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClientClick="return confirmarEliminar(this);" />

                            </itemtemplate>
                        </asp:TemplateField>
                    </columns>
                </asp:GridView>
                <script>

                    function confirmarEliminar() {

                        event.preventDefault();

                        let boton = event.target;

                        Swal.fire({
                            title: '¿Eliminar Tarea?',
                            text: 'Esta acción no se puede deshacer',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Sí, eliminar',
                            cancelButtonText: 'Cancelar'
                        }).then((result) => {

                            if (result.isConfirmed) {

                                boton.onclick = null;

                                boton.click();

                            }

                        });

                        return false;
                    }

</script>
            </div>
        </div>
    </div>
</asp:Content>
