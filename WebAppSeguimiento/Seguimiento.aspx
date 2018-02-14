<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Seguimiento.aspx.cs" Inherits="WebAppSeguimiento.Seguimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
    .header-center{
        text-align:center;
    }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#<%=GridView1.ClientID%> [id='btnImg']").click(function () {
                var tr = $(this).parent().parent();
                var id_inc = $("td:eq(0)", tr).html();
                var sto = $("td:eq(2)", tr).html();
                var factura = $("td:eq(6)", tr).html();
                var opc = 0;
                var dWidth = $(window).width() * 0.9;
                var dHeight = $(window).height() * 0.9;
                $('<div>').dialog({
                    modal: true,
                    open: function () {
                        $(this).load('Index.aspx');
                    },
                    width: dWidth,
                    height: dHeight,
                    draggable: false,
                    responsive: true,
                    close: function (e, ui) {
                        window.location.href = 'Index.aspx';
                    }
                }).prev(".ui-dialog-titlebar").css("background", "#363636");
            });
        });
    </script>
    <style>
        .ui-dialog {
            z-index: 1000000000;
            top: 0;
            left: 0;
            margin: auto;
            position: fixed;
            max-width: 100%;
            max-height: 100%;
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        .ui-dialog .ui-dialog-content {
            flex: 1;
        }

        .ui-dialog .ui-dialog-buttonpane {
            background: white;
        }
        .ui-dialog .ui-dialog-titlebar {
            background:#042644;
            border-color:#042644;
        }
    </style>
    <div class="">
        <div class="">
            <br />
            <br />
            <br />
            <br />
            <% 
                for (int i=1; i <= GridView1.Rows.Count; i++)
                {
                        foreach (GridViewRow row in GridView1.Rows)
                        {
                            if (row.Cells[8].Text.TrimEnd(' ').Equals("SIN DATOS") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("REPORTE DESCARGA") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#F5E50C");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("REPORTE CARGA") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#CC6600");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("CANCELADA") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#404040");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("DESCARGADA") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#006600");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("DESCARGANDO") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#FF8000");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("FLETE EN FALSO") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#CC0000");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("RESGUARDO") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#000066");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("TRANSITO MDLZ") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#660066");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (row.Cells[8].Text.TrimEnd(' ').Equals("TRANSITO PROV") == true)
                            {
                                row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#3399FF");
                                row.Cells[8].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                        }
                }
            %>
            <div class="" ><!-- style="background-color: #FFEC9E;" -->
                <div class="">
                    <div class="alert alert-danger text-center" role="alert">
                        <strong><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Consulta los Seguimientos" /></strong>
                    </div>
                </div>
                <div class="">
                    <div style="padding-left:10px;padding-right:10px;">
                        <div class="form-inline">
                            <div class="form-group">
                                <label>Filtra por Fecha: </label>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlFechas" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged" AutoPostBack="true" Width="100%"></asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                BackColor="White" CssClass="table table-responsive" HeaderStyle-Height="50px"
                                EmptyDataText="No hay seguimientos registrados" Font-Size="Small">
                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>
                                    <asp:BoundField DataField="id_seguimiento" HeaderText="Folio" ItemStyle-Width="50" HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center"/>
                                    <asp:BoundField DataField="proveedor" HeaderText="Proveedor" ItemStyle-Width="100" HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center"/>
                                    <asp:BoundField DataField="alm_descarga" HeaderText="Almacen" ItemStyle-Width="50" HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center"/>
                                    <asp:TemplateField HeaderText="Llegada Proveedor" ItemStyle-Width="50" HeaderStyle-BackColor="#FFCC00" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center">
                                        <ItemTemplate>
                                            <asp:Image ID="lblCustomerName" runat="server" ImageUrl='<%# nombreImagen(Eval("llegada_otdProv"),Eval("status")) %>' Width="35" Height="35" ></asp:Image>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Salida Proveedor" ItemStyle-Width="50" HeaderStyle-BackColor="#FFCC00" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center">
                                        <ItemTemplate>
                                            <asp:Image ID="lblCustomerName" runat="server" ImageUrl='<%# nombreImagen(Eval("salida_otdProv"),Eval("status")) %>' Width="35" Height="35" ></asp:Image>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Llegada MDLZ"  ItemStyle-Width="50" HeaderStyle-BackColor="#800080" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center">
                                        <ItemTemplate>
                                            <asp:Image ID="lblCustomerName" runat="server" ImageUrl='<%# nombreImagen(Eval("llegada_otdMonde"),Eval("status")) %>' Width="35" Height="35" ></asp:Image>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Salida MDLZ"  ItemStyle-Width="50" HeaderStyle-BackColor="#800080" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center">
                                        <ItemTemplate>
                                            <asp:Image ID="lblCustomerName" runat="server" ImageUrl='<%# nombreImagen(Eval("salida_otdMonde"),Eval("status")) %>' Width="35" Height="35" ToolTip='<%# Eval("salida_otdMonde")%>' ></asp:Image>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="status" HeaderText="Detalle" ItemStyle-Width="50" HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center"/>
                                    <asp:TemplateField HeaderText="Status"  ItemStyle-Width="50" HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="white" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="header-center">
                                        <ItemTemplate>
                                            <asp:Image ID="lblCustomerName" runat="server" ImageUrl='<%# estadia(Eval("estadiaMonde"),Eval("estadiaProv"),Eval("status")) %>' Width="40" Height="40" ToolTip='<%# Eval("status")%>' ></asp:Image>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                        </asp:GridView>
                        <hr />
                        <asp:Button ID="btnExportar" runat="server" Text="Exportar Seguimientos" CssClass="btn btn-success" OnClick="btnExportar_Click" />
                        <%--<asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" /> --%>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css" rel="Stylesheet" type="text/css" />
</asp:Content>
