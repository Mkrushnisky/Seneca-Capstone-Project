using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1___Website_UI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
                DropDownList1.Enabled = true;
            else if (CheckBox1.Checked == false)
            {
                DropDownList1.SelectedValue = "Choose Supplier";
                DropDownList1.Enabled = false;
            }

        }
    }
}