using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio
{
    public class LogicaNegocio
    {
        AccesoDatos.AccesoDatos datos;
        public LogicaNegocio()
        {
            datos = new AccesoDatos.AccesoDatos();
        }

        public List<AccesoDatos.sp_WebAppSeguimientoConsDatos_Result> consultaDatos(int? opc, string filtro1, string filtro2)
        {
            return datos.consultaDatos(opc, filtro1, filtro2);
        }
        public AccesoDatos.sp_WebAppAdmSeguimiento_Result insertaDatos(Int32 id, string cv, string ruta, string proveedor, string placas, string carrier, string tip_unidad, string operador,
                    DateTime? fec_recoleccion, string alm_descarga, string status, DateTime? fec_llegadaRealProv, DateTime? fec_entradaRealProv, string llegada_otdProv,
                    TimeSpan llegada_delayProv, string llegada_justiProv, string llegada_comenProv, DateTime? fec_salidaRealProv, string salida_otdProv,
                    TimeSpan salida_delayProv, string salida_justiProv, string salida_comenProv, DateTime? fec_llegadaRealMonde, DateTime? fec_entradaRealMonde,
                    string llegada_otdMonde, TimeSpan llegada_delayMonde, string llegada_justiMonde, string llegada_comenMonde, DateTime? fec_salidaRealMonde,
                    string salida_otdMonde, TimeSpan salida_delayMonde, string salida_justiMonde, string salida_comenMonde, DateTime? fec_salidaProgProv, DateTime? fec_salidaProgMonde, TimeSpan estadiaProv, TimeSpan estadiaMonde, DateTime? fec_progCitaMonde, Int32 opc)
        {
            return datos.insertaDatos(id, cv, ruta, proveedor, placas, carrier, tip_unidad, operador,
                    fec_recoleccion, alm_descarga, status, fec_llegadaRealProv, fec_entradaRealProv, llegada_otdProv,
                    llegada_delayProv, llegada_justiProv, llegada_comenProv, fec_salidaRealProv, salida_otdProv,
                    salida_delayProv, salida_justiProv, salida_comenProv, fec_llegadaRealMonde, fec_entradaRealMonde,
                    llegada_otdMonde, llegada_delayMonde, llegada_justiMonde, llegada_comenMonde, fec_salidaRealMonde,
                    salida_otdMonde, salida_delayMonde, salida_justiMonde, salida_comenMonde, fec_salidaProgProv, 
                    fec_salidaProgMonde, estadiaProv, estadiaMonde, fec_progCitaMonde, opc);
        }
        public List<AccesoDatos.sp_WebAppConsultaSeguimiento_Result> consultaSeguimiento(string filtro1, string filtro2, int? opc)
        {
            return datos.consultaSeguimiento(filtro1, filtro2, opc);
        }
    }
}
