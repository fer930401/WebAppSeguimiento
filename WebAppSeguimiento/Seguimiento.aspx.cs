using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSeguimiento
{
    public partial class Seguimiento : System.Web.UI.Page
    {
        LogicaNegocio.LogicaNegocio logicaNegocio = new LogicaNegocio.LogicaNegocio();
        string mensaje = "";
        int? error = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("Index.aspx", false);
                }
                llenaTabla();

                ddlFechas.DataSource = logicaNegocio.consultaDatos(10, "", "").OrderBy(item => item.cve_dato);
                ddlFechas.DataTextField = "dato";
                ddlFechas.DataValueField = "cve_dato";
                ddlFechas.DataBind();
                ddlFechas.Items.Insert(0, new ListItem("Fecha Actual", "NA"));
            }
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                llenaTabla();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        public void llenaTabla()
        {
            GridView1.DataSource = logicaNegocio.consultaSeguimiento("","1",0);
            GridView1.DataBind();
        }

        public string nombreImagen(Object obj, Object sts)
        {
            string status = string.Empty;
            string returnValue = string.Empty;
            if (!string.IsNullOrEmpty(sts.ToString()))
            {
                if(sts.ToString().Equals("SIN DATOS") == false)
                {
                    if (!string.IsNullOrEmpty(obj.ToString()))
                    {
                        if (obj.ToString() == "OT")
                        {
                            returnValue = "Images/Status/OT.png";
                        }
                        else if (obj.ToString() == "D")
                        {
                            returnValue = "Images/Status/delay.png";
                        }
                    }
                    else
                    {
                        returnValue = "Images/Status/blanco.jpg";
                    }
                }
                else
                {
                    returnValue = "Images/Status/blanco.jpg";
                }
                
            }
            return returnValue;
        }

        public string statusFinal(Object obj1, Object obj2, Object sts)
        {
            string llegada = string.Empty;
            string salida = string.Empty;
            string status = string.Empty;
            if (!string.IsNullOrEmpty(obj1.ToString()))
            {
                if (!string.IsNullOrEmpty(obj2.ToString()))
                {
                    if (obj1.ToString().Equals("OT") == true && obj2.ToString().Equals("OT") == true)
                    {
                        llegada = "Images/Status/bien.jpg";
                    }
                    else 
                    {
                        llegada = "Images/Status/mal.jpg";
                    }
                }
            }
            return llegada;
        }

        public string estadia(Object obj1, Object obj2, Object sts)
        {
            string estadia = string.Empty;
            string salida = string.Empty;
            string status = string.Empty;
            if (!string.IsNullOrEmpty(sts.ToString()))
            {
                if (sts.ToString().Equals("SIN DATOS") == false)
                {
                    if (!string.IsNullOrEmpty(obj1.ToString()))
                    {
                        if (obj1.ToString().Equals("0") == true)
                        {
                            estadia = "Images/Status/bien.jpg";
                        }
                        else
                        {
                            estadia = "Images/Status/mal.jpg";
                        }
                    }
                    else
                    {
                        estadia = "Images/Status/blanco.jpg";
                    }
                }
                else
                {
                    estadia = "Images/Status/blanco.jpg";
                }
            }
            return estadia;
        }

        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlFechas.SelectedValue.Equals("NA") == false)
            {
                string fecha = "";
                fecha = ddlFechas.SelectedValue.ToString();
                GridView1.DataSource = logicaNegocio.consultaSeguimiento(fecha, "1", 1);
                GridView1.DataBind();
            }
            else
            {
                llenaTabla();
            }
        }
    }
}