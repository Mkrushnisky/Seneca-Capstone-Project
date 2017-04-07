using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using Microsoft.Reporting.WebForms;
using System.Configuration;

namespace A1___Website_UI
{
    public partial class SubCategoryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportViewer1.Reset();
            ReportViewer1.LocalReport.ReportPath = "ReportCategory.rdlc";
            ReportDataSource rs = new ReportDataSource("DataSet1", GetCategoryData());
            ReportViewer1.LocalReport.DataSources.Add(rs);
            ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubCatData);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GetCategoryData()
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Category", cn);
                ad.Fill(dt);
            }
            return dt;
        }

        public void SetSubCatData(object sender, SubreportProcessingEventArgs e)

        {
            int CatId = int.Parse(e.Parameters["CatId"].Values[0].ToString());
            ReportDataSource ds = new ReportDataSource("DataSet1", GetSubCategoryData(CatId));
            e.DataSources.Add(ds);
        }

        private DataTable GetSubCategoryData(int CatId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM SubCategory WHERE CatId = " + CatId + "", cn);
                ad.Fill(dt);
            }
            return dt;
        }
    }
}