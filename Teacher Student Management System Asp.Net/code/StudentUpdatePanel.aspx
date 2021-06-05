<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentUpdatePanel.aspx.cs" Inherits="StudentUpdatePanel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

 
    <script type="text/javascript">  

    </script>

       <div class="container">
        <!-- START RESPONSIVE TABLES -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h1 class="panel-title">Student Panel for Updates</h1>
                         
                             <div class="col-md-1" style="float:right">
                            <a href="EditStudentProfile.aspx" class="btn btn-info btn-block" type="submit">Edit Profile</a>
                        </div>
                           <div class="col-md-1" style="float:right">
                            <a href="TeacherEnquiry.aspx" class="btn btn-warning btn-block" type="submit">Home</a>
                        </div>
                        <div class="col-md-2"></div>

                    </div>
                    <br />
                    <br />
   
                    <h2 style="background-color: #FF8F49; text-align: center;">Students Updates List</h2>

                    <div class="panel-body panel-body-table">

                        <div class="table-responsive">
                               
                          
                            <asp:GridView ID="gvUpdatesList" Width="100%" runat="server" BackColor="#FF8F49" BorderColor="#FF8F49" AutoGenerateColumns="false" AllowPaging="false" >
                                <columns>
                                    <asp:BoundField ItemStyle-Width="15px" DataField="ReplyId" HeaderText="Reply #" />
                                    <asp:BoundField ItemStyle-Width="15px" DataField="CREATED_BY_TeacherID" HeaderText="Teacher Id" />
                                    <asp:BoundField ItemStyle-Width="15px"  DataField="Teacher_NAME" HeaderText="Teacher Name" />
                                    <asp:BoundField  ItemStyle-Width="15px"  DataField="Teacher_EMAIL" HeaderText="Teacher Email" />
                                    <asp:BoundField ItemStyle-Width="15px" Visible="false" DataField="Teacher_CONTACT" HeaderText="Teacher Phone" />
                                    <asp:BoundField ItemStyle-Width="15px" DataField="DESCRIPTION" HeaderText="Enquiry Description" />
                               
                                    <asp:TemplateField ItemStyle-Width="15px" HeaderText="File URL">
                                        <ItemTemplate >
                                            <asp:HyperLink runat="server" ItemStyle-Width="15px" id="MyLink" Text='<%# Eval("File") %>' NavigateUrl='<%# Eval("File") %>' Target="_newtab"  ></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                </columns>
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
                    <br />

                    <asp:Button ID="btn_downloadUpdatesInfo" Width="100%" runat="server" CssClass="btn btn-danger" Text="Download Updates Data" OnClick="btn_downloadUpdatesInfo_Click" />

            </div>

        </div>
        <!-- END RESPONSIVE TABLES -->
    </div>
</asp:Content>


