using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditTeacherProfile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["teacher"].ToString());
    SqlCommand sqlCmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx", false);
            else
            {
                string userId = Convert.ToString(Session["UserId"]);
                DataSet ds = new DataSet();
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                sqlCmd = new SqlCommand();
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = conn;
                sqlCmd.CommandText = "select * from Register where UserId='" + userId + "'";
                SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
                sda.Fill(ds);
                sda.Dispose();
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    txtName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FullName"]);
                    txtUserName.Text = Convert.ToString(ds.Tables[0].Rows[0]["Username"]);
                    txtSubjectName.Text = Convert.ToString(ds.Tables[0].Rows[0]["SUBJECT_NAME"]);
                    txtExperience.Text = Convert.ToString(ds.Tables[0].Rows[0]["EXPERIENCE"]);
                    txtContact.Text = Convert.ToString(ds.Tables[0].Rows[0]["Contact"]);
                    txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["Email_Id"]);
                    txtBoard.Text = Convert.ToString(ds.Tables[0].Rows[0]["BOARD"]);
                    txtTags.Text = Convert.ToString(ds.Tables[0].Rows[0]["TAGS"]);
                    txtTeacherAddress.Text = Convert.ToString(ds.Tables[0].Rows[0]["Address"]);
                    txtPassword.Text = Convert.ToString(ds.Tables[0].Rows[0]["Password"]);
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {



        try
        {
            string filename = string.Empty;
            if (fuimgInp.HasFile)
            {
                filename = fuimgInp.FileName;
                fuimgInp.PostedFile.SaveAs(Server.MapPath("~/Profile/") + fuimgInp.PostedFile.FileName);
            }
            //else
            //{
            //    filename = hdnProfile.Value;
            //}

            string userId = Convert.ToString(Session["UserId"]);
            DataSet ds = new DataSet();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            sqlCmd = new SqlCommand();
            sqlCmd.CommandText = "update Register set FullName = '" + txtName.Text + "',Username='" + txtUserName.Text + "',Password='" + txtPassword.Text + "',Contact='" + txtContact.Text + "',Email_Id='" + txtEmail.Text + "',SUBJECT_NAME='" + txtSubjectName.Text + "',EXPERIENCE='" + txtExperience.Text + "',BOARD='" + txtBoard.Text + "',TAGS='" + txtTags.Text + "',PIC_PATH='" + "~/Profile/" + filename + "',Address='" + txtTeacherAddress.Text + "' where UserId = '" + userId + "'";
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Connection = conn;
            int a = sqlCmd.ExecuteNonQuery();
            if (a == 1)
            {
                divMessage.Attributes.Add("class", "alert alert-success");
                divMessage.InnerHtml = "Your Profile Updated Successfully";
                Session["FullName"] = txtName.Text;
                Session["Email"] = txtEmail.Text;
            }
            else
            {
                divMessage.Attributes.Add("class", "alert alert-danger");
                divMessage.InnerHtml = "Please try again";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}