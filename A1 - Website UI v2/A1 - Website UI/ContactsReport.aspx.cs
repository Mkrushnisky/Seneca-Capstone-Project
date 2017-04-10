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
    public partial class ContactsReport : System.Web.UI.Page
    {
        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoryBind();
                SubCategoryBind("NA");
                loadreport(sender, e);
            }
        }

        public void loadreport(object sender, EventArgs e)
        {
            string subcatid = SubCatDropDown.SelectedValue;
            if (subcatid == "NA")
            {
                ReportViewer1.Reset();
                ReportViewer1.LocalReport.ReportPath = "ReportSupplier.rdlc";
                ReportDataSource rs = new ReportDataSource("DataSet1", GetSupplierData("void"));
                ReportViewer1.LocalReport.DataSources.Add(rs);
                ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubDataSource);
                ReportViewer1.LocalReport.Refresh();
            }
            else
            {
                ReportViewer1.Reset();
                ReportViewer1.LocalReport.ReportPath = "ReportSupplier.rdlc";
                ReportDataSource rs = new ReportDataSource("DataSet1", GetSupplierData(subcatid));
                ReportViewer1.LocalReport.DataSources.Add(rs);
                ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubDataSource);
                ReportViewer1.LocalReport.Refresh();
            }
        }

        public void SetSubDataSource(object sender, SubreportProcessingEventArgs e)

        {
            var path = e.ReportPath;

            switch (path) {
                case "ReportContact":
                    int SupId1 = int.Parse(e.Parameters["SupId"].Values[0].ToString());
                    ReportDataSource ds1 = new ReportDataSource("DataSet1", GetData2(SupId1));
                    e.DataSources.Add(ds1);
                    break;
                case "ReportSupplierSubCat":
                    int SupId2 = int.Parse(e.Parameters["SupId"].Values[0].ToString());
                    ReportDataSource ds2 = new ReportDataSource("DataSet1", GetData3(SupId2));
                    e.DataSources.Add(ds2);
                    break;
                case "ReportDistributor":
                    int SupId3 = int.Parse(e.Parameters["SupId"].Values[0].ToString());
                    ReportDataSource ds3 = new ReportDataSource("DataSet1", GetData4(SupId3));
                    e.DataSources.Add(ds3);
                    break;
                case "ReportDisContact":
                    int SupId4 = int.Parse(e.Parameters["SupId"].Values[0].ToString());
                    ReportDataSource ds4 = new ReportDataSource("DataSet1", GetData5(SupId4));
                    e.DataSources.Add(ds4);
                    break;
                case "ReportDisSubCategory":
                    int SupId5 = int.Parse(e.Parameters["SupId"].Values[0].ToString());
                    ReportDataSource ds5 = new ReportDataSource("DataSet1", GetData6(SupId5));
                    e.DataSources.Add(ds5);
                    break;
            }
        }

        private DataTable GetData2(int SupId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Contact WHERE SupId = " + SupId + "", cn);
                ad.Fill(dt);
            }
            return dt;
        }

        private DataTable GetSupplierData(string subcatId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                if (subcatId == "void")
                {
                    MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Supplier", cn);
                    ad.Fill(dt);
                }
                else
                {
                    MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Supplier INNER JOIN SubCatSupplier ON SubCatSupplier.SupId = Supplier.SupId WHERE SubCatId = " + subcatId + "", cn);
                    ad.Fill(dt);
                }

            }
            return dt;
        }

        private DataTable GetData3(int SupId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                MySqlDataAdapter ad = new MySqlDataAdapter("SELECT SubCategory.* FROM SubCategory INNER JOIN SubCatSupplier ON SubCategory.SubCatId = SubCatSupplier.SubCatId WHERE SubCatSupplier.SupId = " + SupId + "", cn);
                ad.Fill(dt);
            }
            return dt;
        }

        private DataTable GetData4(int SupId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Distributor WHERE SupId = " + SupId + "", cn);
                ad.Fill(dt);
            }
            return dt;
        }

        private DataTable GetData5(int SupId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                MySqlDataAdapter ad = new MySqlDataAdapter("SELECT * FROM Contact WHERE SupId = " + SupId + "", cn);
                ad.Fill(dt);
            }
            return dt;
        }

        private DataTable GetData6(int SupId)
        {
            DataTable dt = new DataTable();
            string con = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(con))
            {
                MySqlDataAdapter ad = new MySqlDataAdapter("SELECT SubCategory.* FROM SubCategory INNER JOIN SubCatSupplier ON SubCategory.SubCatId = SubCatSupplier.SubCatId WHERE SubCatSupplier.SupId = " + SupId + "", cn);
                ad.Fill(dt);
            }
            return dt;
        }

        protected void SubCatDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadreport(sender, e);
        }

        protected void CategoryDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategoryBind(CategoryDropDown.SelectedValue);
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

        //Database connection for Category information to bind it to the Category Dropdownlist
        protected void SubCategoryBind(string cat)
        {
            string Query = "";
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                if(CategoryDropDown.SelectedValue == "All" || cat == "NA")
                {
                    Query = "SELECT * FROM SubCategory";
                }
                else
                {
                    Query = "SELECT * FROM SubCategory WHERE CatId = " + cat + "";
                }
                
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            SubCatDropDown.DataSource = reader;
                            SubCatDropDown.DataValueField = "SubCatId";
                            SubCatDropDown.DataTextField = "SCName";
                            SubCatDropDown.DataBind();
                            SubCatDropDown.Items.Insert(0, new ListItem("All", "NA"));
                        }
                    }
                }
            }
        }

        protected void ClearBTN_Click(object sender, EventArgs e)
        {
            CategoryBind();
            SubCategoryBind("NA");
            loadreport(sender, e);
        }
    }
}