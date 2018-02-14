<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModAzucar.aspx.cs" Inherits="WebAppSeguimiento.ModAzucar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/ScrollableGridViewPlugin_ASP.NetAJAXmin.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        /*$('#<=grdContact.ClientID %>').Scrollable({
            ScrollHeight: 500,
            IsInUpdatePanel: true
        });*/
    });
</script>
    <script>
        window.onload = function () {
            var pos = window.name || 0;
            window.scrollTo(0, pos);
        }
        window.onunload = function () {
            window.name = self.pageYOffset || (document.documentElement.scrollTop + document.body.scrollTop);
        }
</script>
    <br />
    <br />
    <br />
    <% 
                for (int i=1; i <= grdContact.Rows.Count; i++)
                {
                        foreach (GridViewRow row in grdContact.Rows)
                        {
                            row.Cells[0].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            row.Cells[1].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            row.Cells[2].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            row.Cells[3].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            row.Cells[4].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            row.Cells[5].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            row.Cells[6].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                            row.Cells[7].BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");

                            Label lblStatus = (Label)row.FindControl("lblStatus");
                            if (lblStatus.Text.TrimEnd(' ').Equals("Reprogramado") == true)
                            {
                                row.Cells[7].BackColor = System.Drawing.ColorTranslator.FromHtml("#F5E50C");
                                row.Cells[7].ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
                            }
                            else if (lblStatus.Text.TrimEnd(' ').Equals("Descargado") == true)
                            {
                                row.Cells[7].BackColor = System.Drawing.ColorTranslator.FromHtml("#006600");
                                row.Cells[7].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (lblStatus.Text.TrimEnd(' ').Equals("Pendiente Descarga") == true)
                            {
                                row.Cells[7].BackColor = System.Drawing.ColorTranslator.FromHtml("#3399FF");
                                row.Cells[7].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }

                            row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                            row.Cells[9].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                            row.Cells[10].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");

                            Label lblllegada_otdMonde = (Label)row.FindControl("lblllegada_otdMonde");
                            if (lblllegada_otdMonde.Text.TrimEnd(' ').Equals("D") == true)
                            {
                                row.Cells[11].BackColor = System.Drawing.ColorTranslator.FromHtml("#CC0000");
                                row.Cells[11].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (lblllegada_otdMonde.Text.TrimEnd(' ').Equals("OT") == true)
                            {
                                row.Cells[11].BackColor = System.Drawing.ColorTranslator.FromHtml("#009900");
                                row.Cells[11].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }

                            row.Cells[12].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                            row.Cells[13].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                            row.Cells[14].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                            row.Cells[15].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                            row.Cells[16].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                            
                            Label lblsalida_otdMonde = (Label)row.FindControl("lblsalida_otdMonde");
                            if (lblsalida_otdMonde.Text.TrimEnd(' ').Equals("D") == true)
                            {
                                row.Cells[17].BackColor = System.Drawing.ColorTranslator.FromHtml("#CC0000");
                                row.Cells[17].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }
                            else if (lblsalida_otdMonde.Text.TrimEnd(' ').Equals("OT") == true)
                            {
                                row.Cells[17].BackColor = System.Drawing.ColorTranslator.FromHtml("#009900");
                                row.Cells[17].ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                            }

                            row.Cells[18].BackColor = System.Drawing.ColorTranslator.FromHtml("#E5CCFF");
                        }
                }
            %>
    <div class="">
        <div class="alert alert-danger text-center" role="alert">
            <strong><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Agrega mas informacion de los Seguimientos" /></strong>
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
            <asp:GridView ID="grdContact" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id_seguimiento" HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="White"
                CssClass="table table-responsive" HeaderStyle-Height="50px" EmptyDataText="No hay seguimientos registrados" 
                OnRowCancelingEdit="grdContact_RowCancelingEdit" OnRowDataBound="grdContact_RowDataBound" OnRowEditing="grdContact_RowEditing" 
                OnRowUpdating="grdContact_RowUpdating" OnRowCommand="grdContact_RowCommand" OnRowDeleting="grdContact_RowDeleting" HeaderStyle-Wrap="false"
                Font-Size="X-Small"> 
            <Columns> 
                <asp:TemplateField HeaderText="ID"  HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblId" runat="server" Text='<%# Bind("id_seguimiento") %>'></asp:Label>
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblId" runat="server" Text='<%# Bind("id_seguimiento") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Proveedor" HeaderStyle-HorizontalAlign="Left"> 
                    <ItemTemplate> 
                        <asp:Label ID="lblProveedor" runat="server" Text='<%# Bind("proveedor") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Placas / Economico" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:TextBox ID="txtPlacas" runat="server" Text='<%# Bind("placas") %>' CssClass="form-control" Width="100"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblPlacas" runat="server" Text='<%# Bind("placas") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Carrier" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:DropDownList ID="ddlCarrier" runat="server"  CssClass="form-control" Width="100"></asp:DropDownList> 
                        <asp:Label ID="lblCarrier2" runat="server" Text='<%# Eval("carrier") %>' Visible="false"></asp:Label> 
                    </EditItemTemplate>
                    <ItemTemplate> 
                        <asp:Label ID="lblCarrier" runat="server" Text='<%# Bind("carrier") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Operador" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:TextBox ID="txtOperador" runat="server" Text='<%# Bind("operador") %>' CssClass="form-control" Width="200"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblOperador" runat="server" Text='<%# Bind("operador") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Recoleccion" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblfec_rec" runat="server" Text='<%# Bind("fec_recoleccion")%>'></asp:Label> 
                        <asp:TextBox ID="lblfec_recoleccion" runat="server" TextMode="DateTimeLocal" CssClass="form-control" Width="200"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_recoleccion" runat="server" Text='<%# Bind("fec_recoleccion")%>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Almacen Descarga" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblAlm_Desc" runat="server" Text='<%# Bind("alm_descarga") %>'></asp:Label> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblAlm_Desc" runat="server" Text='<%# Bind("alm_descarga") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:DropDownList ID="ddlstatus" runat="server"  CssClass="form-control" Width="120"></asp:DropDownList> 
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("status") %>' Visible="false"></asp:Label> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("status") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cita en MDLZ." HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblfec_proMonde" runat="server" Text='<%# Bind("fec_proMonde") %>'></asp:Label> 
                        <asp:TextBox ID="txtfec_proMonde" runat="server" TextMode="DateTimeLocal" Text='<%# Bind("fec_proMonde") %>' CssClass="form-control" Width="230"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_proMonde" runat="server" Text='<%# Bind("fec_proMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Llegada a MDLZ." HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblfec_llegadaRealMonde" runat="server" Text='<%# Bind("fec_llegadaRealMonde") %>'></asp:Label> 
                        <asp:TextBox ID="txtfec_llegadaRealMonde" runat="server" TextMode="DateTimeLocal" Text='<%# Bind("fec_llegadaRealMonde") %>' CssClass="form-control" Width="230"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_llegadaRealMonde" runat="server" Text='<%# Bind("fec_llegadaRealMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Entrada a MDLZ." HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblfec_entradaRealMonde" runat="server" Text='<%# Bind("fec_entradaRealMonde") %>'></asp:Label> 
                        <asp:TextBox ID="txtfec_entradaRealMonde" runat="server" TextMode="DateTimeLocal" Text='<%# Bind("fec_entradaRealMonde") %>' CssClass="form-control" Width="230"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_entradaRealMonde" runat="server" Text='<%# Bind("fec_entradaRealMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OT / D" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblllegada_otdMonde" runat="server" Text='<%# Bind("llegada_otdMonde") %>'></asp:Label> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblllegada_otdMonde" runat="server" Text='<%# Bind("llegada_otdMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dif. Delay" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblllegada_delayMonde" runat="server" Text='<%# CalcularTiempo(Eval("llegada_delayMonde").ToString()) %>'></asp:Label> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblllegada_delayMonde" runat="server" Text='<%# CalcularTiempo(Eval("llegada_delayMonde").ToString()) %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comentarios Llegada MDLZ." HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:TextBox ID="txtfec_comenLlegaMonde" runat="server" TextMode="MultiLine" Text='<%# Bind("llegada_comenMonde") %>' CssClass="form-control" Width="200"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_comenLlegaMonde" runat="server" Text='<%# Bind("llegada_comenMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salida de MDLZ." HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblfec_salidaProgMonde" runat="server" Text='<%# Bind("fec_salidaProgMonde") %>'></asp:Label> 
                        <asp:TextBox ID="txtfec_salidaProgMonde" runat="server" TextMode="DateTimeLocal" Text='<%# Bind("fec_salidaProgMonde") %>' CssClass="form-control" Width="230"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_citaProgMonde" runat="server" Text='<%# Bind("fec_salidaProgMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salida Real MDLZ." HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblfec_salidaRealMonde" runat="server" Text='<%# Bind("fec_salidaRealMonde") %>'></asp:Label> 
                        <asp:TextBox ID="txtfec_salidaRealMonde" runat="server" TextMode="DateTimeLocal" Text='<%# Bind("fec_salidaRealMonde") %>' CssClass="form-control" Width="230"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_salidaRealMonde" runat="server" Text='<%# Bind("fec_salidaRealMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comentarios Salida MDLZ." HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:TextBox ID="txtfec_comenSalidaMonde" runat="server" TextMode="MultiLine" Text='<%# Bind("salida_comenMonde") %>' CssClass="form-control" Width="200"></asp:TextBox> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblfec_comenSalidaMonde" runat="server" Text='<%# Bind("salida_comenMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OT / D" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblsalida_otdMonde" runat="server" Text='<%# Bind("salida_otdMonde") %>'></asp:Label> 
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblsalida_otdMonde" runat="server" Text='<%# Bind("salida_otdMonde") %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dif. Delay" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:Label ID="lblsalida_delayMonde" runat="server" Text='<%# CalcularTiempo(Eval("salida_delayMonde").ToString()) %>'></asp:Label>
                    </EditItemTemplate> 
                    <ItemTemplate> 
                        <asp:Label ID="lblsalida_delayMonde" runat="server" Text='<%# CalcularTiempo(Eval("salida_delayMonde").ToString()) %>'></asp:Label> 
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Editar" ShowHeader="False" HeaderStyle-HorizontalAlign="Left"> 
                    <EditItemTemplate> 
                        <asp:LinkButton ID="lbkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-success"></asp:LinkButton> 
                        <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-danger"></asp:LinkButton> 
                    </EditItemTemplate>
                    <ItemTemplate> 
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" CssClass="btn btn-warning"></asp:LinkButton> 
                    </ItemTemplate> 
                </asp:TemplateField>  
            </Columns> 
            </asp:GridView>
    </div>
</div>
</asp:Content>
