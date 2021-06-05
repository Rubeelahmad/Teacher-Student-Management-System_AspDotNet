using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentUpdatePanel : System.Web.UI.Page
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
                sqlCmd.CommandText = "select * from REPLY_MASTER where Student_ID='" + userId + "'" + "Order BY ReplyId DESC";
                SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
                sda.Fill(ds);
                sda.Dispose();
                gvUpdatesList.DataSource = ds;
                gvUpdatesList.DataBind();
            }
        }
        conn.Close();
    }

    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvUpdatesList, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }
    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        int index = gvUpdatesList.SelectedRow.RowIndex;
        var id = gvUpdatesList.SelectedRow.Cells[0].Text;
        string name = gvUpdatesList.SelectedRow.Cells[1].Text;
        string message = "Row Index: " + index + "\\nName: " + name + "\\nID: " + id;
        //     ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);



    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        gvUpdatesList.PageIndex = e.NewPageIndex;
        // gvEnquiryList.DataBind();

    }


    //Download CSV File of Complete User and Forms Details
    protected void btn_downloadUpdatesInfo_Click(object sender, EventArgs e)
    {

        var UserId = Convert.ToString(Session["UserId"]);
        var Username = Convert.ToString(Session["FullName"]);
        var Email = Convert.ToString(Session["Email"]);
        var Contact = Convert.ToString(Session["contact"]);

        using (SqlConnection con3 = new SqlConnection(ConfigurationManager.ConnectionStrings["teacher"].ToString()))
        {
            using (SqlCommand cmd3 = new SqlCommand("select * from REPLY_MASTER where Student_ID='" + UserId + "'" + "Order BY ReplyId DESC"))
            {
                using (SqlDataAdapter sda3 = new SqlDataAdapter())
                {
                    cmd3.Connection = con3;
                    sda3.SelectCommand = cmd3;
                    using (DataTable dt = new DataTable())
                    {
                        sda3.Fill(dt);

                        //Build the CSV file data as a Comma separated string.
                        string csv = string.Empty;

                        foreach (DataColumn column in dt.Columns)
                        {
                            //Add the Header row for CSV file.
                            csv += column.ColumnName + ',';
                        }

                        //Add new line.
                        csv += "\r\n";

                        foreach (DataRow row in dt.Rows)
                        {
                            foreach (DataColumn column in dt.Columns)
                            {
                                //Add the Data rows.
                                csv += row[column.ColumnName].ToString().Replace(",", ";") + ',';
                            }

                            //Add new line.
                            csv += "\r\n";
                        }

                        //Download the CSV file.
                        Response.Clear();
                        Response.Buffer = true;
                        Response.AddHeader("content-disposition", "attachment;filename=StudentsUpdatesData.csv");
                        Response.Charset = "";
                        Response.ContentType = "application/text";
                        Response.Output.Write(csv);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
        }
    }

    //protected void btnSendReply_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        string TeacherName = Convert.ToString(Session["FullName"]);
    //        string TeacherEmail = Convert.ToString(Session["Email"]);
    //        string TeacherContact = Convert.ToString(Session["contact"]);
    //        string TeacherId = Convert.ToString(Session["UserId"]);
    //        var fileurl = "";
    //        DataSet ds = new DataSet();
    //        if (conn.State == ConnectionState.Closed)
    //            conn.Open();
    //        sqlCmd = new SqlCommand();
    //        sqlCmd.CommandText = "insert into REPLY_MASTER(Student_ID,DESCRIPTION,[File],Teacher_NAME,Teacher_EMAIL,Teacher_CONTACT,CREATED_BY_TeacherID) values('" + hdnStudentId.Value + "','" + fileurl + "','" + txtReplyDescription.Text + "','" + TeacherName + "','" + TeacherEmail + "','" + TeacherContact + "','" + TeacherId + "')";
    //        sqlCmd.CommandType = CommandType.Text;
    //        sqlCmd.Connection = conn;
    //        int a = sqlCmd.ExecuteNonQuery();
    //        if (a == 1)
    //        {
    //            //  divMessage.Attributes.Add("class", "alert alert-success");
    //            //  divMessage.InnerHtml = "Your registration has been done successfully";
    //            var message = "Your Reply has been sent successfully";
    //            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

    //        }
    //        else
    //        {
    //            // divMessage.Attributes.Add("class", "alert alert-danger");
    //            // divMessage.InnerHtml = "Please try again later";
    //            var message = "Reply Not Sent, Please try again.";
    //            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //    txtReplyDescription.Text = "";
    //}


    //Send a File to your Student 
    //protected void UploadFile(object sender, EventArgs e)
    //{
    //    if (UploadFile1.HasFile)
    //    {


    //        string folderPath = Server.MapPath("/Files/");

    //        //Check whether Directory (Folder) exists.
    //        if (!Directory.Exists(folderPath))
    //        {
    //            //If Directory (Folder) does not exists. Create it.
    //            Directory.CreateDirectory(folderPath);
    //        }

    //        //Save the File to the Directory (Folder).
    //        UploadFile1.SaveAs(folderPath + Path.GetFileName(UploadFile1.FileName));


    //        try
    //        {
    //            string TeacherName = Convert.ToString(Session["FullName"]);
    //            string TeacherEmail = Convert.ToString(Session["Email"]);
    //            string TeacherContact = Convert.ToString(Session["contact"]);
    //            string TeacherId = Convert.ToString(Session["UserId"]);
    //            if (txtReplyDescription.Text == "")
    //            {
    //                txtReplyDescription.Text = "You have Recieved a File from Sir/Madam " + TeacherName + ".";
    //            }
    //            var fileUrl = "/Files/" + UploadFile1.FileName;
    //            DataSet ds = new DataSet();
    //            if (conn.State == ConnectionState.Closed)
    //                conn.Open();
    //            sqlCmd = new SqlCommand();
    //            sqlCmd.CommandText = "insert into Reply_MASTER(Student_ID,DESCRIPTION,[File],Teacher_NAME,Teacher_EMAIL,Teacher_CONTACT,CREATED_BY_TeacherID) values('" + hdnStudentId.Value + "','" + txtReplyDescription.Text + "', '" + fileUrl + "','" + TeacherName + "','" + TeacherEmail + "','" + TeacherContact + "','" + TeacherId + "')";
    //            sqlCmd.CommandType = CommandType.Text;
    //            sqlCmd.Connection = conn;
    //            int a = sqlCmd.ExecuteNonQuery();
    //            if (a == 1)
    //            {
    //                //  divMessage.Attributes.Add("class", "alert alert-success");
    //                //  divMessage.InnerHtml = "Your registration has been done successfully";
    //                var message = UploadFile1.FileName + "  has been Uploaded successfully!!!";
    //                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    //            }
    //            else
    //            {
    //                // divMessage.Attributes.Add("class", "alert alert-danger");
    //                // divMessage.InnerHtml = "Please try again later";
    //                var message = "File Not Sent, Please try again.";
    //                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

    //            }

    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        //Display the success message.
    //        // lblMessage.Text = Path.GetFileName(UploadFile1.FileName) + " has been uploaded Lastly.";

    //    }
    //    else
    //    {
    //        var message = "No File is Attached";
    //        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

    //    }

    //}


    public partial class TeacherCourses
    {

        public string UserId { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Contact { get; set; }
        public string CourseName { get; set; }
    }

}