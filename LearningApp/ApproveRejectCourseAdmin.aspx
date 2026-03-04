<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ApproveRejectCourseAdmin.aspx.cs" Inherits="LearningApp.ApproveRejectCourseAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables CSS -->
<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet"/>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function () {
        $('#<%= gvCourses.ClientID %>').DataTable();
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

    <h3 class="mb-4">Pending Course Approval</h3>

    <asp:GridView ID="gvCourses" runat="server" 
        CssClass="table table-bordered table-striped"
        AutoGenerateColumns="False"
        DataKeyNames="courseid"
        OnRowCommand="gvCourses_RowCommand">

        <Columns>

            <asp:BoundField DataField="coursename" HeaderText="Course Name" />
            <asp:BoundField DataField="uname" HeaderText="Instructor" />
            <asp:BoundField DataField="fieldname" HeaderText="Field" />
            <asp:BoundField DataField="status" HeaderText="Status" />

          <asp:TemplateField HeaderText="Action">
    <ItemTemplate>
          <asp:Button ID="btnPending" runat="server"
               Text="Pending"
            CssClass="btn btn-warning btn-sm ms-2"
            CommandName="Pending"
            CommandArgument='<%# Eval("courseid") %>' />

        <asp:Button ID="btnApprove" runat="server"
            Text="Approve"
            CssClass="btn btn-success btn-sm"
            CommandName="Approve"
            CommandArgument='<%# Eval("courseid") %>' />

        <asp:Button ID="btnReject" runat="server"
            Text="Reject"
            CssClass="btn btn-danger btn-sm ms-2"
            CommandName="Reject"
            CommandArgument='<%# Eval("courseid") %>' />

    </ItemTemplate>
</asp:TemplateField>

        </Columns>
    </asp:GridView>

</div>

</asp:Content>
