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
    public partial class WebForm1 : System.Web.UI.Page
    {
        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Loads data from database
                SupplierBind();
                CategoryBind();
                SubCategoryBind(sender, e);
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                DropDownList1.Enabled = true;
                DropDownList1.Visible = true;
            }
               
            else if (CheckBox1.Checked == false)
            {
                DropDownList1.Enabled = false;
                DropDownList1.Visible = false;
                DropDownList1.SelectedIndex = 0;
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

        //Database connection for Province/State information to bind it to the ProvinceState Dropdownlist in add Supplier
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

        //Database connection for Province/State information to bind it to the ProvinceState Dropdownlist in Add Contact
        protected void CProvince(object sender, EventArgs e)
        {
            string country = null;
            if (CCountryDDL.SelectedItem.Text == "Canada")
            {
                country = "C";
            }
            else if (CCountryDDL.SelectedItem.Text == "United States")
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
                            CProvinceDDL.DataSource = reader;
                            CProvinceDDL.DataValueField = "StateName";
                            CProvinceDDL.DataTextField = "StateName";
                            CProvinceDDL.DataBind();
                            if (country == "C")
                            {
                                CProvinceDDL.Items.Insert(0, new ListItem("Province", "NA"));
                            }
                            else if (country == "US")
                            {
                                CProvinceDDL.Items.Insert(0, new ListItem("State", "NA"));
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
        //Save button.  INSERTS base Supplier information to create Id, calls that new Id, then INSERTS the rest of the data based on that Id.
        protected void Button1_Click(object sender, EventArgs e)
        {
            var conn = new MySqlConnection(strcon);
            // Adds Address to create Address Id
            conn.Open();
            string AddAddress = "INSERT INTO Address (AddressId, Street, City, Province, PostalCode, Country) VALUES ( NULL, '" + StreetTB.Text + "', '" + CityTB.Text + "', '" + ProvinceDDL.SelectedItem + "', '" + PostalCodeTB.Text + "', '" + CountryDDL.SelectedItem.Text + "')";
            var cmd = new MySqlCommand(AddAddress, conn);
            MySqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            //Get Address Id to put into Supplier
            conn.Open();
            string getAId = "SELECT AddressId FROM Address ORDER BY AddressId DESC LIMIT 1";
            cmd = new MySqlCommand(getAId, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Addressid.Text = reader.GetString(0);
            }
            conn.Close();

            if (CheckBox1.Checked == true)
            {
                string AddDistributor = "INSERT INTO Distributor (DisId, SupId, DisName, AddressId) VALUES (NULL, '" + DropDownList1.SelectedValue + "', '" + TextBox1.Text + "', '" + Addressid.Text + "')";
                cmd = new MySqlCommand(AddDistributor, conn);
                conn.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                }
                conn.Close();

                //Get new Distributor Id to assign Sub-Categories to it
                conn.Open();
                string getId = "SELECT DisId FROM Distributor ORDER BY DisId DESC LIMIT 1";
                cmd = new MySqlCommand(getId, conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    GetSupNum.Text = reader.GetString(0);
                }
                conn.Close();
            }


            else
            {
                // Insert Base Supplier Data to create Id for Supplier
                string AddSupplier = "INSERT INTO Supplier (SupId, SName, AddressId) VALUES (NULL, '" + TextBox1.Text + "', '" + Addressid.Text + "')";
                cmd = new MySqlCommand(AddSupplier, conn);
                conn.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                }
                conn.Close();
                //Get new Supplier Id to assign Sub-Categories to it
                conn.Open();
                string getId = "SELECT SupId FROM Supplier ORDER BY SupId DESC LIMIT 1";
                cmd = new MySqlCommand(getId, conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    GetSupNum.Text = reader.GetString(0);
                }
                conn.Close();
            }
            
            //Adds Sub-Categories to Supplier

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

            //Add Contact Address
            conn.Open();
            string AddCAddress = "INSERT INTO Address (AddressId, Street, City, Province, PostalCode, Country) VALUES ( NULL, '" + CStreetTB.Text + "', '" + CCityTB.Text + "', '" + CProvinceDDL.SelectedItem + "', '" + CPostalCodeTB.Text + "', '" + CCountryDDL.SelectedItem.Text + "')";
            cmd = new MySqlCommand(AddCAddress, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            //Get Address Id to put into Contact
            conn.Open();
            string getCAId = "SELECT AddressId FROM Address ORDER BY AddressId DESC LIMIT 1";
            cmd = new MySqlCommand(getCAId, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Addressid.Text = reader.GetString(0);
            }
            conn.Close();

            //Add Contact
            conn.Open();
            string AddContact = "INSERT INTO Contact (ContactId, SupId, FName, LName, AddressId, Email, Work, Main, Cell) VALUES ( NULL, '" + GetSupNum.Text + "', '" + FNameTB.Text + "', '" + LNameTB.Text + "', '" + Addressid.Text + "', '" + CEmailTB.Text + "', '" + WorkTB.Text + "', '1', '" + CellTB.Text + "')";
            cmd = new MySqlCommand(AddContact, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            MessageBox.Show("Data Saved");
            Response.Redirect("~/SearchMenu.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchMenu.aspx");
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

        protected void CCountryDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CCountryDDL.SelectedItem.Text == "Canada" || CCountryDDL.SelectedItem.Text == "United States")
            {
                CProvince(sender, e);
                CProvinceDDL.Enabled = true;
            }
            else
            {
                CProvinceDDL.Enabled = false;
                CProvinceDDL.Items.Clear();
            }
        }
    }
}