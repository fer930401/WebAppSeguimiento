using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSeguimiento
{
    public partial class AltaSeguimiento : System.Web.UI.Page
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
                ddlProveedorPlane.DataSource = logicaNegocio.consultaDatos(3, "", "");
                ddlProveedorPlane.DataTextField = "dato";
                ddlProveedorPlane.DataValueField = "cve_dato";
                ddlProveedorPlane.DataBind();
                ddlProveedorPlane.Items.Insert(0, new ListItem("Selecciona a un proveedor", "NA"));

                ddlUnidadPlane.DataSource = logicaNegocio.consultaDatos(4, "", "");
                ddlUnidadPlane.DataTextField = "dato";
                ddlUnidadPlane.DataValueField = "cve_dato";
                ddlUnidadPlane.DataBind();
                ddlUnidadPlane.Items.Insert(0, new ListItem("Selecciona un tipo de unidad", "NA"));

                ddlAlmPlane.DataSource = logicaNegocio.consultaDatos(5, "", "");
                ddlAlmPlane.DataTextField = "dato";
                ddlAlmPlane.DataValueField = "cve_dato";
                ddlAlmPlane.DataBind();
                ddlAlmPlane.Items.Insert(0, new ListItem("Selecciona un almacen", "NA"));

                ddlCarrier.DataSource = logicaNegocio.consultaDatos(7, "", "");
                ddlCarrier.DataTextField = "dato";
                ddlCarrier.DataValueField = "cve_dato";
                ddlCarrier.DataBind();
                ddlCarrier.Items.Insert(0, new ListItem("Selecciona un carrier", "NA"));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string ruta = txtRutaPlane.Text;
            string proveedor = ddlProveedorPlane.Text;
            string carrier = ddlCarrier.SelectedValue;
            string tip_unidad = ddlUnidadPlane.Text;
            DateTime fec_RecPlane = DateTime.Parse(txtFechaRecPlane.Text);
            string alm_descarga = ddlAlmPlane.Text;

            DateTime? salidaProgProv;
            DateTime? salidaProgMdlz;
            List<AccesoDatos.sp_WebAppSeguimientoConsDatos_Result> cargaProv = logicaNegocio.consultaDatos(8, proveedor, "");
            List<AccesoDatos.sp_WebAppSeguimientoConsDatos_Result> descargaMDLZ = logicaNegocio.consultaDatos(9, proveedor, "");

            double carga = 0;
            double descarga = 0;

            if (string.IsNullOrEmpty(cargaProv[0].dato) == false)
            {
                carga = double.Parse(cargaProv[0].dato);
            }
            else
            {
                carga = 0;
            }

            if (string.IsNullOrEmpty(descargaMDLZ[0].dato) == false)
            {
                descarga = double.Parse(descargaMDLZ[0].dato);
            }
            else
            {
                descarga = 0;
            }
            

            DateTime? citaProgMdlz;
            if (string.IsNullOrEmpty(txtSalidaProgMonde.Text) == false)
            {
                citaProgMdlz = DateTime.Parse(txtSalidaProgMonde.Text);
                salidaProgMdlz = citaProgMdlz.Value.AddHours(descarga);
            }
            else
            {
                citaProgMdlz = null;
                salidaProgMdlz = null;
            }
            salidaProgProv = fec_RecPlane.AddHours(carga);

            Int32 opc = 1;
            AccesoDatos.sp_WebAppAdmSeguimiento_Result insertaDatos = logicaNegocio.insertaDatos(1, "", ruta, proveedor, "", carrier, tip_unidad, "",
                    fec_RecPlane, alm_descarga, "sts_ilo_10", DateTime.Now, DateTime.Now, "",
                    TimeSpan.Parse("0"), "", "", DateTime.Now, "",
                    TimeSpan.Parse("0"), "", "", DateTime.Now, DateTime.Now,
                    "", TimeSpan.Parse("0"), "", "", DateTime.Now,
                    "", TimeSpan.Parse("0"), "", "",salidaProgProv, salidaProgMdlz, TimeSpan.Parse("0"), TimeSpan.Parse("0"), citaProgMdlz, opc);
            error = insertaDatos.error;
            mensaje = insertaDatos.mensaje;
            if (error == 0)
            {
                Response.Write("<script type=\"text/javascript\">alert('Seguimiento registrado correctamente.'); window.location.href = 'Seguimiento.aspx';</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Ocurrio un error" + mensaje + "'); window.location.href = 'InfoPlaneacion.aspx';</script>");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx", false);
        }
    }
}