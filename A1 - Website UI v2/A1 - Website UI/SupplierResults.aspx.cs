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
    public partial class search : System.Web.UI.Page
    {
        //Connection string from WebConfig
        private String strcon = ConfigurationManager.ConnectionStrings["btsdatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                supplierTB.Text = Request.QueryString["supplier"];
                loadSuppliers();
            }
        }

        protected void loadSuppliers()
        {
            var conn = new MySqlConnection(strcon);
            conn.Open();
            string getdata = "SELECT * FROM Supplier INNER JOIN Contact ON Supplier.SupId = Contact.SupId WHERE Supplier.SupId = '" + supplierTB.Text + "' AND Main = '1'";
            var cmd = new MySqlCommand(getdata, conn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (ds.Tables[0].Rows.Count > 0)
            {
                SupplierGridView.DataSource = ds;
                SupplierGridView.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                SupplierGridView.DataSource = ds;
                SupplierGridView.DataBind();
                int columncount = SupplierGridView.Rows[0].Cells.Count;
                lblmsg.Text = " No data found !!!";
            }
        }

        protected void SupplierGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void SupplierGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }

        protected void ButtonEdit_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/SupplierEdit.aspx?supplier=" + rowIndex + "");
            }
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
                    string deleteSubCats = "DELETE FROM SubCatSupplier WHERE SupId = '" + rowIndex + "'";
                    conn.Open();
                    var cmd = new MySqlCommand(deleteSubCats, conn);
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();

                    conn.Open();
                    string deleteAddress = "DELETE FROM Address WHERE AddressId = (SELECT AddressId FROM Supplier WHERE SupId = '" + rowIndex + "')";
                    cmd = new MySqlCommand(deleteAddress, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();

                    conn.Open();
                    string selectContact = "SELECT AddressId FROM Contact WHERE SupId = '" + rowIndex + "'";
                    cmd = new MySqlCommand(selectContact, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        addLB.Items.Add(reader.GetString(reader.GetOrdinal("AddressId")));
                    }
                    conn.Close();

                    for (int i = 0; i < addLB.Items.Count; i++)
                    {
                        conn.Open();
                        string deleteContactAddress = "DELETE FROM Address WHERE AddressID ='" + addLB.Items[i] + "'";
                        cmd = new MySqlCommand(deleteContactAddress, conn);
                        reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                        }
                        conn.Close();
                    }


                    conn.Open();
                    string deleteContact = "DELETE FROM Contact WHERE SupId = '" + rowIndex + "'";
                    cmd = new MySqlCommand(deleteContact, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();

                    conn.Open();
                    string deleteSupplier = "DELETE FROM Supplier WHERE SupId = '" + rowIndex + "'";
                    cmd = new MySqlCommand(deleteSupplier, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();
                    loadSuppliers();
                }
            }
        }
    }
}