using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Windows.Forms;


namespace A1___Website_UI
{
    public partial class search : System.Web.UI.Page
    {
        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                supplierTB.Text = Request.QueryString["supplier"];
                loadSuppliers();
            } 
        }

        protected void loadSuppliers()
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string getdata = "SELECT * FROM Supplier WHERE SupId = '" + supplierTB.Text + "'";
            var cmd = new MySqlCommand(getdata, conn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (ds.Tables[0].Rows.Count > 0)
            {
                SupplierGridView.DataSource = ds;
                SupplierGridView.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                SupplierGridView.DataSource = ds;
                SupplierGridView.DataBind();
                int columncount = SupplierGridView.Rows[0].Cells.Count;
                lblmsg.Text = " No data found !!!";
            }
        }

        protected void SupplierGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void SupplierGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Response.Redirect("~/SupplierEdit.aspx?supplier='" + e.CommandArgument + "'");
        }

        protected void ButtonEdit_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/SupplierEdit.aspx?supplier=" + rowIndex + "");
            }
        }

        //protected void ButtonEdit_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/SupplierEdit.aspx");
        //}

        //protected void SupplierGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //}
    }
}