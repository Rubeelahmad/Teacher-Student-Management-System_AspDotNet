<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherEnquiryList.aspx.cs" EnableEventValidation="false" Inherits="TeacherEnquiryList" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />


    <script type="text/javascript">  

        function GetStudentId(lnk) {
            var $tr = $(lnk).closest('tr');
            var StudentId = $tr.find("input[id$=hdnStudentId1]").val();
            // if hidden input is the only one in the row you could simplify this to:
            //var id = $tr.find("input").val();
            $('#hdnStudentId').val(StudentId);
            $(<%=txtReplyDescription.ClientID%>).val('');
            return false;
        }
        function GetStudentforFileUplaod(link) {
            var $tr = $(link).closest('tr');
            var StudentId = $tr.find("input[id$=hdnStudentId2]").val();
            // if hidden input is the only one in the row you could simplify this to:
            //var id = $tr.find("input").val();
            $('#hdnStudentId').val(StudentId);
            $(<%=UploadFile1.ClientID%>).val('');
            return false;
        }


        (() => {
            'use strict';

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            const forms = document.querySelectorAll('.needs-validation');

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms).forEach((form) => {
                form.addEventListener('submit', (event) => {
                    event.preventDefault();
                    event.stopPropagation();

                    form.classList.add('was-validated');
                }, false);
            });
        })();

    </script>


    <style>
        .body {
            background-image: url('http://localhost:58543/img/themes/BackgroundwithloginbgandLOGO.png');
            background-size: 100% 120%;
            background-attachment: inherit;
        }
    </style>
    <%--<div class="body">--%>
    <div class="container">
        <!-- START RESPONSIVE TABLES -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h1 class="panel-title">Teachers DashBoard</h1>
                             <div class="col-md-1">
                            <a href="EditTeacherProfile.aspx" class="btn btn-info btn-block" type="submit">Edit Profile</a>
                        </div>
                        <div class="col-md-3"></div>
                        <select id="lstCourses" runat="server" style="float: right; border-radius: 25px; width: 100%; height: 30px;" multiple
                            class="select"
                            data-mdb-validation="true"
                            data-mdb-valid-feedback="This value is valid"
                            data-mdb-invalid-feedback="This value is invalid"
                            data-mdb-clear-button="true">
                            <option value="MCR101">Foundations of Education</option>
                            <option value="MCR102">Functional English</option>
                            <option value="MCR103">Islamic Studies</option>
                            <option value="MCR104">Information Systems</option>
                            <option value="MCR105">Calculus-I</option>
                            <option value="MCR106">Programming Fundamentals</option>
                            <option value="MCR107">General Methods of Teaching</option>
                            <option value="MCR108">Communication Skills</option>
                            <option value="MCR109">Discrete Mathematics</option>
                            <option value="MCR110">Pakistan Studies</option>
                            <option value="MCR111">Digital Logic and Design</option>
                            <option value="MCR112">Object Oriented Programming</option>
                            <option value="MCR113">Software Engineering</option>
                            <option value="MCR114">Educational Assessment</option>
                            <option value="MCR115">Technical Writing and Presentation Skills</option>
                            <option value="MCR116">Elementary Linear Algebra</option>
                            <option value="MCR117">Introduction to Statistics and Probability</option>
                            <option value="MCR118">Data Structures and Algorithms</option>
                            <option value="MCR119">Database Systems</option>
                            <option value="MCR120">Operating Systems</option>
                            <option value="MCR121">Computer Communications and Networks</option>
                            <option value="MCR122">Curriculum Design and Instruction</option>
                            <option value="MCR123">Technology Management</option>
                            <option value="MCR124">Human Computer Interaction</option>
                            <option value="MCR125">Web Engineering</option>
                            <option value="MCR126">Database Administration and Management</option>
                            <option value="MCR127">Multimedia Systems and Design</option>
                            <option value="MCR128">System and Network Administration Windows Based</option>
                            <option value="MCR129">Object Oriented Analysis and Design</option>
                            <option value="MCR130">System and Network Administration Linux Based</option>
                             <option value="MCR131">System </option>


                        </select>

                        <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="btn btn-primary" runat="server" Text="Submit" />
                        <asp:Label ID="lblmsg" Style="visibility: hidden" runat="server" Text="Label"></asp:Label>

                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <h2 style="background-color: #FF8F49; text-align: center;">Students Enquires List</h2>

                    <div class="panel-body panel-body-table">
                        <%--           OnRowDataBound="OnRowDataBound"
                    OnSelectedIndexChanged="OnSelectedIndexChanged"
                    OnPageIndexChanging="OnPageIndexChanging" PageSize="5"--%>

                        <div class="table-responsive">
                               <asp:HiddenField ID="hdnStudentId" runat="server" Value="" ClientIDMode="Static" />
                            <asp:GridView ID="gvEnquiryList" Width="100%" runat="server" BackColor="#FF8F49" BorderColor="#FF8F49" AutoGenerateColumns="false" AllowPaging="false">
                                <Columns>
                                    <asp:BoundField ItemStyle-Width="15px" DataField="EnquiryId" HeaderText="Enquiry #" />
                                    <asp:BoundField ItemStyle-Width="15px" DataField="CREATED_BY" HeaderText="Roll No." />
                                    <asp:BoundField ItemStyle-Width="15px" DataField="STUDENT_NAME" HeaderText="Student Name" />
                                    <asp:BoundField  ItemStyle-Width="15px" DataField="STUDENT_EMAIL" HeaderText="Student Email" />
                                    <asp:BoundField ItemStyle-Width="15px" DataField="STUDENT_CONTACT" HeaderText="Phone Number" />
                                    <asp:BoundField ItemStyle-Width="15px" DataField="DESCRIPTION" HeaderText="Enquiry Description" />
                                    <%--<asp:BoundField DataField="File" HeaderText="FileUrl" />--%>
                                    <asp:TemplateField ItemStyle-Width="15px" HeaderText="File URL">
                                        <ItemTemplate >
                                            <asp:HyperLink runat="server" ItemStyle-Width="15px" id="MyLink" Text='<%# Eval("File") %>' NavigateUrl='<%# Eval("File") %>' Target="_newtab"  ></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Reply to Question">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnStudentId1" runat="server" Value='<%#Eval("CREATED_BY") %>' ClientIDMode="Static" />
                                            <asp:LinkButton ID="btnEnquires" runat="server" class="btn btn-default btn-rounded btn-sm" data-toggle="modal" data-target="#modal_reply" Text="Reply" OnClientClick="return GetStudentId(this);" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       
                                    <asp:TemplateField HeaderText="Upload file">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnStudentId2" runat="server" Value='<%#Eval("CREATED_BY") %>' ClientIDMode="Static" />
                                            <asp:LinkButton ID="fileUpload" runat="server" class="btn btn-default btn-rounded btn-sm" data-toggle="modal" data-target="#modal_file" Text="Upload File" OnClientClick="return GetStudentforFileUplaod(this);" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                        </div>

                    </div>
                 

                </div>
                   <br />
                    <br /><br />
                    <br />
                    <asp:Button ID="btn_downloadQuriesInfo" Width="100%" runat="server" CssClass="btn btn-danger" Text="Download Queries Data" OnClick="btn_downloadQuriesInfo_Click" />

            </div>

                 <div class="modal" id="modal_reply" tabindex="-1" role="dialog" aria-labelledby="defModalHead" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="defModalHead">Reply to Your Student Query</h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Reply </label>
                                    <div class="col-md-9 col-xs-12">
                                        <asp:TextBox ID="txtReplyDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Enter Your Reply Here....."></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSendReply" runat="server" Text="Send" CssClass="btn btn-default btn-primary" OnClick="btnSendReply_Click" />
                           
                            </div>
                        </div>
                    </div>
                </div>
            </div>

             <div class="modal" id="modal_file" tabindex="-1" role="dialog" aria-labelledby="defModalHeadfile" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="defModalHeadfile">Send an Attachment or a File to Your Student</h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Upload File/Attachment </label>
                                    <div class="col-md-9 col-xs-12">
                                      <%--  <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Enter Your Question Here....."></asp:TextBox>--%>
                                         <asp:FileUpload ID="UploadFile1" runat="server" />
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="upload_file" runat="server" Text="Upload" CssClass="btn btn-default btn-primary" OnClick="UploadFile" />
                                <asp:Label Id="lblMessage" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- END RESPONSIVE TABLES -->
    </div>
       <%-- </div>--%>
</asp:Content>
