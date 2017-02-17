using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1___Website_UI
{
    public partial class Login1 : System.Web.UI.Page
    {
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void validateUser(object sender, EventArgs e)
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
                if(reader.GetString(reader.GetOrdinal("Email")) == "admin@dg.com")
                {
                    active = true;
                }
                if(reader.GetString(reader.GetOrdinal("Active")) == "1")
                {
                    active = true;
                }




                if (active)
                {
                    FormsAuthentication.RedirectFromLoginPage
                    (UserEmail.Text, false);
                }
                else
                {
                    Msg.Text = "User account not activated yet please contact your administrator";
                }
            }
            else
            {
                Msg.Text = "Invalid credentials. Please try again.";
            }
            conn.Close();
        }
    }
}