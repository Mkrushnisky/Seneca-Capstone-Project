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
                            DropDownList2.DataSource = reader;
                            DropDownList2.DataValueField = "CatId";
                            DropDownList2.DataTextField = "CName";
                            DropDownList2.DataBind();
                            DropDownList2.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
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
                string Query = "SELECT * FROM SubCategory WHERE CatId ='" + DropDownList2.SelectedValue + "'";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DropDownList3.DataSource = reader;
                            DropDownList3.DataValueField = "SubCatId";
                            DropDownList3.DataTextField = "SCName";
                            DropDownList3.DataBind();
                            DropDownList3.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
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
                string Query = "SELECT Supplier.* FROM Supplier INNER JOIN SubCatSupplier ON Supplier.SupId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId ='" + DropDownList3.SelectedValue + "' AND SubCatSupplier.SupId = Supplier.SupId";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DropDownList1.DataSource = reader;
                            DropDownList1.DataValueField = "SupId";
                            DropDownList1.DataTextField = "SName";
                            DropDownList1.DataBind();
                            DropDownList1.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SupplierResults.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategoryBind(sender, e);
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            SupplierBind(sender, e);
        }
    }
}