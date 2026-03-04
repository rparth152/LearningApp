<%@ Page Title="Create Course" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="CreateCourse.aspx.cs"
    Inherits="LearningApp.CreateCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap ONLY for this page -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <!-- CREATE COURSE -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">

                <h4 class="mb-3 border-bottom pb-2">Create Course</h4>

                <div class="mb-3">
                    <asp:Label ID="Label1" runat="server" Text="Course Name"
                        CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="Label2" runat="server" Text="Description"
                        CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"
                        TextMode="MultiLine" Rows="4"
                        CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="Label3" runat="server" Text="Field"
                        CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server"
                        CssClass="form-select"></asp:DropDownList>
                </div>

                <asp:Button ID="Button1" runat="server"
                    Text="Save Course"
                    CssClass="btn btn-primary" OnClick="Button1_Click"
                   />

                <br />

            </div>
        </div>

       <div class="card shadow-sm mt-4">
    <div class="card-body">

        <h4 class="mb-3 border-bottom pb-2">Add Module</h4>
        <p class="mb-3 border-bottom pb-2">
           <b> <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></b>
        </p>
        <p class="mb-3 border-bottom pb-2">
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
        </p>

        <div class="mb-3">
            <asp:Label ID="Label4" runat="server" Text="Module Title"
                CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"
                CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <asp:Label ID="Label5" runat="server" Text="Module Content"
                CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"
                TextMode="MultiLine" Rows="3"
                CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <asp:Label ID="Label6" runat="server" Text="Upload Videos"
                CssClass="form-label"></asp:Label>

            <asp:FileUpload ID="FileUpload1" runat="server"
                CssClass="form-control"
                AllowMultiple="true" />
            <small class="text-muted">
                Supported: mp4, mkv, avi
            </small>
        </div>

        <asp:Button ID="Button2" runat="server"
            Text="Add Module"
            CssClass="btn btn-success" OnClick="Button2_Click"
            />

        <asp:Label ID="LabelMsg" runat="server"
            CssClass="d-block mt-3"></asp:Label>

    </div>
</div>

</asp:Content>