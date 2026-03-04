<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageCategories.aspx.cs" Inherits="LearningApp.ManageCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables CSS -->
<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet"/>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function () {
        $('#<%= gvCategories.ClientID %>').DataTable();
    });
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-4">

    <h3 class="mb-4">Manage Categories</h3>

    <!-- Add Category -->
    <div class="card p-3 mb-4">
        <div class="row">
            <div class="col-md-8">
                <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" Placeholder="Enter Category Name"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnAdd" runat="server" Text="Add Category"
                    CssClass="btn btn-primary w-100"
                    OnClick="btnAdd_Click" />
            </div>
        </div>
    </div>

    <!-- Categories Grid -->
    <asp:GridView ID="gvCategories" runat="server"
        CssClass="table table-bordered table-striped"
        AutoGenerateColumns="False"
        DataKeyNames="fieldid"
        OnRowEditing="gvCategories_RowEditing"
        OnRowUpdating="gvCategories_RowUpdating"
        OnRowCancelingEdit="gvCategories_RowCancelingEdit"
        OnRowDeleting="gvCategories_RowDeleting">

        <Columns>

            <asp:BoundField DataField="fieldid" HeaderText="ID" ReadOnly="true" />

            <asp:BoundField DataField="fieldname" HeaderText="Category Name" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton
                        ID="btnEdit"
                        runat="server"
                        CommandName="Edit"
                        CssClass="btn btn-primary btn-sm"
                        OnClientClick="return confirm('Are You Sure Want to edit Fields');">
                         Edit
                    </asp:LinkButton>

                    <asp:LinkButton
                        ID="btnDelete"
                        runat="server"
                        CommandName="Delete"
                        CssClass="btn btn-danger btn-sm"
                        OnClientClick="return confirm('Are you sure?');">
                        Delete
                    </asp:LinkButton>
                </ItemTemplate>

                <EditItemTemplate>
                    <asp:LinkButton
                        ID="btnUpdate"
                        runat="server"
                        CommandName="Update"
                        CssClass="btn btn-primary btn-sm">
                        Update
                    </asp:LinkButton>

                    <asp:LinkButton
                        ID="btnCancel"
                        runat="server"
                        CommandName="Cancel"
                        CssClass="btn btn-secondary btn-sm">
                        Cancel
                    </asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>

</div>

</asp:Content>