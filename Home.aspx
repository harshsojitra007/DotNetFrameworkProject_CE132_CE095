<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DotNetProject1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <style type="text/css">
        .d-flex{
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 1.5rem;
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
            width: 100%;
        }
        .dropdown{
            margin: 1rem;
        }
        .btn-light{
            border: 2px solid black;
            border-radius: .3rem;
        }
        .student-details-div{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: max-content;
            margin: 5rem 0;
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
            justify-content: space-evenly;
            align-items: center;
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
    <form id="form" runat="server">

        <div class="d-inline-flex flex-row" style="width: 100%">
            <asp:Label CssClass="d-flex" ID="WelcomeStudentLabel" runat="server" Font-Names="Verdana" Font-Size="XX-Large" Text="Welcome"></asp:Label>
            <asp:Label runat="server" Text='<%# Eval(Session["userName"].ToString()) %>'></asp:Label>
            <asp:Button Width="100px" Height="50px" ID="StudentLogoutButton" runat="server" CausesValidation="False" CssClass="btn btn-danger" OnClick="Logout" Text="Logout" />
        </div>
        <asp:GridView CssClass="d-flex" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="StudentTestDataSource" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TestId" HeaderText="TestId" SortExpression="TestId" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
                <asp:HyperLinkField DataNavigateUrlFields="TestId" DataNavigateUrlFormatString="/ViewTest.aspx?testid={0}" HeaderText="view test" Text="view test" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="StudentTestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" SelectCommand="SELECT Distinct TestId, Score from test where Branch = @Branch and studentid = @studentId">
            <SelectParameters>
                <asp:SessionParameter Name="Branch" SessionField="Branch" />
                <asp:SessionParameter Name="studentId" SessionField="logInState" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
