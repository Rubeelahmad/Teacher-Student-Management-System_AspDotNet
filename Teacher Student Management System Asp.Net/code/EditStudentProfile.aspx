<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditStudentProfile.aspx.cs" Inherits="EditStudentProfile" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-horizontal">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Edit Profile</h3>
                                       <div class="col-md-1" style="float:right">
                            <a href="TeacherEnquiry.aspx" class="btn btn-warning btn-block" type="submit">Home</a>
                        </div>
                                </div>
                                <div class="panel-body"> 
                                    <div class="" id="divMessage" runat="server"></div>
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Name</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>                                            
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">User Name</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>                                            
                                        </div>
                                    </div>
                                    <div class="form-group">                                        
                                        <label class="col-md-3 col-xs-12 control-label">Mobile Number</label>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>            
                                        </div>
                                    </div>
                                    <div class="form-group">                                        
                                        <label class="col-md-3 col-xs-12 control-label">Email Id</label>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>            
                                        </div>
                                    </div>
                                    <div class="form-group">                                        
                                        <label class="col-md-3 col-xs-12 control-label">Password</label>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>            
                                        </div>
                                    </div>
                               <%--     <div class="form-group">                                        
                                        <label class="col-md-3 col-xs-12 control-label">Course</label>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>            
                                        </div>
                                    </div>--%>

                                </div>
                                <div class="panel-footer">                                  
                                    <asp:Button ID="btnSave" runat="server" Text="Save Changes" class="btn btn-primary pull-right" OnClick="btnSave_Click"/>
                                </div>
                            </div>
                        </div>
                            </div>
                    </div>                    
                    
                </div>
                <!-- END PAGE CONTENT WRAPPER -->                                                
</asp:Content>
