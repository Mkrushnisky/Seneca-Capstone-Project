<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="A1___Website_UI.Login1" %>
<%@ Import Namespace="System.Web.Security" %>
<!DOCTYPE html>
<script runat="server">
    void Logon_Click(object sender, EventArgs e)
    {
        if ((UserEmail.Text == "admin@dg.com") &&
                (UserPass.Text == "password"))
        {
            
            FormsAuthentication.RedirectFromLoginPage
             (UserEmail.Text, Persist.Checked);


        }
        else if ((UserEmail.Text == "guest@dg.com") && 
            (UserPass.Text == "password"))
      {

            FormsAuthentication.RedirectFromLoginPage 
             (UserEmail.Text, Persist.Checked);
            
          
      }
        
      else
      {
            Msg.Text = "Invalid credentials. Please try again.";
        }
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
     <!-- Bootstrap -->
    <link href="content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="Scripts/jquery-1.9.0.min.js"></script>
    <script src="https://code.jquery.com/jquery.js"></script>

    </head>


    <body>

        <div class="navbar navbar-default navbar-top">
      <div class="container">
        <div class="navbar-header">
          <a href="../" class="navbar-brand">DG & Associates Inc.</a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
          </div>
    </div>


    <link href="Content/Login.css" rel="stylesheet" />
    <div class="container">
	<section id="content">
		<form id="form1" runat="server">
			<h1>Login Form</h1>
			<div>
                <asp:TextBox ID="UserEmail" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                 ControlToValidate="UserEmail"
                  Display="Dynamic" 
                  ErrorMessage="Cannot be empty." 
                  runat="server" />
				<!--<input type="text" placeholder="Username" required="" id="username" />-->
			</div>
			<div>
                <asp:TextBox ID="UserPass" TextMode="Password" 
             runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            ControlToValidate="UserPass"
            ErrorMessage="Cannot be empty." 
            runat="server" />
				<!--<input type="password" placeholder="Password" required="" id="password" />-->
			</div>
			<div>
                 <asp:Button ID="Submit1" OnClick="Logon_Click" Text="Log On" 
       runat="server" />
                <p>
                 <asp:Label ID="Msg" ForeColor="red" runat="server" />
                    </p>
				<!--<input type="button" onclick="check(this.form)" value="Login"/>-->
            <input type="reset" value="Cancel"/>
                Remember me?
                 <asp:CheckBox ID="Persist" runat="server" />
				<a href="#">Lost your password?</a>
				<a href="#">Register</a>
			</div>
		</form><!-- form -->
	</section><!-- content -->
</div><!-- container -->
       
    </body>
    </html>