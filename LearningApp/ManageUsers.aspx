<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="LearningApp.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables CSS -->
<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet"/>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function () {
        $('#<%= gvUsers.ClientID %>').DataTable();
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-4">

    <h3 class="mb-4">Manage Users</h3>

    <asp:GridView ID="gvUsers" runat="server"
        CssClass="table table-bordered table-striped"
        AutoGenerateColumns="False"
        DataKeyNames="uid"
       OnRowDeleting="gvUSers_RowDeleting">

        <Columns>
            <asp:TemplateField HeaderText="Id">
             <ItemTemplate>
              <asp:Label ID="Label1" runat="server" Text='<%#Eval("uid") %>'></asp:Label>
             </ItemTemplate>
                </asp:TemplateField> 

            <asp:BoundField DataField="uname" HeaderText="Name" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="rolename" HeaderText="Role" />
            <asp:BoundField DataField="fieldname" HeaderText="Field" />

            <asp:TemplateField HeaderText="Instructor">
                <ItemTemplate>
                    <%# Convert.ToBoolean(Eval("IsInstructor")) ? "Yes" : "No" %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>

                   

                     <asp:Button ID="Button2"  CssClass="btn btn-danger btn-sm" runat="server" CommandName="Delete" Text="Delete" />

                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>

</div>

</asp:Content>
