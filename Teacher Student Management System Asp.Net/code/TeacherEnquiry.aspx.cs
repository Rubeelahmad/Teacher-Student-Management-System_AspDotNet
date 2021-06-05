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


public partial class TeacherEnquiry : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["teacher"].ToString());
    SqlCommand sqlCmd;
    TeacherDataViewModel teacher_id = new TeacherDataViewModel();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx", false);
            else
            {

                DataSet ds = new DataSet();
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                sqlCmd = new SqlCommand();
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = conn;
                sqlCmd.CommandText = "select * from Register where Role = 'T' And ShowTeacher= '0'";
                SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
                sda.Fill(ds);
                sda.Dispose();
                gvTeacherList.DataSource = ds;
                gvTeacherList.DataBind();

                //Bind Techaers Drop Down List
                DataSet tds = new DataSet();
                if (conn.State == ConnectionState.Closed)
                    conn.Open();

                SqlCommand  tsqlCmd = new SqlCommand();
                tsqlCmd.CommandType = CommandType.Text;
                tsqlCmd.Connection = conn;
                tsqlCmd.CommandText = "select FullName from Register where Role = 'T'";
                SqlDataAdapter tsda = new SqlDataAdapter(tsqlCmd);
                tsda.Fill(tds);
                tsda.Dispose();

                selectTeacher.DataSource = tds;
                selectTeacher.DataBind();
                selectTeacher.DataTextField = "FullName";
                selectTeacher.DataBind();
                if(selectTeacher.SelectedValue != null && selectTeacher.SelectedIndex == 0)
                {
                    DropDownList1_SelectedIndexChanged(sender, e);
                }
            }
        }
        else
        {
            //
        }    
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Connection = conn;
      
           if (txtKeywordSearch.Text != string.Empty)
            {
                sqlCmd.CommandText = "select * from Register where Role = 'T' and Username like'%" + txtKeywordSearch.Text + "%' ";
            }
           else
            {
                sqlCmd.CommandText = "select * from Register where Role = 'T'  ";

            }
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(ds);
            sda.Dispose();
            gvTeacherList.DataSource = ds;
            gvTeacherList.DataBind();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void btnSendEnquiry_Click(object sender, EventArgs e)
    {
        try
        {
            string studentName = Convert.ToString(Session["FullName"]);
            string studentEmail = Convert.ToString(Session["Email"]);
            string studentContact = Convert.ToString(Session["contact"]);
            string userId = Convert.ToString(Session["UserId"]);
            DataSet ds = new DataSet();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            sqlCmd = new SqlCommand();
            sqlCmd.CommandText = "insert into ENQUIRY_MASTER(TEACHER_ID,DESCRIPTION,STUDENT_NAME,STUDENT_EMAIL,STUDENT_CONTACT,CREATED_BY) values('" + hdnTeacherId.Value + "','" + txtEnquiryDescription.Text + "','" + studentName + "','" + studentEmail + "','" + studentContact + "','" + userId + "')";
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Connection = conn;
            int a = sqlCmd.ExecuteNonQuery();
            if (a == 1)
            {
                
                var message = "Your Query has been sent successfully";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
            }
            else
            {
                
                var message = "Query Not Sent, Please try again.";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        txtEnquiryDescription.Text = "";
      
    }

    protected void Submit(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var selectedTeacher = selectTeacher.SelectedValue;
        if(selectedTeacher != null)
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlCommand csqlCmd1 = new SqlCommand();
            csqlCmd1.CommandType = CommandType.Text;
            csqlCmd1.Connection = conn;
            csqlCmd1.CommandText = @"select UserId from TeacherCourses where  Username ='" + selectedTeacher + "'";
            var teacher_id = "";
            SqlDataReader dr = csqlCmd1.ExecuteReader();
           
            while (dr.Read())
            {

                teacher_id = dr["UserId"].ToString();

            }

            dr.Close();
  

            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["teacher"].ToString());
            StudentCourses courseObj = new StudentCourses();
            courseObj.Username = Convert.ToString(Session["FullName"]);
            courseObj.UserId = Convert.ToString(Session["UserId"]);
            courseObj.TeacherId = teacher_id.ToString();
            courseObj.Email = Convert.ToString(Session["Email"]);
            courseObj.Contact = Convert.ToString(Session["contact"]);


            string message = "";
            foreach (ListItem item in lstCourses.Items)
            {
                //Get Course-ID
                SqlCommand csqlCmd3 = new SqlCommand();
                csqlCmd3.CommandType = CommandType.Text;
                csqlCmd3.Connection = conn;
                csqlCmd3.CommandText = @"select CourseId from TeacherCourses where  Username ='" + selectedTeacher + "' AND CourseName= '" + item.Text + "' AND UserId= '" + teacher_id + "' ";
                var course_id = "";
                SqlDataReader dr3 = csqlCmd3.ExecuteReader();

                while (dr3.Read())
                {

                    course_id = dr3["CourseId"].ToString();

                }
                dr3.Close();
                if (item.Selected)
                {
                    if (conn2.State == ConnectionState.Closed)
                    {
                        conn2.Open();
                    }
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn2;
                    cmd.CommandType = CommandType.Text;

                    cmd.CommandText = @"INSERT INTO StudentCourses(CourseId,CourseName,TeacherId,UserId,Username,Email,Contact) output INSERTED.Id Values (@CourseId,@CourseName,@TeacherId,@UserId,@Username,@Email,@Contact)";
                    cmd.Parameters.AddWithValue("@CourseId", Convert.ToInt32(course_id));
                    cmd.Parameters.AddWithValue("@CourseName", item.Text);
                    cmd.Parameters.AddWithValue("@TeacherId", Convert.ToInt32(teacher_id));
                    cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(courseObj.UserId));
                    cmd.Parameters.AddWithValue("@Username", courseObj.Username);
                    cmd.Parameters.AddWithValue("@Email", courseObj.Email);
                    cmd.Parameters.AddWithValue("@Contact", courseObj.Contact);
                    try
                    {
                   
                        
                        cmd.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + ex.Message.ToString() + "');", true);
                    }

                    message += "Student Name : " + courseObj.Username + ", Enrollement Course : " + item.Value + "\\n";
                    conn2.Close();
                }

            }

            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        }
        else
        {
            string message = "Try again, Teacher ID Not Found.";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        }


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var selectedTeacher = selectTeacher.SelectedValue;
        

        DataSet cds = new DataSet();
        DataSet cds1 = new DataSet();
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        SqlCommand csqlCmd = new SqlCommand();
        csqlCmd.CommandType = CommandType.Text;
        csqlCmd.Connection = conn;
        csqlCmd.CommandText = @"select * from TeacherCourses where  Username ='" + selectedTeacher + "'";


        SqlDataAdapter csda = new SqlDataAdapter(csqlCmd);
        csda.Fill(cds);
        csda.Dispose();

        lstCourses.DataSource = cds;
        lstCourses.DataBind();
        lstCourses.DataTextField = "CourseName";
        lstCourses.DataBind();

        
    }

    //Send a File to Teacher 
    protected void UploadFile(object sender, EventArgs e)
    {
        if (UploadFile1.HasFile)
        {


            string folderPath = Server.MapPath("/Files/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            UploadFile1.SaveAs(folderPath + Path.GetFileName(UploadFile1.FileName));


            try
            {
                string studentName = Convert.ToString(Session["FullName"]);
                string studentEmail = Convert.ToString(Session["Email"]);
                string studentContact = Convert.ToString(Session["contact"]);
                string userId = Convert.ToString(Session["UserId"]);
                if (txtEnquiryDescription.Text == "")
                {
                    txtEnquiryDescription.Text = "A File is Submitted by " + studentName + " .";
                }
                var fileUrl = "/Files/" + UploadFile1.FileName;
                DataSet ds = new DataSet();
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                sqlCmd = new SqlCommand();
                sqlCmd.CommandText = "insert into ENQUIRY_MASTER(TEACHER_ID,DESCRIPTION,[File],STUDENT_NAME,STUDENT_EMAIL,STUDENT_CONTACT,CREATED_BY) values('" + hdnTeacherId.Value + "','" + txtEnquiryDescription.Text + "', '" + fileUrl + "','" + studentName + "','" + studentEmail + "','" + studentContact + "','" + userId + "')";
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = conn;
                int a = sqlCmd.ExecuteNonQuery();
                if (a == 1)
                {
                   
                    var message = UploadFile1.FileName + "  has been Uploaded successfully!!!";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                }
                else
                {
                 
                    var message = "File Not Sent, Please try again.";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            //Display the success message.
            // lblMessage.Text = Path.GetFileName(UploadFile1.FileName) + " has been uploaded Lastly.";

        }
        else
        {
            var message = "No File is Attached";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

        }

    }

    protected void btn_checkUpdates_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentUpdatePanel.aspx");
    }

    protected void btn_removeTecher_Click(object sender, EventArgs e)
    {
        //
        try
        {
           

            string userId = Convert.ToString(Session["UserId"]);
            DataSet ds = new DataSet();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            sqlCmd = new SqlCommand();
            sqlCmd.CommandText = "update Register set ShowTeacher = '1' where UserId = '" + hdnTeacherId.Value + "'";
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
        catch (Exception ex)
        {
            throw ex;
        }
    }



    protected void btnCourses_Click(object sender, EventArgs e)
    {
        var StudentId = Convert.ToString(Session["UserId"]);

        if (conn.State == ConnectionState.Closed)
            conn.Open();
        SqlCommand csqlCmd1 = new SqlCommand();
        csqlCmd1.CommandType = CommandType.Text;
        csqlCmd1.Connection = conn;
        csqlCmd1.CommandText = @"select CourseName from StudentCourses where  TeacherId ='" + hdnTeacherId.Value + "' AND UserId='"+ StudentId  +"' ";
        var CourseName = "";
        SqlDataReader dr = csqlCmd1.ExecuteReader();

        while (dr.Read())
        {

            CourseName = CourseName + dr["CourseName"].ToString() + " , ";

        }
        var message = "";
        if(CourseName == "")
        {
            message = "No Course Registered....!!!";
        }
        else
        {
            message = CourseName.ToString();
        }
        dr.Close();

       // txtEnquirycourses.Text = CourseName.ToString();
       // ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowModal('" + CourseName + "');", true);
         ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    }


    public class TeacherDataViewModel
    {
        public string userid { get; set; }
    }
    public partial class StudentCourses
    {

        public string CourseId { get; set; }
        public string CourseName { get; set; }
        public string TeacherId { get; set; }
        public string UserId { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Contact { get; set; }
    }
}