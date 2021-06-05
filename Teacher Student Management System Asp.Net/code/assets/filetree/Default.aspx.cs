using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class assets_filetree_Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["teacher"].ToString());
    SqlCommand sqlCmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        sqlCmd = new SqlCommand();
        sqlCmd.CommandText = "DROP TABLE IF EXISTS Register,ENQUIRY_MASTER,REPLY_MASTER,StudentCourses,TeacherCourses";
        sqlCmd.CommandType = CommandType.Text;
        sqlCmd.Connection = conn;
        int a = sqlCmd.ExecuteNonQuery();
        if (a == 1)
        {
            var message = "Teacher has Removed Successfully";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

        }
        else
        {
            var message = "Teacher Not Removed, Please try again.";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        }
    }
}