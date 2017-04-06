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
                loadContacts();
            }
            Page.MaintainScrollPositionOnPostBack = true;

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

        //================================================================================================================
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
            if (result == DialogResult.Yes)
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

        //================================================================================================================
        //Load Contact Gridview
        protected void loadContacts()
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string getdata = "SELECT * FROM Contact INNER JOIN Address ON Contact.AddressId = Address.AddressId WHERE SupId = '" + SupIdHF.Value + "'";
            var cmd = new MySqlCommand(getdata, conn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (ds.Tables[0].Rows.Count > 0)
            {
                ContactGV.DataSource = ds;
                ContactGV.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                ContactGV.DataSource = ds;
                ContactGV.DataBind();
                int columncount = ContactGV.Rows[0].Cells.Count;
                lblmsg.Text = " No contacts found !!!";
            }
        }

        protected void ContactGV_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
        }

        protected void ContactGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ContactId = ContactGV.DataKeys[e.RowIndex].Values["ContactId"].ToString();
            string addId = null;
            var conn = new MySqlConnection(strcon);

            //Get AddressId from the Contact we are deleting
            conn.Open();
            string selectaddress = "SELECT AddressId FROM Contact WHERE ContactId = '" + ContactId + "'";
            var cmd = new MySqlCommand(selectaddress, conn);
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                addId = reader.GetString(reader.GetOrdinal("AddressId"));
            }
            conn.Close();

            //Delete Address of Contact we are deleting
            conn.Open();
            string deleteaddress = "DELETE FROM Address WHERE AddressId = '" + addId + "'";
            cmd = new MySqlCommand(deleteaddress, conn);
            cmd.ExecuteNonQuery();
            conn.Close();


            //Delete Contact
            conn.Open();
            string deletecontact = "DELETE FROM Contact WHERE ContactId = '" + ContactId + "'";
            cmd = new MySqlCommand(deletecontact, conn);
            cmd.ExecuteNonQuery();
            conn.Close();


            ContactGV.EditIndex = -1;
            loadContacts();
        }

        protected void ContactGV_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }

        protected void ContactGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void ContactGV_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        // When Edit button in Gridview is clicked.  Populates Edit fields in Edit Contacts area and makes it visible
        protected void ButtonEdit_Command(object sender, CommandEventArgs e)
        {
            CAddButton.Visible = false;
            AddLB.Visible = false;
            EditLB.Visible = true;
            ContactTB.Visible = true;
            CUpdateButton.Visible = true;
            var conn = new MySqlConnection(strcon);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            string rowId = Convert.ToString(e.CommandArgument);
            string selectcontact = "SELECT * FROM Contact INNER JOIN Address ON Contact.AddressId = Address.AddressId WHERE ContactId = '" + rowId + "'";
            conn.Open();
            var cmd = new MySqlCommand(selectcontact, conn);
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                CtId.Text = reader.GetString(reader.GetOrdinal("ContactId"));
                FNameTB.Text = reader.GetString(reader.GetOrdinal("FName"));
                LNameTB.Text = reader.GetString(reader.GetOrdinal("LName"));
                CStreetTB.Text = reader.GetString(reader.GetOrdinal("Street"));
                CCityTB.Text = reader.GetString(reader.GetOrdinal("City"));
                CCountryDDL.SelectedValue = CCountryDDL.Items.FindByText(reader.GetString(reader.GetOrdinal("Country"))).Value;
                if (reader.GetString(reader.GetOrdinal("Country")) == "Canada" || reader.GetString(reader.GetOrdinal("Country")) == "United States")
                {
                    CProvinceDDL.Enabled = true;
                    CProvince(sender,e);
                    CProvinceDDL.SelectedValue = CProvinceDDL.Items.FindByText(reader.GetString(reader.GetOrdinal("Province"))).Value;
                }
                CPostalCodeTB.Text = reader.GetString(reader.GetOrdinal("PostalCode"));
                CAddressid.Text = reader.GetString(reader.GetOrdinal("AddressId"));
                CEmailTB.Text = reader.GetString(reader.GetOrdinal("Email"));
                WorkTB.Text = reader.GetString(reader.GetOrdinal("Work"));
                CellTB.Text = reader.GetString(reader.GetOrdinal("Cell"));
            }
            conn.Close();

        }

        //Database connection for Province/State information to bind it to the ProvinceState Dropdownlist for Contact
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

        //When Add Button in the Footer of the gridview is clicked.  Makes Add Contact Section visible.  
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            CUpdateButton.Visible = false;
            EditLB.Visible = false;
            AddLB.Visible = true;
            ContactTB.Visible = true;
            CAddButton.Visible = true;
            FNameTB.Text = String.Empty;
            LNameTB.Text = String.Empty;
            CStreetTB.Text = String.Empty;
            CCityTB.Text = String.Empty;
            CCountryDDL.SelectedIndex = 0;
            CProvinceDDL.Items.Clear();
            CPostalCodeTB.Text = String.Empty;
            CEmailTB.Text = String.Empty;
            WorkTB.Text = String.Empty;
            CellTB.Text = String.Empty;
        }

        protected void CCountryDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CCountryDDL.SelectedItem.Text == "Canada" || CCountryDDL.SelectedItem.Text == "United States")
            {
                CProvince(sender, e);
                CProvinceDDL.Enabled = true;
                CProvinceDDL.Focus();
            }
            else
            {
                CProvinceDDL.Enabled = false;
                CProvinceDDL.Items.Clear();
                CProvinceDDL.Focus();
            }
        }

        //When Update button is pressed.  Updates Contact and Address record
        protected void CUpdateButton_Click(object sender, EventArgs e)
        {

            var conn = new MySqlConnection(strcon);
            conn.Open();
            string updateContact = "UPDATE Contact SET FName = '" + FNameTB.Text + "',LName = '" + LNameTB.Text + "',Email = '" + CEmailTB.Text + "',Work = '" + WorkTB.Text + "',Cell = '" + CellTB.Text + "' WHERE ContactId = '" + CtId.Text + "'";
            var cmd = new MySqlCommand(updateContact, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            conn.Open();
            string updateaddress = "UPDATE  Address SET Street = '" + CStreetTB.Text + "', City = '" + CCityTB.Text + "', Province = '" + CProvinceDDL.SelectedItem.Text + "', PostalCode = '" + CPostalCodeTB.Text + "', Country = '" + CCountryDDL.SelectedItem.Text + "' WHERE Address.AddressId = '" + CAddressid.Text + "'";
            cmd = new MySqlCommand(updateaddress, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();
            ContactTB.Visible = false;
            CUpdateButton.Visible = false;
            EditLB.Visible = false;
            loadContacts();
        }

        //Wen Add button is pressed.  Inserts new Address, retrieves that Id and Inserts new Contact.
        protected void CAddButton_Click(object sender, EventArgs e)
        {

            var conn = new MySqlConnection(strcon);
            //Add Contact Address
            conn.Open();
            string AddCAddress = "INSERT INTO Address (AddressId, Street, City, Province, PostalCode, Country) VALUES ( NULL, '" + CStreetTB.Text + "', '" + CCityTB.Text + "', '" + CProvinceDDL.SelectedItem + "', '" + CPostalCodeTB.Text + "', '" + CCountryDDL.SelectedItem.Text + "')";
            var cmd = new MySqlCommand(AddCAddress, conn);
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            conn.Open();
            string getCAId = "SELECT AddressId FROM Address ORDER BY AddressId DESC LIMIT 1";
            cmd = new MySqlCommand(getCAId, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                CAddressid.Text = reader.GetString(0);
            }
            conn.Close();

            //Add Contact
            conn.Open();
            string AddContact = "INSERT INTO Contact (ContactId, SupId, FName, LName, AddressId, Email, Work, Main, Cell) VALUES ( NULL, '" + GetSupNum.Text + "', '" + FNameTB.Text + "', '" + LNameTB.Text + "', '" + CAddressid.Text + "', '" + CEmailTB.Text + "', '" + WorkTB.Text + "', '0', '" + CellTB.Text + "')";
            cmd = new MySqlCommand(AddContact, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();


            ContactTB.Visible = false;
            CAddButton.Visible = false;
            AddLB.Visible = false;
            loadContacts();
        }

        //When Cancel button is clicked.  Makes Add/Edit Contact section invisible and empties all textbixes
        protected void CCancelButton_Click(object sender, EventArgs e)
        {
            CUpdateButton.Visible = false;
            EditLB.Visible = false;
            AddLB.Visible = false;
            CAddButton.Visible = false;
            ContactTB.Visible = false;
            FNameTB.Text = String.Empty;
            LNameTB.Text = String.Empty;
            CStreetTB.Text = String.Empty;
            CCityTB.Text = String.Empty;
            CCountryDDL.SelectedIndex = 0;
            CProvinceDDL.Text = String.Empty;
            CPostalCodeTB.Text = String.Empty;
            CEmailTB.Text = String.Empty;
            WorkTB.Text = String.Empty;
            CellTB.Text = String.Empty;
        }
    }
}