using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSeguimiento
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["visibleOpciones"] = "style = 'display:none'";
                Session["visibleAzucar"] = "style = 'display:none'";
                Session["visibleLogin"] = "";
                Session["visibleLogout"] = "style = 'display:none'";
            }
            else
            {
                if (Session["rol_user"].Equals("GER") == true)
                {
                    Session["visibleOpciones"] = "";
                    Session["visibleAzucar"] = "style = 'display:none'";
                }
                else
                {
                    Session["visibleOpciones"] = "style = 'display:none'";
                    Session["visibleAzucar"] = "";
                }
                Session["visibleLogin"] = "style = 'display:none'";
                Session["visibleLogout"] = "";
                lblUser.Text = Session["nom_user"].ToString();
                lblUserA.Text = Session["nom_user"].ToString();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Index.aspx", false);
        }
    }
}