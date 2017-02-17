using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace A1___Website_UI
{
    public partial class Register : System.Web.UI.Page
    {
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterUser(object sender, EventArgs e)
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();

            string getUserPassword = @"SELECT 
                                    Email,
                                    Active
                                    FROM Users
                                    WHERE Email ='" + UserEmail.Text +
                                     "' AND Password = '" + UserPass.Text + "'";

            var cmd = new MySqlCommand(getUserPassword, conn);

            MySqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Boolean active = false;
                if (reader.GetString(reader.GetOrdinal("Active")) == "1")
                {
                    active = true;
                }




                if (active)
                {
                    Msg.Text = "User already exists";
                }
                else
                {
                    Msg.Text = "User account not activated yet please contact your administrator";
                }
                conn.Close();

            }
            else
            {
                if(UserPass.Text == UserPass2.Text)
                {
                    string AddUsername = "INSERT INTO Users (UserId, Email, Password, Active) VALUES (NULL, '" + UserEmail.Text + "', '" + UserPass.Text + "',0)";
                    var cmd2 = new MySqlCommand(AddUsername, conn);
                    reader.Close();
                    MySqlDataReader reader2 = cmd2.ExecuteReader();
                    if (reader2.Read())
                    {

                    }
                    conn.Close();
                    MessageBox.Show("User account created, please wait for the administrator to activate your account");
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    Msg.Text = "Passwords don't match";
                    conn.Close();
                }
                
            }
        }
       

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}