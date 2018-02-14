using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccesoDatos;
using LogicaNegocio;

namespace WebAppSeguimiento
{
    public partial class Login : System.Web.UI.Page
    {

        LogicaNegocio.LogicaNegocio logicaNegocio = new LogicaNegocio.LogicaNegocio();
        string mensaje = "";
        int? error = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUsuarios.DataSource = logicaNegocio.consultaDatos(1, "", "");
                ddlUsuarios.DataTextField = "dato";
                ddlUsuarios.DataValueField = "cve_dato";
                ddlUsuarios.DataBind();
                ddlUsuarios.Items.Insert(0, new ListItem("Selecciona a un usuario", "NA"));
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cve_user = ddlUsuarios.SelectedValue.ToString();
            string pass = txtContrasena.Text;
            string error = "";

            List<AccesoDatos.sp_WebAppSeguimientoConsDatos_Result> userLogin = logicaNegocio.consultaDatos(2, cve_user, pass);

            if (userLogin.Count != 0)
            {
                Session["user"] = userLogin[0].cve_dato;
                string dato_user = userLogin[0].dato;
                string[] array = dato_user.Split(';');
                Session["nom_user"] = array[0].ToString();
                Session["rol_user"] = array[1].ToString();
                Session["cve_user"] = cve_user;
                Response.Write("<script type=\"text/javascript\">alert('Login Exitoso'); window.location.href = 'Index.aspx';</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Los datos son incorrectos'); window.location.href = 'Login.aspx';</script>");
            }
        }
    }
}