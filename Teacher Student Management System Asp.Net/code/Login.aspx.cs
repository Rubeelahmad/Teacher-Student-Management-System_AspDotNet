using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["teacher"].ToString());
    SqlCommand sqlCmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        sqlCmd = new SqlCommand();
        sqlCmd.CommandType = CommandType.Text;
        sqlCmd.Connection = conn;
        sqlCmd.CommandText = "select * from Register where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'";
        SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
        sda.Fill(ds);
        sda.Dispose();
        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Session["UserId"] = ds.Tables[0].Rows[0]["UserId"];
            Session["Username"] = ds.Tables[0].Rows[0]["Username"];
            Session["FullName"] = ds.Tables[0].Rows[0]["FullName"];
            Session["Role"] = ds.Tables[0].Rows[0]["Role"];
            Session["Email"] = ds.Tables[0].Rows[0]["Email_Id"];
            Session["contact"] = ds.Tables[0].Rows[0]["Contact"];

            if (Convert.ToString(Session["Role"]).Trim() == "S")
            {
                Response.Redirect("TeacherEnquiry.aspx",false);
            }
            else
            {
                Response.Redirect("TeacherEnquiryList.aspx", false);
            }
        }
        else
        {
            divMessage.Attributes.Add("class", "alert alert-danger");
            divMessage.InnerHtml = "Your Username or Password wrong";
        }
    }
}