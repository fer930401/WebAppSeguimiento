<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InfoPlaneacion.aspx.cs" Inherits="WebAppSeguimiento.AltaSeguimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container body-content">
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <br />
            <br />
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="planeacion">
                    <div>
                    <br />
                        <div class="alert alert-danger text-center" role="alert">
                            <strong>
                                <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Informacion de Planeación" /></strong>
                        </div>  
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Ruta:</label>
                                    <asp:TextBox ID="txtRutaPlane" runat="server" CssClass="form-control" required></asp:TextBox>
                                </div>  
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Proveedor:</label>
                                    <asp:DropDownList ID="ddlProveedorPlane" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Carrier:</label>
                                    <asp:DropDownList ID="ddlCarrier" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>  
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tipo Unidad:</label>
                                    <asp:DropDownList ID="ddlUnidadPlane" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Fecha de Recoleccion:</label>
                                    <asp:TextBox ID="txtFechaRecPlane" TextMode="DateTimeLocal" runat="server" CssClass="form-control" required></asp:TextBox>
                                </div>  
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Almacen Descarga:</label>
                                    <asp:DropDownList ID="ddlAlmPlane" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <br />
       
                        <div class="alert alert-danger text-center" role="alert">
                            <strong>
                                <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Informacion de Mondelez" /></strong>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Cita Programada Mondelez:</label>
                                    <asp:TextBox ID="txtSalidaProgMonde" TextMode="DateTimeLocal" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <hr />
                <div class="container">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" TabIndex="19" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" TabIndex="20" />
                </div>
                <hr />
            </div>
        </div>
    </div>
</div>
</asp:Content>
