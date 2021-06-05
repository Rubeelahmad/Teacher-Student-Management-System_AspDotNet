<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<head runat="server">
    <title>Login</title>
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
            background-size: 100% 100%;
            background-attachment: inherit;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server" class="row align-items-center justify-content-center h-100">

        <div class="container" style="text-align: center">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br />
                    <br />
                    <br />
                    <h3 style="color: #FFFF">Sign In</h3>

                    <div class="form-horizontal">
                        <div class="" id="divMessage" runat="server" />
                        <div class="form-group">
                            <div class="col-md-12">
                                <%-- CssClass="form-control"--%>
                                <asp:TextBox runat="server" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" ID="txtUsername" ClientIDMode="Static" placeholder="Username"  />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox ID="txtPassword" CssClass="form-control" BorderStyle="Solid" BorderColor="#FF8F49" TextMode="Password" runat="server" ClientIDMode="Static" placeholder="Password" />
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-md-12">
                                <asp:Button ID="btnLogin" runat="server" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" OnClick="btnLogin_Click" class="btn btn-info btn-block" Text="Sign In"></asp:Button>
                            </div>
                        </div>

                        <h3 style="color: #FFFF"><strong>OR</strong></h3>
                        <h4 style="color: #FFFF"><strong>Register now</strong></h4>

                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:Button ID="Button1" runat="server" PostBackUrl="~/Registration.aspx" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" Text="Register now"></asp:Button>
                            </div>
                        </div>




                    </div>
                </div>
            </div>
            
        </div>
       
    </form >


</body>
