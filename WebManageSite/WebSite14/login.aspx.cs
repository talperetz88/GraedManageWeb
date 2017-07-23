using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class login : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection("Data Source = localhost'\'sqlexpress;Initial Catalog = project; Integrated Security = True");
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["loginConnectionString1"].ConnectionString);
        con.Open();
        string checkUser = "SELECT count(*) FROM login WHERE email='" + txtusername.Text + "'";
        SqlCommand com = new SqlCommand(checkUser, con);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();
        if(temp == 1)
        {
            con.Open();
            String checkPassword = "SELECT paswword FROM login WHERE email='" + txtusername.Text + "'";
            SqlCommand comm = new SqlCommand(checkPassword,con);
            string password = comm.ExecuteScalar().ToString().Replace(" ","");
            if(password == txtpassword.Text)
            {
                Session["useremail"] = txtusername.Text;
                Response.Redirect("home.aspx");
                
            }
            else
            {
                
                Response.Write("password incorrect");
            }
        }else
        {
            Response.Write("user name incorrect");
        }
    }
}