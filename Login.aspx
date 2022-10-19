<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DotNetProject1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <style type="text/css">
        .d-flex{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .main-outer-form{
            display: flex;
            flex-direction: column;
            margin: 5rem auto;
            width: max-content;
        }
        form{
            background: #fefefa !important;
            margin: auto;
            /* background: #89cff0 !important; */
            padding: 2.5rem 6rem;
            border-radius: 1rem;
            border: 1px solid black;
            width: fit-content;
        }
        .dropdown{
            margin: 1rem;
        }
        .btn-light{
            border: 2px solid black;
            border-radius: .3rem;
        }
        .whole-form{
            display: flex;
            width: 100%;
            margin: 3rem auto;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .input-div{
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            column-gap: 1rem;
            margin: 1rem;
        }
        .flex-row{
            display: flex;
            flex-direction: row;
            column-gap: 1rem;
        }
        .input-tag{
            display: flex;
            margin: 0.3rem 0 !important;
            font-family: Verdana !important;
            font-weight: 400 !important;
            font-size: medium !important;
            outline: 1px solid black;
            border-radius: 1rem;
        }
    </style>
</head>
<body>
    <form class="main-outer-form" id="form1" runat="server">
        <div runat="server" class="d-flex">
            <asp:Label ID="LoginLabel" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="XX-Large" ForeColor="Green" Text="Login"></asp:Label>
        </div>

        <div class="d-flex whole-form" runat="server">

            <%--<div class="d-flex flex-row" runat="server">

            <asp:DropDownList class="dropdown btn btn-light" ID="BranchSelection" runat="server">
                <asp:ListItem Selected="True">CE</asp:ListItem>
                <asp:ListItem>IT</asp:ListItem>
                <asp:ListItem>CH</asp:ListItem>
                <asp:ListItem>MH</asp:ListItem>
            </asp:DropDownList>

            </div>--%>

            <div class="input-div" runat="server">
                <div class="d-flex flex-row">
                    <asp:Label class="d d-flex" ID="InputIdLabel" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Large" Text="Id"></asp:Label>
                    <asp:RequiredFieldValidator ID="InputIdValidator" runat="server" ErrorMessage="Field is required!" Font-Names="Verdana" Font-Size="Large" ForeColor="Red" ControlToValidate="InputId"></asp:RequiredFieldValidator>
                </div>
                <asp:TextBox CssClass="d-flex input-tag" ID="InputId" runat="server"></asp:TextBox>
            </div>

            <div class="input-div" runat="server">
                <div class="d-flex flex-row">
                    <asp:Label class="d d-flex" ID="InputPasswordLabel" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Large" Text="Password"></asp:Label>
                    <asp:RequiredFieldValidator ID="InputPasswordValidator" runat="server" ErrorMessage="Field is required!" ControlToValidate="InputPassword" Font-Names="Verdana" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <asp:TextBox CssClass="d-flex input-tag" ID="InputPassword" runat="server"></asp:TextBox>
            </div>
            <asp:Button CssClass="btn btn-success" ID="LoginButton" runat="server" OnClick="handleLogin" Text="Submit" />
        </div>
    </form>
</body>
</html>
