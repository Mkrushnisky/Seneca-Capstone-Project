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
using System.Data;

namespace A1___Website_UI
{
    public partial class ContactAdd : System.Web.UI.Page
    {
        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                    }
                    else
                    {
                        Response.Redirect("~/SearchMenu.aspx");
                    }
                }
                //Loads data from database
                SupDisBind();
            }
        }

        //Database connection for Supplier information to bind it to the supplier dropdown list
        protected void SupDisBind()
        {
            var dict = new Dictionary<object, object>();
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
                            
                            while(reader.Read())
                            {
                                dict.Add(reader["SupId"], reader ["SName"]);
                            }
                            

                        }
                    }
                }
                string Query2 = "SELECT Distributor.* FROM Distributor";
                using (var cmd = new MySqlCommand(Query2, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                dict.Add(reader["DisId"], reader["DisName"]);
                            }
                            
                        }
                    }
                }
            }
            if (dict.Count != 0)
            {
                DropDownList1.DataSource = dict;
                DropDownList1.DataTextField = "Value";
                DropDownList1.DataValueField = "Key";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
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
        //Save button.  INSERTS Address into database then uses that address to add the rest of the contact information after
        protected void Button1_Click(object sender, EventArgs e)
        {
            var conn = new MySqlConnection(strcon);
            // Adds Address to create Address Id
            conn.Open();
            string AddAddress = "INSERT INTO Address (AddressId, Street, City, Province, PostalCode, Country) VALUES ( NULL, '" + CStreetTB.Text + "', '" + CCityTB.Text + "', '" + CProvinceDDL.SelectedItem + "', '" + CPostalCodeTB.Text + "', '" + CCountryDDL.SelectedItem.Text + "')";
            var cmd = new MySqlCommand(AddAddress, conn);
            MySqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            }
            conn.Close();

            //Get Address Id to put into Contact
            conn.Open();
            string getAId = "SELECT AddressId FROM Address ORDER BY AddressId DESC LIMIT 1";
            cmd = new MySqlCommand(getAId, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                CAddressid.Text = reader.GetString(0);
            }
            conn.Close();

            GetSupNum.Text = DropDownList1.SelectedValue;
            //Add Contact
            conn.Open();
            string AddContact = "INSERT INTO Contact (ContactId, SupId, FName, LName, AddressId, Email, Work, Main, Cell) VALUES ( NULL, '" + GetSupNum.Text + "', '" + FNameTB.Text + "', '" + LNameTB.Text + "', '" + CAddressid.Text + "', '" + CEmailTB.Text + "', '" + WorkTB.Text + "', '0', '" + CellTB.Text + "')";
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