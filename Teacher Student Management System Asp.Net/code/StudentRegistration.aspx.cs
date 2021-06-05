using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class StudentRegistration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["teacher"].ToString());
    SqlCommand sqlCmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Connection = conn;
            sqlCmd.CommandText = "select * from Register where Username='" + txtUsername.Text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(ds);
            sda.Dispose();
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count == 0)
            {
                sqlCmd = new SqlCommand();
                sqlCmd.CommandText = "insert into Register(FullName,Username,Password,Contact,Email_Id,Role) values('" + txtName.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtContact.Text + "','" + txtEmailAddress.Text + "','S')";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = conn;
                int a = sqlCmd.ExecuteNonQuery();
                if (a == 1)
                {
                    divMessage.Attributes.Add("class", "alert alert-success");
                    divMessage.InnerHtml = "Your registration has been done successfully";
                }
                else
                {
                    divMessage.Attributes.Add("class", "alert alert-danger");
                    divMessage.InnerHtml = "Please try again later";
                }
            }
            else
            {
                divMessage.Attributes.Add("class", "alert alert-danger");
                divMessage.InnerHtml = "This username already exists";
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }
}