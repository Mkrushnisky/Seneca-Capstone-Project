﻿using System;
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
using System.Windows.Forms;

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
                SubCategoryBind(sender, e);
                SupplierBind(sender, e);
                DistributorBind(sender, e);
                ContactBind(sender, e);
            }
            
        }

        protected void loadSuppliers()
        {
            var conn = new MySqlConnection(strcon);
            string getdata = "";

            if(DropDownContactName.SelectedIndex != 0)
            {
                getdata = "SELECT * FROM Supplier INNER JOIN Contact ON Supplier.SupId = Contact.SupId WHERE Contact.ContactId ='" + DropDownContactName.SelectedValue + "'";
            }
            else if(DropDownSubCategory.SelectedIndex != 0 && DropDownSupplier.SelectedIndex != 0)
            {
                getdata = "SELECT * FROM Supplier INNER JOIN Contact ON Supplier.SupId = Contact.SupId WHERE Supplier.SupId IN (SELECT Supplier.SupId FROM Supplier INNER JOIN SubCatSupplier ON Supplier.SupId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId ='" + DropDownSubCategory.SelectedValue + "' AND Supplier.SupId = '" + DropDownSupplier.SelectedValue + "' AND SubCatSupplier.SupId = Supplier.SupId) AND Contact.Main = 1";
            }
            else if(DropDownSupplier.SelectedIndex != 0)
            {
                getdata = "SELECT * FROM Supplier INNER JOIN Contact ON Supplier.SupId = Contact.SupId WHERE Supplier.SupId = '" + DropDownSupplier.SelectedValue + "'";
            }
            else
            {
                getdata = "SELECT * FROM Supplier INNER JOIN Contact ON Supplier.SupId = Contact.SupId WHERE Supplier.SupId IN (SELECT Supplier.SupId FROM Supplier INNER JOIN SubCatSupplier ON Supplier.SupId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId ='" + DropDownSubCategory.SelectedValue + "' AND SubCatSupplier.SupId = Supplier.SupId) AND Contact.Main = 1 ";
            }

            conn.Open();
            var cmd = new MySqlCommand(getdata, conn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if(ds.Tables[0].Rows.Count > 0)
            {
                GridViewSupplier.DataSource = ds;
                GridViewSupplier.DataBind();
            }
            else
            {
                //ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridViewSupplier.DataSource = ds;
                GridViewSupplier.DataBind();
                //int columncount = GridViewSupplier.Rows[0].Cells.Count;
            }
        }

        protected void loadDistributors()
        {
            var conn = new MySqlConnection(strcon);
            string getdata = "";
            int errorCheck = 0;

            if(DropDownContactName.SelectedIndex != 0)
            {
                getdata = "SELECT * FROM Contact INNER JOIN Distributor ON Contact.SupId = Distributor.DisId WHERE ContactId = '" + DropDownContactName.SelectedValue + "'";
            }
            else if (DropDownSubCategory.SelectedIndex != 0)
            {
                if(DropDownSupplier.SelectedIndex !=0)
                {
                    getdata = "SELECT * FROM Distributor INNER JOIN Contact ON Distributor.DisId = Contact.SupId WHERE DisId IN ( SELECT DISTINCT Distributor.DisId FROM Distributor INNER JOIN SubCatSupplier ON Distributor.DisId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId INNER JOIN Supplier ON Distributor.SupId = Supplier.SupId WHERE SubCatSupplier.SubCatId IN ( SELECT SubCatId FROM SubCategory WHERE SubCatId = '" + DropDownSubCategory.SelectedValue + "') AND Supplier.SupId = '" + DropDownSupplier.SelectedValue + "' AND SubCatSupplier.SupId = Distributor.DisId) AND Contact.Main = 1";
                }
                else
                {
                    getdata = " SELECT * FROM Distributor INNER JOIN Contact ON Distributor.DisId = Contact.SupId WHERE DisId IN ( SELECT DISTINCT Distributor.DisId FROM Distributor INNER JOIN SubCatSupplier ON Distributor.DisId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId IN ( SELECT SubCatId FROM SubCategory WHERE SubCatId = '" + DropDownSubCategory.SelectedValue + "') AND SubCatSupplier.SupId = Distributor.DisId) AND Contact.Main = 1";
                }
            }
            else if (DropDownDistributor.SelectedIndex != 0)
            {
                getdata = "SELECT * FROM Distributor INNER JOIN Contact ON Distributor.DisId = Contact.SupId WHERE DisId = '" + DropDownDistributor.SelectedValue + "'AND Contact.Main = 1";
            }
            else if (DropDownSupplier.SelectedIndex != 0)
            {
                getdata = "SELECT * FROM Distributor INNER JOIN Contact ON Distributor.DisId = Contact.SupId WHERE DisId IN ( SELECT DISTINCT Distributor.DisId FROM Distributor INNER JOIN Supplier ON Distributor.SupId = Supplier.SupId WHERE Supplier.SupId = '" + DropDownSupplier.SelectedValue + "') AND Contact.Main = 1";
            }
            else
            {
                //getdata = "SELECT * FROM Distributor INNER JOIN Contact ON Distributor.DisId = Contact.SupId";
                errorCheck = 1;
                DivGVDistributor.Visible = false;
            }

            if(errorCheck == 0)
            {
                conn.Open();
                var cmd = new MySqlCommand(getdata, conn);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                int count = ds.Tables[0].Rows.Count;
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridViewDistributor.DataSource = ds;
                    GridViewDistributor.DataBind();
                }
                else
                {
                //    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    GridViewDistributor.DataSource = ds;
                    GridViewDistributor.DataBind();
                //    int columncount = GridViewDistributor.Rows[0].Cells.Count;
                }
            }
            
        }

        protected void loadSubCategories()
        {
            var conn = new MySqlConnection(strcon);
            string getdata = "SELECT * FROM SubCategory WHERE CatId = '" + DropDownCategory.SelectedValue + "'";

            conn.Open();
            var cmd = new MySqlCommand(getdata, conn);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridViewSubCategory.DataSource = ds;
                GridViewSubCategory.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridViewSubCategory.DataSource = ds;
                GridViewSubCategory.DataBind();
                int columncount = GridViewSubCategory.Rows[0].Cells.Count;
            }
        }

        //Category Data Bind
        protected void CategoryBind()
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                using (var cmd = new MySqlCommand("SELECT * FROM Category", conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if(reader.HasRows)
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

        //Refined Sub-Category Data Bind
        protected void SubCategoryBind(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "";
                if(DropDownCategory.SelectedIndex != 0)
                {
                    Query = "SELECT * FROM SubCategory WHERE CatId = '" + DropDownCategory.SelectedValue + "'";
                }
                else
                {
                    Query = "SELECT * FROM SubCategory";
                }
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

        //Refined Supplier Data Bind
        protected void SupplierBind(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "";
                if ((DropDownCategory.SelectedIndex != 0 && DropDownSubCategory.SelectedIndex != 0) || DropDownSubCategory.SelectedIndex != 0)
                {
                    Query = "SELECT DISTINCT Supplier.* FROM Supplier INNER JOIN SubCatSupplier ON Supplier.SupId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId ='" + DropDownSubCategory.SelectedValue + "' AND SubCatSupplier.SupId = Supplier.SupId";
                }
                else if (DropDownCategory.SelectedIndex != 0)
                {
                    Query = "SELECT DISTINCT Supplier.* FROM Supplier INNER JOIN SubCatSupplier ON Supplier.SupId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId IN (SELECT SubCatId FROM SubCategory WHERE CatId = '" + DropDownCategory.SelectedValue + "') AND SubCatSupplier.SupId = Supplier.SupId";
                }
                else
                {
                    Query = "SELECT DISTINCT Supplier.SupId, Supplier.SName FROM Supplier INNER JOIN SubCatSupplier ON Supplier.SupId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId";
                }
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
                        else
                        {
                            DropDownSupplier.Items.Clear();
                            DropDownSupplier.Items.Insert(0, new ListItem("--- No Suppliers ---", "NA"));
                        }
                    }
                }
            }
        }

        //Refined Distributor Data Bind
        protected void DistributorBind(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "";

                if(DropDownCategory.SelectedIndex != 0)
                {
                    if(DropDownSubCategory.SelectedIndex != 0 && DropDownSupplier.SelectedIndex != 0)
                    {
                        Query = "SELECT DISTINCT Distributor.* FROM Distributor INNER JOIN SubCatSupplier ON Distributor.DisId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId INNER JOIN Category ON SubCategory.CatId = Category.CatId INNER JOIN Supplier ON Distributor.SupId = Supplier.SupId   WHERE SubCatSupplier.SubCatId = '" + DropDownSubCategory.SelectedValue + "'AND Supplier.SupId = '" + DropDownSupplier.SelectedValue + "'"; 
                    }
                    else if (DropDownSubCategory.SelectedIndex !=0 && DropDownSupplier.SelectedIndex == 0)
                    {
                        Query = "SELECT DISTINCT Distributor.* FROM Distributor INNER JOIN SubCatSupplier ON Distributor.DisId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId INNER JOIN Category ON SubCategory.CatId = Category.CatId WHERE SubCatSupplier.SubCatId = '" + DropDownSubCategory.SelectedValue + "'";
                    }
                    else
                    {
                        Query = "SELECT DISTINCT Distributor.* FROM Distributor INNER JOIN SubCatSupplier ON Distributor.DisId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId INNER JOIN Category ON SubCategory.CatId = Category.CatId WHERE Category.CatId IN (SELECT CatId FROM Category WHERE CatId = '" + DropDownCategory.SelectedValue + "')";
                    }
                }
                else if (DropDownSubCategory.SelectedIndex != 0)
                {
                    if(DropDownSupplier.SelectedIndex != 0)
                    {
                        Query = "SELECT DISTINCT Distributor.* FROM Distributor INNER JOIN SubCatSupplier ON Distributor.DisId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId INNER JOIN Supplier ON Distributor.SupId = Supplier.SupId WHERE SubCatSupplier.SubCatId IN (SELECT SubCatId FROM SubCategory WHERE SubCatId = '" + DropDownSubCategory.SelectedValue + "') AND Supplier.SupId = '" + DropDownSupplier.SelectedValue + "'AND SubCatSupplier.SupId = Distributor.DisId";
                    }
                    else
                    {
                        Query = "SELECT DISTINCT Distributor.* FROM Distributor INNER JOIN SubCatSupplier ON Distributor.DisId = SubCatSupplier.SupId INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId WHERE SubCatSupplier.SubCatId IN (SELECT SubCatId FROM SubCategory WHERE SubCatId = '" + DropDownSubCategory.SelectedValue + "') AND SubCatSupplier.SupId = Distributor.DisId";
                    }
                }
                else if (DropDownSupplier.SelectedIndex != 0)
                {
                    Query = "SELECT DISTINCT Distributor.* FROM Distributor INNER JOIN Supplier ON Distributor.SupId = Supplier.SupId WHERE Supplier.SupId = '" + DropDownSupplier.SelectedValue + "'";
                }
                else
                {
                    Query = "SELECT DISTINCT Distributor.* FROM Distributor";
                }

                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DropDownDistributor.DataSource = reader;
                            DropDownDistributor.DataValueField = "DisId";
                            DropDownDistributor.DataTextField = "DisName";
                            DropDownDistributor.DataBind();
                            DropDownDistributor.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
                        }
                        else
                        {
                            DropDownDistributor.Items.Clear();
                            DropDownDistributor.Items.Insert(0, new ListItem("--- No Distributors ---", "NA"));
                        }
                    }
                }
            }
        }

        //Refined Contact Name Data Bind
        protected void ContactBind(object sender, EventArgs e)
        {
            var dict = new Dictionary<object, object>();
            using (var conn = new MySqlConnection(strcon))
            {
                conn.Open();
                string Query = "SELECT * FROM Contact";
                using (var cmd = new MySqlCommand(Query, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {

                            while (reader.Read())
                            {
                                dict.Add(reader["ContactId"], reader["FName"] + " " + reader["LName"]);
                            }


                        }
                    }
                }
            }
            if (dict.Count != 0)
            {
                DropDownContactName.DataSource = dict;
                DropDownContactName.DataValueField = "Key";
                DropDownContactName.DataTextField = "Value";
                DropDownContactName.DataBind();
                DropDownContactName.Items.Insert(0, new ListItem("--- Choose One ---", "NA"));
            }
        }

        //Changes when Category is modified
        protected void DropDownCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownContactName.SelectedIndex = 0;
            SubCategoryBind(sender, e);
            SupplierBind(sender, e);
            DistributorBind(sender, e);
            DivGVSupplier.Visible = false;
            DivGVDistributor.Visible = false;
            loadSubCategories();
            DivGVSubCategory.Visible = true;
        }

        //Changes when Sub-Category is modified
        protected void DropDownSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownContactName.SelectedIndex = 0;
            SupplierBind(sender, e);
            DistributorBind(sender, e);
            DivGVSubCategory.Visible = false;
            loadSuppliers();
            loadDistributors();
            DivGVSupplier.Visible = true;
            foreach (GridViewRow row in GridViewSupplier.Rows)
            {
                System.Web.UI.WebControls.Button CEditButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonEdit");
                System.Web.UI.WebControls.Button CDeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonDelete");

                System.Web.UI.WebControls.Button EditButton = (System.Web.UI.WebControls.Button)row.FindControl("SupButtonEdit");
                System.Web.UI.WebControls.Button DeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("SupButtonDelete");

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                        EditButton.Visible = true;
                        DeleteButton.Visible = true;
                    }


                }
                

                CEditButton.Visible = false;
                CDeleteButton.Visible = false;
            }
            DivGVDistributor.Visible = true;
            foreach (GridViewRow row in GridViewDistributor.Rows)
            {
                System.Web.UI.WebControls.Button CEditButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonEdit");
                System.Web.UI.WebControls.Button CDeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonDelete");

                System.Web.UI.WebControls.Button EditButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonEdit");
                System.Web.UI.WebControls.Button DeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonDelete");

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                        EditButton.Visible = true;
                        DeleteButton.Visible = true;
                    }


                }
                
                CEditButton.Visible = false;
                CDeleteButton.Visible = false;
            }
        }

        //Changes when Supplier is modified
        protected void DropDownSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownContactName.SelectedIndex = 0;
            DistributorBind(sender, e);
            DivGVSubCategory.Visible = false;
            loadSuppliers();
            loadDistributors();
            DivGVSupplier.Visible = true;
            foreach (GridViewRow row in GridViewSupplier.Rows)
            {
                System.Web.UI.WebControls.Button CEditButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonEdit");
                System.Web.UI.WebControls.Button CDeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonDelete");

                System.Web.UI.WebControls.Button EditButton = (System.Web.UI.WebControls.Button)row.FindControl("SupButtonEdit");
                System.Web.UI.WebControls.Button DeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("SupButtonDelete");
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                        EditButton.Visible = true;
                        DeleteButton.Visible = true;
                    }


                }
               

                CEditButton.Visible = false;
                CDeleteButton.Visible = false;
            }
            DivGVDistributor.Visible = true;
            foreach (GridViewRow row in GridViewDistributor.Rows)
            {
                System.Web.UI.WebControls.Button CEditButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonEdit");
                System.Web.UI.WebControls.Button CDeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonDelete");

                System.Web.UI.WebControls.Button EditButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonEdit");
                System.Web.UI.WebControls.Button DeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonDelete");

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                        EditButton.Visible = true;
                        DeleteButton.Visible = true;
                    }


                }
                
                CEditButton.Visible = false;
                CDeleteButton.Visible = false;
            }
        }

        //Changes when Distributor is modified
        protected void DropDownDistributor_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownContactName.SelectedIndex = 0;
            DivGVSubCategory.Visible = false;
            DivGVSupplier.Visible = false;
            DivGVDistributor.Visible = true;
            loadDistributors();
            foreach (GridViewRow row in GridViewDistributor.Rows)
            {
                System.Web.UI.WebControls.Button CEditButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonEdit");
                System.Web.UI.WebControls.Button CDeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonDelete");

                System.Web.UI.WebControls.Button EditButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonEdit");
                System.Web.UI.WebControls.Button DeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonDelete");

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                        EditButton.Visible = true;
                        DeleteButton.Visible = true;
                    }


                }
                
                CEditButton.Visible = false;
                CDeleteButton.Visible = false;
            }
        }

        //Changes when Contact Name is modified
        protected void DropDownContactName_SelectedIndexChanged(object sender, EventArgs e)
        {
            CategoryBind();
            SubCategoryBind(sender, e);
            SupplierBind(sender, e);
            DistributorBind(sender, e);
            DivGVSubCategory.Visible = false;
            loadSuppliers();
            loadDistributors();
            DivGVSupplier.Visible = true;
            foreach (GridViewRow row in GridViewSupplier.Rows)
            {
                System.Web.UI.WebControls.Button CEditButton = (System.Web.UI.WebControls.Button) row.FindControl("ContactButtonEdit");
                System.Web.UI.WebControls.Button CDeleteButton = (System.Web.UI.WebControls.Button) row.FindControl("ContactButtonDelete");

                System.Web.UI.WebControls.Button EditButton = (System.Web.UI.WebControls.Button)row.FindControl("SupButtonEdit");
                System.Web.UI.WebControls.Button DeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("SupButtonDelete");

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                        CEditButton.Visible = true;
                        CDeleteButton.Visible = true;
                    }


                }
               
                EditButton.Visible = false;
                DeleteButton.Visible = false;
            }
            DivGVDistributor.Visible = true;
            foreach (GridViewRow row in GridViewDistributor.Rows)
            {
                System.Web.UI.WebControls.Button CEditButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonEdit");
                System.Web.UI.WebControls.Button CDeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("ContactButtonDelete");

                System.Web.UI.WebControls.Button EditButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonEdit");
                System.Web.UI.WebControls.Button DeleteButton = (System.Web.UI.WebControls.Button)row.FindControl("DisButtonDelete");

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity.Name == "admin@dg.com")
                    {
                        CEditButton.Visible = true;
                        CDeleteButton.Visible = true;
                    }


                }
                
                EditButton.Visible = false;
                DeleteButton.Visible = false;
            }
        }

        protected void SupButtonEdit_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/SupplierEdit.aspx?supplier=" + rowIndex + "");
            }
        }

        protected void SupButtonDelete_Command(object sender, CommandEventArgs e)
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
                    addLB.Items.Clear();

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

        protected void DisButtonEdit_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/DistributorEdit.aspx?distributor=" + rowIndex + "");
            }
        }

        protected void DisButtonDelete_Command(object sender, CommandEventArgs e)
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
                    string deleteAddress = "DELETE FROM Address WHERE AddressId = (SELECT AddressId FROM Distributor WHERE DisId = '" + rowIndex + "')";
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
                    addLB.Items.Clear();

                    conn.Open();
                    string deleteContact = "DELETE FROM Contact WHERE SupId = '" + rowIndex + "'";
                    cmd = new MySqlCommand(deleteContact, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();

                    conn.Open();
                    string deleteDistributor = "DELETE FROM Distributor WHERE DisId = '" + rowIndex + "'";
                    cmd = new MySqlCommand(deleteDistributor, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                    }
                    conn.Close();
                    loadDistributors();
                }
            }
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            DropDownCategory.Items.Clear();
            DropDownSubCategory.Items.Clear();
            DropDownSupplier.Items.Clear();
            DropDownDistributor.Items.Clear();
            DropDownContactName.Items.Clear();
            CategoryBind();
            SubCategoryBind(sender, e);
            SupplierBind(sender, e);
            DistributorBind(sender, e);
            ContactBind(sender, e);
            DivGVSubCategory.Visible = false;
            DivGVSupplier.Visible = false;
            DivGVDistributor.Visible = false;
        }

        protected void ContactButtonEdit_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "CEdit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/ContactEdit.aspx?contact=" + rowIndex + "");
            }
        }

        protected void ContactButtonDelete_Command(object sender, CommandEventArgs e)
        {
            string addId = "";
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            var conn = new MySqlConnection(strcon);

            //Get AddressId from the Contact we are deleting
            conn.Open();
            string selectaddress = "SELECT AddressId FROM Contact WHERE ContactId = '" + rowIndex + "'";
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
            string deletecontact = "DELETE FROM Contact WHERE ContactId = '" + rowIndex + "'";
            cmd = new MySqlCommand(deletecontact, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            ClearBtn_Click(sender, e);
        }

        protected void GridViewDistributor_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}