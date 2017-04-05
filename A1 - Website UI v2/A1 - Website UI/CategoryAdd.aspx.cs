using System;
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
    public partial class CategoryAdd : System.Web.UI.Page
    {

        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveBT_Click(object sender, EventArgs e)
        {
            var conn = new MySqlConnection(strcon);
            // Adds Category Name to Category Table
            conn.Open();
            string GetCat = "SELECT CName FROM Category";
            var cmd = new MySqlCommand(GetCat, conn);
            MySqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (CategoryTB.Text == reader.GetString(reader.GetOrdinal("CName"))){
                    DialogResult result = MessageBox.Show("Category Already Exists", "Record Already Exists",
                                                   MessageBoxButtons.RetryCancel, MessageBoxIcon.Error);
                    if (result == DialogResult.Cancel)
                    {
                        conn.Close();
                        Response.Redirect("~/SearchMenu.aspx");   
                    }
                    else if(result == DialogResult.Retry)
                    {
                        conn.Close();
                        Response.Redirect("~/CategoryAdd.aspx");
                    }
                }
                
            }
            conn.Close();
            Add();
            DialogResult add = MessageBox.Show("Category Added.  Add Sub-Categories Now?", "Go to Sub-Category Add?",
                                                   MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (add == DialogResult.Yes)
            {
                Response.Redirect("~/SubCategoryAdd.aspx?category=" + TextBox1.Text + "");
            }
            Response.Redirect("~/SearchMenu.aspx");
        }

        protected void Add()
        {
            var conn = new MySqlConnection(strcon);
            // Adds Category Name to Category Table
            conn.Open();
            string AddCat = "INSERT INTO Category (CatId, CName) VALUES ( NULL, '" + CategoryTB.Text + "')";
            var cmd = new MySqlCommand(AddCat, conn);
            MySqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            conn.Open();
            string getCat = "SELECT CatId FROM Category ORDER BY CatId DESC LIMIT 1";
            cmd = new MySqlCommand(getCat, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                TextBox1.Text = reader.GetString(0);
            }
            conn.Close();

        }

        protected void CancelBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchMenu.aspx");
        }
    }
}