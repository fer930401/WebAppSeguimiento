using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSeguimiento
{
    public partial class ModAzucar : System.Web.UI.Page
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
                FillGrid();

                ddlFechas.DataSource = logicaNegocio.consultaDatos(12, "", "").OrderBy(item => item.cve_dato);
                ddlFechas.DataTextField = "dato";
                ddlFechas.DataValueField = "cve_dato";
                ddlFechas.DataBind();
                ddlFechas.Items.Insert(0, new ListItem("Fecha Actual", "NA"));
            }
        }
        public void FillGrid()
        {
            grdContact.DataSource = logicaNegocio.consultaSeguimiento("", "2", 0);
            grdContact.DataBind();
        }
        public void FillGrid2()
        {
            grdContact.DataSource = logicaNegocio.consultaSeguimiento("", "2", 0);
            grdContact.DataBind();
        }
        protected void grdContact_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && grdContact.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlstatus = (DropDownList)e.Row.FindControl("ddlstatus");
                ddlstatus.DataSource = logicaNegocio.consultaDatos(11, "", "");
                ddlstatus.DataTextField = "dato";
                ddlstatus.DataValueField = "cve_dato";
                ddlstatus.DataBind();
                ddlstatus.Items.Insert(0, new ListItem("Selecciona el nuevo status", "NA"));
                ddlstatus.Items.FindByText((e.Row.FindControl("lblStatus") as Label).Text).Selected = true;

                DropDownList ddlCarrier = (DropDownList)e.Row.FindControl("ddlCarrier");
                ddlCarrier.DataSource = logicaNegocio.consultaDatos(7, "", "");
                ddlCarrier.DataTextField = "dato";
                ddlCarrier.DataValueField = "cve_dato";
                ddlCarrier.DataBind();
                ddlCarrier.Items.Insert(0, new ListItem("Selecciona un carrier", "NA"));
                ddlCarrier.Items.FindByText((e.Row.FindControl("lblCarrier2") as Label).Text).Selected = true;

                
                Label lblfec_proMonde = (Label)e.Row.FindControl("lblfec_proMonde");
                TextBox txtfec_proMonde = (TextBox)e.Row.FindControl("txtfec_proMonde");
                if (string.IsNullOrEmpty(lblfec_proMonde.Text) == false)
                {
                    //txtfec_proMonde.Visible = false;
                }
                else
                {
                    //txtfec_proMonde.Visible = true;
                }
                Label lblfec_llegadaRealMonde = (Label)e.Row.FindControl("lblfec_llegadaRealMonde");
                TextBox txtfec_llegadaRealMonde = (TextBox)e.Row.FindControl("txtfec_llegadaRealMonde");
                if (string.IsNullOrEmpty(lblfec_llegadaRealMonde.Text) == false)
                {
                    //txtfec_llegadaRealMonde.Visible = false;
                }
                else
                {
                    //txtfec_llegadaRealMonde.Visible = true;
                }
                Label lblfec_entradaRealMonde = (Label)e.Row.FindControl("lblfec_entradaRealMonde");
                TextBox txtfec_entradaRealMonde = (TextBox)e.Row.FindControl("txtfec_entradaRealMonde");
                if (string.IsNullOrEmpty(lblfec_entradaRealMonde.Text) == false)
                {
                    //txtfec_entradaRealMonde.Visible = false;
                }
                else
                {
                    //txtfec_entradaRealMonde.Visible = true;
                }
                Label lblfec_salidaProgMonde = (Label)e.Row.FindControl("lblfec_salidaProgMonde");
                TextBox txtfec_salidaProgMonde = (TextBox)e.Row.FindControl("txtfec_salidaProgMonde");
                if (string.IsNullOrEmpty(lblfec_salidaProgMonde.Text) == false)
                {
                    //txtfec_salidaProgMonde.Visible = false;
                }
                else
                {
                    //txtfec_salidaProgMonde.Visible = true;
                }
                Label lblfec_salidaRealMonde = (Label)e.Row.FindControl("lblfec_salidaRealMonde");
                TextBox txtfec_salidaRealMonde = (TextBox)e.Row.FindControl("txtfec_salidaRealMonde");
                if (string.IsNullOrEmpty(lblfec_salidaRealMonde.Text) == false)
                {
                    //txtfec_salidaRealMonde.Visible = false;
                }
                else
                {
                    //txtfec_salidaRealMonde.Visible = true;
                }
            }
        }
        protected void grdContact_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdContact.EditIndex = -1;
            FillGrid();
        }
        protected void grdContact_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblId = (Label)grdContact.Rows[e.RowIndex].FindControl("lblId");
            Label lblProveedor = (Label)grdContact.Rows[e.RowIndex].FindControl("lblProveedor");
            TextBox txtPlacas = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtPlacas");
            DropDownList ddlCarrier = (DropDownList)grdContact.Rows[e.RowIndex].FindControl("ddlCarrier");
            TextBox txtOperador = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtOperador");
            Label lblfec_rec = (Label)grdContact.Rows[e.RowIndex].FindControl("lblfec_rec");
            TextBox lblfec_recoleccion = (TextBox)grdContact.Rows[e.RowIndex].FindControl("lblfec_recoleccion");
            DropDownList ddlstatus = (DropDownList)grdContact.Rows[e.RowIndex].FindControl("ddlstatus");
            TextBox txtfec_proMonde = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtfec_proMonde");
            Label lblfec_proMonde = (Label)grdContact.Rows[e.RowIndex].FindControl("lblfec_proMonde");
            TextBox txtfec_llegadaRealMonde = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtfec_llegadaRealMonde");
            Label lblfec_llegadaRealMonde = (Label)grdContact.Rows[e.RowIndex].FindControl("lblfec_llegadaRealMonde");
            TextBox txtfec_entradaRealMonde = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtfec_entradaRealMonde");
            Label lblfec_entradaRealMonde = (Label)grdContact.Rows[e.RowIndex].FindControl("lblfec_entradaRealMonde");
            Label lblllegada_otdMonde = (Label)grdContact.Rows[e.RowIndex].FindControl("lblllegada_otdMonde");
            TextBox txtfec_comenLlegaMonde = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtfec_comenLlegaMonde");
            TextBox txtfec_salidaProgMonde = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtfec_salidaProgMonde");
            Label lblfec_salidaProgMonde = (Label)grdContact.Rows[e.RowIndex].FindControl("lblfec_salidaProgMonde");
            TextBox txtfec_salidaRealMonde = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtfec_salidaRealMonde");
            Label lblfec_salidaRealMonde = (Label)grdContact.Rows[e.RowIndex].FindControl("lblfec_salidaRealMonde");
            Label lblsalida_otdMonde = (Label)grdContact.Rows[e.RowIndex].FindControl("lblsalida_otdMonde");
            TextBox txtfec_comenSalidaMonde = (TextBox)grdContact.Rows[e.RowIndex].FindControl("txtfec_comenSalidaMonde");

            string CV = "", ruta = "", proveedor = "", placas = "", carrier = "", tip_unidad = "", operador = "",
                alm_Desc = "", status = "", llegada_otdProv = "", fec_justiLlegaProv = "", fec_comenLlegaProv = "",
                salida_otdProv = "", fec_justiSalidaProv = "", fec_comenSalidaProv = "", llegada_otdMonde = "",
                fec_justiLlegaMonde = "", fec_comenLlegaMonde = "", salida_otdMonde = "", fec_justiSalidaMonde = "",
                fec_comenSalidaMonde = "", llegada_delayProv = "0", salida_delayProv = "0", llegada_delayMonde = "0",
                salida_delayMonde = "0";
            DateTime? fec_recoleccion = null, fec_llegadaRealProv = null, fec_entradaRealProv = null, fec_salidaProgProv = null,
                fec_salidaRealProv = null, fec_citaProgMonde = null, fec_llegadaRealMonde = null, fec_entradaRealMonde = null,
                fec_salidaProgMonde = null, fec_salidaRealMonde = null;
            int Id = Int32.Parse(lblId.Text), opc = 3;

            proveedor = lblProveedor.Text;
            carrier = ddlCarrier.SelectedValue;
            if (string.IsNullOrEmpty(txtPlacas.Text) == false)
            {
                placas = txtPlacas.Text;
            }
            if (string.IsNullOrEmpty(txtOperador.Text) == false)
            {
                operador = txtOperador.Text;
            }
            status = ddlstatus.SelectedValue;
            
            if (string.IsNullOrEmpty(lblllegada_otdMonde.Text) == false)
            {
                llegada_otdMonde = lblllegada_otdMonde.Text;
            }
            if (string.IsNullOrEmpty(txtfec_comenLlegaMonde.Text) == false)
            {
                fec_comenLlegaMonde = txtfec_comenLlegaMonde.Text;
            }
            if (string.IsNullOrEmpty(lblsalida_otdMonde.Text) == false)
            {
                salida_otdMonde = lblsalida_otdMonde.Text;
            }
            if (string.IsNullOrEmpty(txtfec_comenSalidaMonde.Text) == false)
            {
                fec_comenSalidaMonde = txtfec_comenSalidaMonde.Text;
            }

            if (string.IsNullOrEmpty(lblfec_recoleccion.Text) == false)
            {
                fec_recoleccion = DateTime.Parse(lblfec_recoleccion.Text);
            }
            else
            {
                fec_recoleccion = DateTime.Parse(lblfec_rec.Text);
            }
            //fec_recoleccion = DateTime.Parse(lblfec_recoleccion.Text);

            if (txtfec_proMonde.Visible == false)
            {
                fec_citaProgMonde = DateTime.Parse(lblfec_proMonde.Text);
            }
            else
            {
                if (string.IsNullOrEmpty(txtfec_proMonde.Text) == false)
                {
                    fec_citaProgMonde = DateTime.Parse(txtfec_proMonde.Text);
                }
                else
                {
                    if (string.IsNullOrEmpty(lblfec_proMonde.Text) == false)
                    {
                        fec_citaProgMonde = DateTime.Parse(lblfec_proMonde.Text);
                    }
                    else
                    {
                        fec_citaProgMonde = null;
                    }

                }
            }

            if (txtfec_llegadaRealMonde.Visible == false)
            {
                fec_llegadaRealMonde = DateTime.Parse(lblfec_llegadaRealMonde.Text);
            }
            else
            {
                if (string.IsNullOrEmpty(txtfec_llegadaRealMonde.Text) == false)
                {
                    fec_llegadaRealMonde = DateTime.Parse(txtfec_llegadaRealMonde.Text);
                }
                else
                {
                    if (string.IsNullOrEmpty(lblfec_llegadaRealMonde.Text) == false)
                    {
                        fec_llegadaRealMonde = DateTime.Parse(lblfec_llegadaRealMonde.Text);
                    }
                    else
                    {
                        fec_llegadaRealMonde = null;
                    }

                }
            }

            if (txtfec_entradaRealMonde.Visible == false)
            {
                fec_entradaRealMonde = DateTime.Parse(lblfec_entradaRealMonde.Text);
            }
            else
            {
                if (string.IsNullOrEmpty(txtfec_entradaRealMonde.Text) == false)
                {
                    fec_entradaRealMonde = DateTime.Parse(txtfec_entradaRealMonde.Text);
                }
                else
                {
                    if (string.IsNullOrEmpty(lblfec_llegadaRealMonde.Text) == false)
                    {
                        fec_entradaRealMonde = DateTime.Parse(lblfec_entradaRealMonde.Text);
                    }
                    else
                    {
                        fec_entradaRealMonde = null;
                    }

                }
            }

            if (txtfec_salidaProgMonde.Visible == false)
            {
                fec_salidaProgMonde = DateTime.Parse(lblfec_salidaProgMonde.Text);
            }
            else
            {
                if (string.IsNullOrEmpty(txtfec_salidaProgMonde.Text) == false)
                {
                    fec_salidaProgMonde = DateTime.Parse(txtfec_salidaProgMonde.Text);
                }
                else
                {
                    if (string.IsNullOrEmpty(lblfec_llegadaRealMonde.Text) == false)
                    {
                        fec_salidaProgMonde = DateTime.Parse(lblfec_salidaProgMonde.Text);
                    }
                    else
                    {
                        fec_salidaProgMonde = null;
                    }

                }
            }

            if (txtfec_salidaRealMonde.Visible == false)
            {
                fec_salidaRealMonde = DateTime.Parse(lblfec_salidaRealMonde.Text);
            }
            else
            {
                if (string.IsNullOrEmpty(txtfec_salidaRealMonde.Text) == false)
                {
                    fec_salidaRealMonde = DateTime.Parse(txtfec_salidaRealMonde.Text);
                }
                else
                {
                    if (string.IsNullOrEmpty(lblfec_salidaRealMonde.Text) == false)
                    {
                        fec_salidaRealMonde = DateTime.Parse(lblfec_salidaRealMonde.Text);
                    }
                    else
                    {
                        fec_salidaRealMonde = null;
                    }

                }
            }


            AccesoDatos.sp_WebAppAdmSeguimiento_Result actualizaDatos = logicaNegocio.insertaDatos(Id, "", "", proveedor, placas,
                    carrier, "", operador, fec_recoleccion, "", status, null, null, "",
                    TimeSpan.Parse("0"), "", "", null, "",TimeSpan.Parse("0"), "", "", 
                    fec_llegadaRealMonde, fec_entradaRealMonde,
                    llegada_otdMonde, TimeSpan.Parse(llegada_delayMonde), fec_justiLlegaMonde, fec_comenLlegaMonde, fec_salidaRealMonde,
                    salida_otdMonde, TimeSpan.Parse(salida_delayMonde), fec_justiSalidaMonde, fec_comenSalidaMonde, null, fec_salidaProgMonde,
                    TimeSpan.Parse("0"), TimeSpan.Parse("0"), fec_citaProgMonde, opc);
            error = actualizaDatos.error;
            mensaje = actualizaDatos.mensaje;
            if (error == 0)
            {
                Response.Write("<script type=\"text/javascript\">alert('Seguimiento azucar actualizado correctamente.'); window.location.href = 'ModAzucar.aspx';</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Ocurrio un error" + mensaje + "'); window.location.href = 'ModAzucar.aspx';</script>");
            }

            if (ddlFechas.SelectedValue.Equals("NA") == false)
            {
                string fecha = "";
                fecha = ddlFechas.SelectedValue.ToString();
                grdContact.EditIndex = -1;
                grdContact.DataSource = logicaNegocio.consultaSeguimiento(fecha, "2", 1);
                grdContact.DataBind();
            }
            else
            {
                grdContact.EditIndex = -1;
                FillGrid();
            }

        }
        protected void grdContact_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }
        protected void grdContact_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }
        protected void grdContact_RowEditing(object sender, GridViewEditEventArgs e)
        {
            if (ddlFechas.SelectedValue.Equals("NA") == false)
            {
                string fecha = "";
                fecha = ddlFechas.SelectedValue.ToString();
                grdContact.EditIndex = e.NewEditIndex;
                grdContact.DataSource = logicaNegocio.consultaSeguimiento(fecha, "2", 1);
                grdContact.DataBind();
            }
            else
            {
                grdContact.EditIndex = e.NewEditIndex;
                FillGrid();
            }
        }
        public String CalcularTiempo(string seg)
        {
            Int32 tsegundos = Int32.Parse(seg);
            Int32 horas = (tsegundos / 3600);
            Int32 minutos = ((tsegundos - horas * 3600) / 60);
            Int32 segundos = tsegundos - (horas * 3600 + minutos * 60);
            return horas.ToString() + ":" + minutos.ToString() + ":" + segundos.ToString();
        }

        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFechas.SelectedValue.Equals("NA") == false)
            {
                string fecha = "";
                fecha = ddlFechas.SelectedValue.ToString();
                grdContact.DataSource = logicaNegocio.consultaSeguimiento(fecha, "2", 1);
                grdContact.DataBind();
            }
            else
            {
                FillGrid();
            }
        }
    }
}