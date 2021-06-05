<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherRegistration.aspx.cs" Inherits="TeacherRegistration" %>


<head runat="server">
     <title>Teacher Registration</title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <!-- END META SECTION -->

    <!-- CSS INCLUDE -->
    <%-- <link rel="stylesheet" type="text/css"   id="theme" href="css/theme-black.css"/>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- EOF CSS INCLUDE -->

    <style>
        body {
            background-image: url('http://localhost:58543/img/themes/BackgroundwithloginbgandLOGO.png');
            background-size: 100% 120%;
            background-attachment: inherit;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="row align-items-center justify-content-center h-100">
        <div class="container" >
            <div class="row">
                   <div class="col-md-4"></div>
                <!--Teacher Registration-->
                <div id="divTeacher" class="col-md-4">
                                 
                     <br />
                <br /><br />
                 <br />
                    <br /><br />
                    <br />

                    <br />
                    <div class="" id="divMessage" runat="server"></div>

                    <h4 style="color: #FFFF;text-align:center;">Teacher Registration Form</h4>
                    <div class="form-horizontal">
                      

                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherName" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" placeholder="Name" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" ID="txtTeacherUserName" placeholder="Username" required  />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherPassword" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" TextMode="Password" placeholder="Password"  required />
                            </div>
                        </div>
                      <%--  <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherSubjects" CssClass="form-control" placeholder="Subject Name"  />
                            </div>
                        </div>--%>
                <%--        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherExperience" CssClass="form-control" placeholder="Years Of Experience"  />
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherMobile" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" placeholder="Mobile Number" required  />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherEmail" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" placeholder="Email Address" required />
                            </div>
                        </div>
                     <%--   <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherBoardName" CssClass="form-control" placeholder="Board"  />
                            </div>
                        </div>--%>
                        
                   <%--     <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherSubjectsTag" CssClass="tagsinput" placeholder="Add Subjects"  />
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:DropDownList ID="ddlTeacherGender" runat="server" BorderStyle="Solid" BorderColor="#FF8F49" class="form-control">
                                    <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                   <%--     <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtTeacherAddress" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Rows="5" />
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <div class="col-md-12">
                                
                                <a href="#" id="lnkAttachSOW" style="border:solid; border-color:#FF8F49; background-color:#FF8F49"  class="btn btn-info btn-block">Upload Profile Picture</a>
                                <asp:FileUpload runat="server" ID="fuimgInp" style="visibility:hidden"  />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                              
                             <asp:Button ID="btnTeacherRegistration" runat="server" OnClick="btnTeacherRegistration_Click" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" Text="Register"></asp:Button>

                            </div>
                            <div class="col-md-6">
                               
                              <asp:LinkButton ID="btnLogin" runat="server" PostBackUrl="~/Login.aspx" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" Text="Sign In"></asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>
                <!--End Teacher Registration-->
            </div>
        </div>

        <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>
        <!-- END PLUGINS -->

        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap-select.js"></script>
        <script type="text/javascript" src="js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        <!-- END THIS PAGE PLUGINS -->

        <!-- START TEMPLATE -->

        <script type="text/javascript" src="js/plugins.js"></script>
        <script type="text/javascript" src="js/actions.js"></script>
        <!-- END TEMPLATE -->
    </form>
</body>
<script type="text/javascript">
$("#lnkAttachSOW").click(function () {
    $("#fuimgInp").click();
});
</script>

