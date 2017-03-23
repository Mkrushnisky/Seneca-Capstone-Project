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
    public partial class SubCategoryAdd : System.Web.UI.Page
    {

        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CatIDTB.Text = Request.QueryString["category"];
                CategoryBind();
            }
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
                            CategoryDDL.DataSource = reader;
                            CategoryDDL.DataValueField = "CatId";
                            CategoryDDL.DataTextField = "CName";
                            CategoryDDL.DataBind();
                            if(CatIDTB.Text == "")
                            {
                                CategoryDDL.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
                            }
                            else
                            {
                                CategoryDDL.Items.FindByText(reader.GetString(reader.GetOrdinal("CName"))).Selected = true;
                            }
                            
                        }
                    }
                }
            }
        }

        //Load Contact Gridview
        protected void loadSubCatGV()
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string getdata = "SELECT * FROM SubCategory WHERE CatId = '" + CategoryDDL.SelectedValue + "'";
            var cmd = new MySqlCommand(getdata, conn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (ds.Tables[0].Rows.Count > 0)
            {
                SubCatGV.DataSource = ds;
                SubCatGV.DataBind();
            }
            else
            {
                SubCatGV.DataSource = ds;
                SubCatGV.DataBind();
            }
        }


        protected void ToAddIMG_Click(object sender, ImageClickEventArgs e)
        {
            var conn = new MySqlConnection(strcon);
            // Adds Sub-Category to create Address Id
            conn.Open();
            string AddAddress = "INSERT INTO SubCategory (SubCatId, CatId, SCName) VALUES (NULL, '" + CategoryDDL.SelectedValue + "', '" + SubCategoryTB.Text + "')";
            var cmd = new MySqlCommand(AddAddress, conn);
            MySqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            SubCategoryTB.Text = "";
            loadSubCatGV();
        }

        protected void CategoryDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadSubCatGV();
        }

        protected void SubCatGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SubCatGV.PageIndex = e.NewPageIndex;
            loadSubCatGV();
        }

        protected void SubCatGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void ButtonDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DialogResult result = MessageBox.Show("Are you sure you want to Delete this Record?", "Delete Record?",
                                                   MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
                if (result == DialogResult.Yes)
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    var conn = new MySqlConnection(strcon);
                    string deleteSubCats = "DELETE FROM SubCatSupplier WHERE SubCatId = '" + rowIndex + "'";
                    conn.Open();
                    var cmd = new MySqlCommand(deleteSubCats, conn);
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();

                    conn.Open();
                    string deleteSupplier = "DELETE FROM SubCategory WHERE SubCatId = '" + rowIndex + "'";
                    cmd = new MySqlCommand(deleteSupplier, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();
                    loadSubCatGV();
                }
            }
        }
    }
}