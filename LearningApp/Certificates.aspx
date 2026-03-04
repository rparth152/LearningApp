<%@ Page Title="My Certificates" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Certificates.aspx.cs" Inherits="LearningApp.Certificates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Isse content sidebar se chipkega nahi aur thoda saaf dikhega */
        .cert-wrapper {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border-top: 5px solid #38bdf8;
        }
        .cert-header {
            border-bottom: 2px solid #f1f5f9;
            margin-bottom: 25px;
            padding-bottom: 15px;
        }
        .cert-item { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding: 20px; 
            border: 1px solid #e2e8f0; 
            border-radius: 10px; 
            margin-bottom: 15px;
            transition: 0.3s ease;
        }
        .cert-item:hover { 
            border-color: #38bdf8; 
            background: #f8fafc; 
            transform: translateX(5px); 
        }
        /* Yahan naam change hua hai */
        .view-btn { 
            background: #1e293b; 
            color: #fff; 
            padding: 10px 20px; 
            border-radius: 6px; 
            text-decoration: none; 
            font-size: 14px; 
            font-weight: 600;
            transition: 0.3s;
        }
        .view-btn:hover { 
            background: #38bdf8; 
            box-shadow: 0 4px 10px rgba(56, 189, 248, 0.3);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cert-wrapper">
        <div class="cert-header">
            <h2 style="color: #1e293b;">My Achievements</h2>
            <p style="color: #64748b; font-size: 14px;">Aapne jitne bhi courses complete kiye hain unke certificates yahan hain.</p>
        </div>

        <div class="cert-item">
            <div>
                <strong style="display:block; color:#1e293b; font-size: 17px;">Full Stack Web Development</strong>
                <small style="color:#94a3b8;">Issued on: 03 March 2026</small>
            </div>
            <%-- Naam yahan change kiya hai --%>
            <a href="ViewCertificate.aspx?id=1" class="view-btn">View Certificate</a>
        </div>

        <div class="cert-item">
            <div>
                <strong style="display:block; color:#1e293b; font-size: 17px;">SQL Database Masterclass</strong>
                <small style="color:#94a3b8;">Issued on: 28 Feb 2026</small>
            </div>
            <%-- Naam yahan change kiya hai --%>
            <a href="ViewCertificate.aspx?id=2" class="view-btn">View Certificate</a>
        </div>
    </div>
</asp:Content>