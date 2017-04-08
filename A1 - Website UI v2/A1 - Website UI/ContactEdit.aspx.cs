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
    public partial class ContactEdit : System.Web.UI.Page
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
                ContactIdHF.Value = Request.QueryString["contact"];
                ContactBind();
            }
        }
        protected void ContactBind()
        {
            var conn = new MySqlConnection(strcon);
            string selectcontact = "SELECT * FROM Contact INNER JOIN Address ON Contact.AddressId = Address.AddressId WHERE ContactId = '" + ContactIdHF.Value + "'";
            conn.Open();
            var cmd = new MySqlCommand(selectcontact, conn);
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                CtId.Value = reader.GetString(reader.GetOrdinal("ContactId"));
                FNameTB.Text = reader.GetString(reader.GetOrdinal("FName"));
                LNameTB.Text = reader.GetString(reader.GetOrdinal("LName"));
                CStreetTB.Text = reader.GetString(reader.GetOrdinal("Street"));
                CCityTB.Text = reader.GetString(reader.GetOrdinal("City"));
                CCountryDDL.SelectedValue = CCountryDDL.Items.FindByText(reader.GetString(reader.GetOrdinal("Country"))).Value;
                if (reader.GetString(reader.GetOrdinal("Country")) == "Canada" || reader.GetString(reader.GetOrdinal("Country")) == "United States")
                {
                    CProvinceDDL.Enabled = true;
                    CProvince();
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

        protected void CProvince()
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
            DialogResult result = MessageBox.Show("Are you sure you want to Update?", "Update Record?",
                                                   MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                update();
                Response.Redirect("~/SearchMenu.aspx");
            }
            
        }
        protected void update()
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string updateContact = "UPDATE Contact SET FName = '" + FNameTB.Text + "',LName = '" + LNameTB.Text + "',Email = '" + CEmailTB.Text + "',Work = '" + WorkTB.Text + "',Cell = '" + CellTB.Text + "' WHERE ContactId = '" + CtId.Value + "'";
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
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Are you sure you want to Cancel?  Your progress will be Lost.", "Cancel Changes?",
                                                   MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                Response.Redirect("~/SearchMenu.aspx");
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