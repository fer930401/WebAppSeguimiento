<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppSeguimiento.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="container">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <br />
            <br />
            <br />
            <div class="form-group">
                <label for="exampleInputEmail1">Email:</label>
                <asp:DropDownList ID="ddlUsuarios" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="contrasena">Contraseña</label>
                <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success" OnClick="btnLogin_Click" />
            <br />
            <br />
            <br />
        </div>
        <div class="col-md-3">

        </div>
    </div>
</asp:Content>