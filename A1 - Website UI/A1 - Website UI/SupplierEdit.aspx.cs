using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1___Website_UI
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string returnUrl = "~/SearchMenu.aspx";

            // check if it exists, if not then redirect to default page
            if (!(returnUrl == null))
                Response.Redirect(returnUrl);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string returnUrl = "~/SearchMenu.aspx";

            // check if it exists, if not then redirect to default page
            if (!(returnUrl == null))
                Response.Redirect(returnUrl);
        }
    }
}