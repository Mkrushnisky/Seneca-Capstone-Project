﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1___Website_UI
{
    public partial class search : System.Web.UI.Page
    {
        String id;
        protected void Page_Load(object sender, EventArgs e)
        {
             id = Request["Id"];
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SupplierEdit.aspx?Id=" + id);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SupplierEdit.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SupplierEdit.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SupplierEdit.aspx");
        }
    }
}