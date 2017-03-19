using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace A1___Website_UI.AdminPages
{
    public partial class UserEdit : System.Web.UI.Page
    {
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*if(HttpContext.Current.User.Identity.Name != "admin.dg.com")
                {
                    if(HttpContext.Current.User.Identity.Name == "")
                    {
                        Response.Redirect("/login.aspx");
                    }
                    if(Request.UrlReferrer == null)
                    {
                        Response.Redirect("/default.aspx");
                    }
                    else
                    {
                        
                        Response.Redirect(Request.UrlReferrer.AbsoluteUri);
                    }
                }*/
                if (HttpContext.Current.User.Identity.Name != "admin@dg.com")
                {
                    string returnUrl = "~/SearchMenu.aspx";

                    // check if it exists, if not then redirect to default page
                    if (!(returnUrl == null))
                    Response.Redirect(returnUrl);
                }
                UserTB.Text = Request.QueryString["User"];
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
            conn.Close();
        }

        protected void ButtonEdit_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/AdminPages/UserEdit.aspx?User=" + rowIndex + "");
            }
        }

        protected void ButtonDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                DialogResult result = MessageBox.Show("Are you sure you want to perminantly delete this record?", "Delete Record?",
                                                   MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
                if (result == DialogResult.Yes)
                {

                    //Response.Redirect("~/AdminPages/UserEdit.aspx?User=" + rowIndex + "");
                    var conn = new MySqlConnection(strcon);
                    conn.Open();

                    string getUserPassword = @"DELETE
                                    FROM Users
                                    WHERE UserId =" + rowIndex;

                    var cmd = new MySqlCommand(getUserPassword, conn);

                    MySqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {

                    }
                    Response.Redirect("~/AdminPages/Users.aspx");
                }
                
            }
        }
    }
}