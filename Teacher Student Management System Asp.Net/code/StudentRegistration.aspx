<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentRegistration.aspx.cs" Inherits="StudentRegistration" %>



<head runat="server">
    <title>Student Registration</title>
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
    <div class="container" style="text-align: center">
            <div class="row">
               
                <div class="col-md-4"></div>
                <div id="divStudent" class="col-md-4">
                    
                     <br />
                <br /><br />
                 <br />
                    <br /><br />
                    <div class="" id="divMessage" runat="server"></div>

                    <h4 style="color: #FFFF;text-align:center;">Student Registration Form</h4>
                    
                    <div class="form-horizontal">
                       
                        
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" placeholder="Name" required />
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server"  ID="txtUsername" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" placeholder="Username" required />
                            </div>
                        </div>
                      
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49"  placeholder="Password" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtConfirmPassword"  CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" placeholder="Repeat Password"  required/>
                            </div>
                        </div>
                    <%--<div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAddress" CssClass="form-control" placeholder="Address" />
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtContact" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49"  placeholder="Mobile Number" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49"  placeholder="Email Address" required />
                            </div>
                        </div>


                  <%-- <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtCourse" CssClass="form-control"  placeholder="Enter Course" />
                            </div>
                        </div>--%>
                        <div class="row">
                            <div class="col-md-6">
                                
                                 <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" Text="Register"></asp:Button>
                            </div>
                            <div class="col-md-6">
                                 <asp:LinkButton ID="btnLogin" runat="server" PostBackUrl="~/Login.aspx" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF"  class="btn btn-info btn-block" Text="Sign In"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>

