using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1___Website_UI
{
    public partial class SearchMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                CategoryDropDownList.Items.Insert(0, new ListItem("Select", "-1"));
                SearchButton.Enabled = false;
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!(SupplierDropDownList.SelectedValue == "-1")) { 
                Response.Redirect("~/SupplierResults.aspx?Id=" + CategoryDropDownList.SelectedValue);
            }
        }

        protected void CategoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategoryDropDownList.Items.Clear();
            SearchButton.Enabled = true;
            if (CategoryDropDownList.SelectedValue == "-1")
            {
                SupplierDropDownList.Items.Clear();
                SupplierDropDownList.Items.Insert(0, new ListItem("", "-1"));
                SupplierDropDownList.SelectedValue = "-1";
                SearchButton.Enabled = false;
            }
        }


    }
}