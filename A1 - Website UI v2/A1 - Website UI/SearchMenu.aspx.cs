using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace A1___Website_UI
{
    public partial class SearchMenu : System.Web.UI.Page
    {
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoryBind();
                
            }
        }

        protected void CategoryBind()
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                using (var cmd = new MySqlCommand("SELECT * FROM Category", conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DropDownCategory.DataSource = reader;
                            DropDownCategory.DataValueField = "CatId";
                            DropDownCategory.DataTextField = "CName";
                            DropDownCategory.DataBind();
                            DropDownCategory.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
                        }
                    }
                }
            }
        }

        protected void SubCategoryBind(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "SELECT * FROM SubCategory WHERE CatId ='" + DropDownCategory.SelectedValue + "'";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DropDownSubCategory.DataSource = reader;
                            DropDownSubCategory.DataValueField = "SubCatId";
                            DropDownSubCategory.DataTextField = "SCName";
                            DropDownSubCategory.DataBind();
                            DropDownSubCategory.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
                        }
                    }
                }
            }
        }

        protected void SupplierBind(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "SELECT Supplier.* FROM Supplier INNER JOIN SubCatSupplier ON Supplier.SupId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId ='" + DropDownSubCategory.SelectedValue + "' AND SubCatSupplier.SupId = Supplier.SupId";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DropDownSupplier.DataSource = reader;
                            DropDownSupplier.DataValueField = "SupId";
                            DropDownSupplier.DataTextField = "SName";
                            DropDownSupplier.DataBind();
                            DropDownSupplier.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SupplierResults.aspx?supplier=" + DropDownSupplier.SelectedValue + "");
        }

        protected void DropDownCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategoryBind(sender, e);
        }

        protected void DropDownSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SupplierBind(sender, e);
        }

        protected void DropDownSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownSupplier.SelectedItem.Text == "--- Choose One ---")
            {
                Button1.Enabled = false;
            }
            else
            {
                Button1.Enabled = true;
            }
        }
    }
}