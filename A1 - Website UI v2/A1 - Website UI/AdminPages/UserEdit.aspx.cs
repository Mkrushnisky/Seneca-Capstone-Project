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
    public partial class UserEdit1 : System.Web.UI.Page
    {
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
        private int activeStateint;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserIdHF.Value = Request.QueryString["User"];
                loadUser();
            }
        }

        protected void loadUser()
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string getdata = "SELECT * FROM Users WHERE UserId = '" + UserIdHF.Value + "'";
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

        protected void ButtonActive_Command(object sender, CommandEventArgs e)
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            //UPDATE `Users` SET `Active`= 1 - Active WHERE `UserId` = 6 
            string updateUser = "UPDATE Users SET Active = 1 - Active WHERE UserId = " + UserIdHF.Value;
            var cmd = new MySqlCommand(updateUser, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();
            Response.Redirect("~/AdminPages/UserEdit.aspx?User=" + UserIdHF.Value);
        }
        protected void update()
        {
           
        }

        protected int notActiveState()
        {
            int tempState;
            if (activeStateint == 0)
            {
               tempState= 1;
            }
            else
            {
                tempState = 0;
            }
            return tempState;
        }

        protected void Done_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("~/AdminPages/Users.aspx");
        }
    }
}