<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>


 <head runat="server">    
     <title>Registration</title>
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
            
            background-attachment:inherit;
        }

    </style>

    </head>

<body>
    <form id="form1" runat="server" class="row align-items-center justify-content-center h-100">
        <div class="container" style="text-align:center">
                <div class="row">
                     <div class="col-md-4"></div>
                <div class="col-md-4">
                <div id="divRegister" class="">
                   <h5 style="color:#FFFF"><strong>Welcome</strong>, Choose Type To Register </h5><br />

                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:HiddenField ID="hdnRegistration" runat="server" Value="" ClientIDMode="Static" />
                        </div>
                             <div class="form-group">
                            <div class="col-md-12">
                                <asp:Button ID="Button1" runat="server" PostBackUrl="~/StudentRegistration.aspx" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" Text="Student Register"></asp:Button>
                            </div>
                        </div>

                   

                            <div class="form-group">
                            <div class="col-md-12">
                                <asp:Button ID="btn_teacherRegister" runat="server" PostBackUrl="~/TeacherRegistration.aspx" BorderStyle="Solid" BorderColor="#FF8F49" BackColor="#FF8F49" Style="text-align: center; color: #FFFF" ClientIDMode="Static" class="btn btn-info btn-block" Text="Teacher Register"></asp:Button>
                            </div>
                        </div>

                    </div>
                </div>
                    </div>
                    
            </div>
        </div>

 
    </form>
</body>


