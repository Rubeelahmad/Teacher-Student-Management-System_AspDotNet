<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherEnquiry.aspx.cs" Inherits="TeacherEnquiry" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />


    <script type="text/javascript">  

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
        .mt-100 {
            margin-top: 100px
        }

        body {
            background: #00B4DB;
            background: -webkit-linear-gradient(to right, #0083B0, #00B4DB);
            background: linear-gradient(to right, #0083B0, #00B4DB);
            color: #514B64;
            min-height: 100vh
        }
    </style>



    <div class="container">
        <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
        <div class="form-group">
            <div class="row">
                  <div class="col-md-2" style="visibility:hidden;">
                    <asp:Button ID="Button2" orderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" runat="server" Text="Updates" />
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btn_checkUpdates" orderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" runat="server" Text="Updates" OnClick="btn_checkUpdates_Click" />
                </div>
                <div class="col-md-4">

                    <asp:Button ID="btnLogin" runat="server" PostBackUrl="~/EditStudentProfile.aspx" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" Text="Edit Profile"></asp:Button>
                </div>

                <div class="col-md-2"></div>

            </div>
            <br />
        </div>

        <div class="row">

            <div class="col-md-12">

                <!-- START TIMELINE FILTER -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3>Search</h3>
                        <div class="form-group">

                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon"><%--<span class="fa fa-search"  >--%>
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                    </span><%--</span>--%>
                                    <asp:TextBox ID="txtKeywordSearch" runat="server" Style="border-top-right-radius: 20px; border-bottom-right-radius: 20px;" class="form-control" placeholder="Search By UserName..."></asp:TextBox>
                                </div>


                            </div>
                        </div>


                        <div class="col-md-3">
                            <b style="font-size: 20px">Teachers:</b>
                            <asp:DropDownList ID="selectTeacher" runat="server" Style="border-radius: 25px; width: 50%; height: 30px;"
                                AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-*" style="float: left">
                            <b style="font-size: 20px;">Courses: </b>
                            <select id="lstCourses" runat="server" style="border-radius: 25px; width: 50%; height: 30px;" multiple
                                class="select"
                                data-mdb-validation="true"
                                data-mdb-valid-feedback="This value is valid"
                                data-mdb-invalid-feedback="This value is invalid"
                                data-mdb-clear-button="true">
                            </select>
                            <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="btn btn-primary" runat="server" Text="Submit" />

                        </div>



                    </div>




                </div>

            </div>

            <!-- END TIMELINE FILTER -->

        </div>

        <div class="col-md-12">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h3 class="panel-title">Teachers</h3>
                </div>
              
                <div class="panel-body panel-body-table">
                    <div class="table-responsive">
                        <asp:HiddenField ID="hdnTeacherId" runat="server" Value="" ClientIDMode="Static" />
                        <asp:GridView ID="gvTeacherList" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-actions">
                            <Columns>
                                <asp:ImageField DataImageUrlField="PIC_PATH" HeaderText="Profile Pic" ControlStyle-Height="200px" ControlStyle-Width="200px"></asp:ImageField>
                                <asp:BoundField DataField="FullName" HeaderText="Name" />

                                <asp:BoundField DataField="Email_Id" HeaderText="Email" />
                                <asp:BoundField DataField="Contact" HeaderText="Contact Number" />

                               <%-- <asp:BoundField DataField="Course" HeaderText="Courses" />--%>
                                 <asp:TemplateField HeaderText="Courses">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdnTeacherId3" runat="server" Value='<%#Eval("UserId") %>' ClientIDMode="Static" />
                                        <%--data-toggle="modal" data-target="#modal_course"--%>
                                        <asp:LinkButton ID="btnCourses" runat="server" class="btn btn-default btn-rounded btn-sm"  Text="show courses" OnClientClick="return GetTeacherIdForCourses(this);" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Ask Question">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdnTeacherId1" runat="server" Value='<%#Eval("UserId") %>' ClientIDMode="Static" />
                                        <asp:LinkButton ID="btnEnquires" runat="server" class="btn btn-default btn-rounded btn-sm" data-toggle="modal" data-target="#modal_enquire" Text="Question" OnClientClick="return GetTeacherId(this);" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Upload file">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdnTeacherId2" runat="server" Value='<%#Eval("UserId") %>' ClientIDMode="Static" />
                                        <asp:LinkButton ID="fileUpload" runat="server" class="btn btn-default btn-rounded btn-sm" data-toggle="modal" data-target="#modal_file" Text="Upload File" OnClientClick="return GetTeacherIdforFileUplaod(this);" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Remove Teacher">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdnTeacherId2_remove" runat="server" Value='<%#Eval("UserId") %>' ClientIDMode="Static" />
                                        <asp:LinkButton ID="removeTeacher" runat="server" class="btn btn-default btn-rounded btn-sm" data-toggle="modal" data-target="#modal_remove" Text="Remove" OnClientClick="return GetTeacherIdforRemove(this);" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="modal_enquire" tabindex="-1" role="dialog" aria-labelledby="defModalHead" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="defModalHead">Ask Question or Send Message to Your Teacher</h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Question </label>
                                <div class="col-md-9 col-xs-12">
                                    <asp:TextBox ID="txtEnquiryDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Enter Your Question Here....."></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSendEnquiry" runat="server" Text="Send" CssClass="btn btn-default btn-primary" OnClick="btnSendEnquiry_Click" />

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
                        <h4 class="modal-title" id="defModalHeadfile">Send an Attachment or a File to Your Teacher</h4>
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
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="modal" id="modal_remove" tabindex="-1" role="dialog" aria-labelledby="defModalRemove" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="defModalRemove">Confirmation to Remove Teacher</h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-12 col-xl-12 control-label"><h2>Are you sure? you want to delete teacher?</h2> </label>
                               <%-- <div class="col-md-9 col-xs-12">--%>
                                    <%--  <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Enter Your Question Here....."></asp:TextBox>--%>
                                    <%--<asp:FileUpload ID="FileUpload1" runat="server" />--%>
                               <%-- </div>--%>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btn_removeTecher" runat="server" Text="Remove" CssClass="btn btn-default btn-primary" OnClick="btn_removeTecher_Click" />
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="modal_course" tabindex="-1" role="dialog" aria-labelledby="coursesModalHead" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="coursesModalHead">Registered Courses </h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Your Courses: </label>
                                <div class="col-md-9 col-xs-12">
                                    <asp:TextBox ID="txtEnquirycourses" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Enter Your courses Here....."></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer" style="visibility:hidden">
                          <asp:Button ID="btnShowCourses"  runat="server" Text="Show Courses" CssClass="btn btn-default btn-primary" onclick="btnCourses_Click" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--        <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
    media="screen" />--%>

    <script type="text/javascript">
        function GetTeacherId(lnk) {
            var $tr = $(lnk).closest('tr');
            var TeacherId = $tr.find("input[id$=hdnTeacherId1]").val();
            // if hidden input is the only one in the row you could simplify this to:
            //var id = $tr.find("input").val();
            $('#hdnTeacherId').val(TeacherId);
            $(<%=txtEnquiryDescription.ClientID%>).val('');
            return false;
        }
        function GetTeacherIdforFileUplaod(link) {
            var $tr = $(link).closest('tr');
            var TeacherId = $tr.find("input[id$=hdnTeacherId2]").val();
            // if hidden input is the only one in the row you could simplify this to:
            //var id = $tr.find("input").val();
            $('#hdnTeacherId').val(TeacherId);
            $(<%=UploadFile1.ClientID%>).val('');
            return false;
        }

        function GetTeacherIdforRemove(link) {
            var $tr = $(link).closest('tr');
            var TeacherId = $tr.find("input[id$=hdnTeacherId2_remove]").val();
            // if hidden input is the only one in the row you could simplify this to:
            //var id = $tr.find("input").val();
            $('#hdnTeacherId').val(TeacherId);
          <%--  //$(<%=UploadFile1.ClientID%>).val('');--%>
              return false;
          }

        function GetTeacherIdForCourses(lnk) {
            var $tr = $(lnk).closest('tr');
            var TeacherId = $tr.find("input[id$=hdnTeacherId3]").val();
          //  alert(TeacherId);
            // if hidden input is the only one in the row you could simplify this to:
            //var id = $tr.find("input").val();
            $('#hdnTeacherId').val(TeacherId);
            $(<%=txtEnquiryDescription.ClientID%>).val('');
            if (TeacherId != "")
            {
                document.getElementById("<%=btnShowCourses.ClientID %>").click();
            }
            return false;
        }
        function ShowModal(body) {
        //    alert(body);
         //   $("#MyPopup .modal-title").html(title);
         //   $("#modal_course .modal-body").html(body);
            $("#modal_course").modal("show");
        }

    </script>
</asp:Content>
