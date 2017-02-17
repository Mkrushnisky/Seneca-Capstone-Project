using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1___Website_UI.AdminPages
{
    public partial class UserEdit : System.Web.UI.Page
    {
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                supplierTB.Text = Request.QueryString["supplier"];
                loadUsers();
            }
        }
        protected void loadUsers()
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string getdata = "SELECT * FROM Users WHERE NOT UserId = '" + 1 + "'";
            var cmd = new MySqlCommand(getdata, conn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (ds.Tables[0].Rows.Count > 0)
            {
                UserGridView.DataSource = ds;
                UserGridView.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                UserGridView.DataSource = ds;
                UserGridView.DataBind();
                int columncount = UserGridView.Rows[0].Cells.Count;
                lblmsg.Text = " No data found !!!";
            }
        }

        protected void ButtonEdit_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/AdminPages/UserEdit.aspx?User=" + rowIndex + "");
            }
        }
    }
}