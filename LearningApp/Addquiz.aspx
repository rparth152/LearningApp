<%@ Page Title="Add Quiz" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="Addquiz.aspx.cs"
    Inherits="LearningApp.Addquiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap ONLY for this page -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-4">

    <!-- ================= CREATE QUIZ ================= -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">

            <h4 class="mb-3 border-bottom pb-2">Create Quiz</h4>

            <div class="mb-3">
                <asp:Label runat="server" Text="Select Course"
                    CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server"
                    CssClass="form-select"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" Text="Select Module"
                    CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server"
                    CssClass="form-select">
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" Text="Quiz Title"
                    CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"
                    CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="Button1" runat="server"
                Text="Save Quiz"
                CssClass="btn btn-primary"
                OnClick="Button1_Click" />

            <asp:Label ID="Label1" runat="server"
                CssClass="d-block mt-3"></asp:Label>

        </div>
    </div>

    <!-- ================= ADD QUESTION ================= -->
    <div class="card shadow-sm mt-4">
        <div class="card-body">

            <h4 class="mb-3 border-bottom pb-2">Add Question</h4>

            <div class="mb-3">
                <asp:Label runat="server" Text="Select Quiz"
                    CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DropDownList3" runat="server"
                    CssClass="form-select">
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" Text="Question Text"
                    CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"
                    TextMode="MultiLine" Rows="3"
                    CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" Text="Options"
                    CssClass="form-label"></asp:Label>

                <asp:TextBox ID="TextBox6" runat="server"
                    CssClass="form-control mb-2"
                    Placeholder="Option A"></asp:TextBox>

                <asp:TextBox ID="TextBox7" runat="server"
                    CssClass="form-control mb-2"
                    Placeholder="Option B"></asp:TextBox>

                <asp:TextBox ID="TextBox8" runat="server"
                    CssClass="form-control mb-2"
                    Placeholder="Option C"></asp:TextBox>

                <asp:TextBox ID="TextBox9" runat="server"
                    CssClass="form-control mb-2"
                    Placeholder="Option D"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" Text="Correct Answer"
                    CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DropDownList4" runat="server"
                    CssClass="form-select">
                    <asp:ListItem Text="A" Value="A" />
                    <asp:ListItem Text="B" Value="B" />
                    <asp:ListItem Text="C" Value="C" />
                    <asp:ListItem Text="D" Value="D" />
                </asp:DropDownList>
            </div>

            <asp:Button ID="Button3" runat="server"
                Text="Add Question"
                CssClass="btn btn-success"
                OnClick="Button3_Click" />

            <asp:Label ID="Label12" runat="server"
                CssClass="d-block mt-3"></asp:Label>

        </div>
    </div>

</div>

</asp:Content>