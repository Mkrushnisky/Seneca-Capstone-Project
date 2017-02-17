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
    public partial class SupplierEdit : System.Web.UI.Page
    {
        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SupIdHF.Value = Request.QueryString["supplier"];
                SupplierBind();
                CategoryBind();
                SubCategoryBind(sender, e);
                edit(sender, e);
            }
            
        }

        //Database connection for Supplier information to bind it to the supplier dropdown list
        protected void SupplierBind()
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "SELECT Supplier.* FROM Supplier";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            SupplierDDL.DataSource = reader;
                            SupplierDDL.DataValueField = "SupId";
                            SupplierDDL.DataTextField = "SName";
                            SupplierDDL.DataBind();
                            SupplierDDL.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
                        }
                    }
                }
            }
        }

        //Database connection for Province/State information to bind it to the ProvinceState Dropdownlist
        protected void Province(object sender, EventArgs e)
        {
            string country = null;
            if (CountryDDL.SelectedItem.Text == "Canada")
            {
                country = "C";
            }
            else if (CountryDDL.SelectedItem.Text == "United States")
            {
                country = "US";
            }
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "SELECT * FROM ProvinceState WHERE SCountry = '" + country + "'";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            ProvinceDDL.DataSource = reader;
                            ProvinceDDL.DataValueField = "StateName";
                            ProvinceDDL.DataTextField = "StateName";
                            ProvinceDDL.DataBind();
                            if (country == "C")
                            {
                                ProvinceDDL.Items.Insert(0, new ListItem("Province", "NA"));
                            }
                            else if (country == "US")
                            {
                                ProvinceDDL.Items.Insert(0, new ListItem("State", "NA"));
                            }

                        }
                    }
                }
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
                            CategoryDropDown.DataSource = reader;
                            CategoryDropDown.DataValueField = "CatId";
                            CategoryDropDown.DataTextField = "CName";
                            CategoryDropDown.DataBind();
                        }
                    }
                }
            }
        }

        // Database connection for Sub-Category information to bind it to the Sub-Category 
        // listbox, limited by the selection in the Category Dropdownlist
        protected void SubCategoryBind(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "SELECT * FROM SubCategory WHERE CatId = '" + CategoryDropDown.SelectedValue + "'";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            SubCategoryListBox.DataSource = reader;
                            SubCategoryListBox.DataValueField = "SubCatId";
                            SubCategoryListBox.DataTextField = "SCName";
                            SubCategoryListBox.DataBind();
                        }
                    }
                }
            }
        }

        //================================================================================================================
        //Populates the form for editing
        protected void edit(object sender, EventArgs e)
        {
            //Populates the Supplier and Address portion of the form
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string getSupAdd = @"SELECT 
                                Supplier.SupId, 
                                Supplier.SName, 
                                Address.AddressId, 
                                Address.Street, 
                                Address.City, 
                                Address.Province, 
                                Address.PostalCode, 
                                Address.Country
                            FROM 
                                Supplier INNER JOIN 
                                    Address ON Supplier.AddressId = Address.AddressId
                            WHERE Supplier.SupId = '" + SupIdHF.Value + "'";
            var cmd = new MySqlCommand(getSupAdd, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                SupplierNameTB.Text = reader.GetString(reader.GetOrdinal("SName"));
                StreetTB.Text = reader.GetString(reader.GetOrdinal("Street"));
                CityTB.Text = reader.GetString(reader.GetOrdinal("City"));
                CountryDDL.Items.FindByText(reader.GetString(reader.GetOrdinal("Country"))).Selected = true;
                if (reader.GetString(reader.GetOrdinal("Country")) == "Canada" || reader.GetString(reader.GetOrdinal("Country")) == "United States")
                {
                    ProvinceDDL.Enabled = true;
                    Province(sender, e);
                    ProvinceDDL.Items.FindByText(reader.GetString(reader.GetOrdinal("Province"))).Selected = true;
                }
                PostalCodeTB.Text = reader.GetString(reader.GetOrdinal("PostalCode"));
                Addressid.Text = reader.GetString(reader.GetOrdinal("AddressId"));
                GetSupNum.Text = reader.GetString(reader.GetOrdinal("SupId"));
            }
            conn.Close();

            //populates the already chosen Sub-Categories portion of the form
            using (conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string getSubCat = @"SELECT        
                                    *
                                FROM            
                                    SubCategory
                                        INNER JOIN
                                            SubCatSupplier ON SubCategory.SubCatId = SubCatSupplier.SubCatId
                                WHERE        
                                    (SubCatSupplier.SupId = '" + GetSupNum.Text + "')";
                using (cmd = new MySqlCommand(getSubCat, conn))
                {
                    using (reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            ToAddListBox.DataSource = reader;
                            ToAddListBox.DataValueField = "SubCatId";
                            ToAddListBox.DataTextField = "SCName";
                            ToAddListBox.DataBind();
                            
                        }
                    }
                }
            }
            conn.Open();
            string getSubCatSupplierid = @"Select * FROM SubCatSupplier WHERE SupId = '" + GetSupNum.Text + "'";
            cmd = new MySqlCommand(getSubCatSupplierid, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                subcatlistboxcount.Items.Add(reader.GetString(reader.GetOrdinal("SCSId")));
            }
            conn.Close();
        }

        //=========================================================================================================
        //Update Command
        //Update Supplier
        protected void update(object sender, EventArgs e)
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string updateSupplier = "UPDATE Supplier SET SName = '" + SupplierNameTB.Text + "' WHERE Supplier.SupId = '" + GetSupNum.Text + "'";
            var cmd = new MySqlCommand(updateSupplier, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            //Update Address Tables
            conn.Open();
            string updateAddress = "UPDATE  Address SET Street = '" + StreetTB.Text + "', City = '" + CityTB.Text + "', Province = '" + ProvinceDDL.SelectedItem.Text + "', PostalCode = '" + PostalCodeTB.Text + "', Country = '" + CountryDDL.SelectedItem.Text + "' WHERE Address.AddressId = '" + Addressid.Text + "'";
            cmd = new MySqlCommand(updateAddress, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            //Update SubCatSupplier Table

            //Need to delete existing records from table as they might have been changed in the ToAddListBox
            for (int i = 0; i < subcatlistboxcount.Items.Count; i++)
            {
                conn.Open();
                string deleteSubCatSup = @"DELETE FROM SubCatSupplier WHERE SubCatSupplier.SCSId = '" + subcatlistboxcount.Items[i] + "'";
                cmd = new MySqlCommand(deleteSubCatSup, conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                }
                conn.Close();
            }

            //Add new Sub-Categories from ToAddListBox to SubCatSupplier Table
            for (int i = 0; i < ToAddListBox.Items.Count; i++)
            {
                if (ToAddListBox.Items[i].Selected == true || ToAddListBox.Items.Count > 0)
                {
                    conn.Open();
                    string AddSubCategory = "INSERT INTO SubCatSupplier (SCSId, SubCatId, SupId) VALUES (NULL, '" + ToAddListBox.Items[i].Value + "', '" + GetSupNum.Text + "')";
                    cmd = new MySqlCommand(AddSubCategory, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();
                }
            }

        }


        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Are you sure you want to Update?", "Update Record?",
                                                   MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                update(sender, e);
                Response.Redirect("~/SearchMenu.aspx");
            }  
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Are you sure you want to Cancel?  Your progress will be Lost.", "Cancel Changes?",
                                                   MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(result == DialogResult.Yes)
            {
                Response.Redirect("~/SearchMenu.aspx");
            }
        }

        protected void CategoryDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategoryBind(sender, e);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (SubCategoryListBox.SelectedItem != null)
            {
                ToAddListBox.Items.Add(SubCategoryListBox.SelectedItem);
            }
        }

        protected void CountryDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CountryDDL.SelectedItem.Text == "Canada" || CountryDDL.SelectedItem.Text == "United States")
            {
                Province(sender, e);
                ProvinceDDL.Enabled = true;
            }
            else
            {
                ProvinceDDL.Enabled = false;
                ProvinceDDL.Items.Clear();
            }
        }

    }
}