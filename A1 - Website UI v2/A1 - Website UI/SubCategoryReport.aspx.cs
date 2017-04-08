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
        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoryBind();
                ReportViewer1.Reset();
                ReportViewer1.LocalReport.ReportPath = "ReportCategory.rdlc";
                ReportDataSource rs = new ReportDataSource("DataSet1", GetCategoryData("void"));
                ReportViewer1.LocalReport.DataSources.Add(rs);
                ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubCatData);
                ReportViewer1.LocalReport.Refresh();
            }
            
        }

        private DataTable GetCategoryData(string CatId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                if (CatId == "void")
                {
                    MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Category", cn);
                    ad.Fill(dt);
                }
                else
                {
                    MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Category WHERE CatId = '" + CatId + "'", cn);
                    ad.Fill(dt);
                }
                
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

        //Database connection for Category information to bind it to the Category Dropdownlist
        protected void CategoryBind()
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "SELECT * FROM Category";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            CategoryDropDown.DataSource = reader;
                            CategoryDropDown.DataValueField = "CatId";
                            CategoryDropDown.DataTextField = "CName";
                            CategoryDropDown.DataBind();
                            CategoryDropDown.Items.Insert(0, new ListItem("All", "NA"));
                        }
                    }
                }
            }
        }

        protected void CategoryDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            string catid = CategoryDropDown.SelectedValue;
            ReportViewer1.Reset();
            ReportViewer1.LocalReport.ReportPath = "ReportCategory.rdlc";
            if(catid == "NA")
            {
                ReportDataSource rs = new ReportDataSource("DataSet1", GetCategoryData("void"));
                ReportViewer1.LocalReport.DataSources.Add(rs);
            }
            else
            {
                ReportDataSource rs = new ReportDataSource("DataSet1", GetCategoryData(catid));
                ReportViewer1.LocalReport.DataSources.Add(rs);
            }
            ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubCatData);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}