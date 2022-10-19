<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DotNetProject1.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <style type="text/css">
        .d-flex{
            display: flex;
            justify-content: center;
            align-items: center;
            margin: .5rem;
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
        <form id="AdminForm" runat="server">
            <div class="flex-row">
                <asp:Label ID="AdminLabel" runat="server" CssClass="d-flex" Font-Names="Verdana" Font-Size="XX-Large" ForeColor="Green" Text="Welcome to Admin Panel"></asp:Label>
                <asp:Button ID="AdminLogoutButton" runat="server" CausesValidation="False" CssClass="btn btn-danger" OnClick="Logout" Text="Logout" />
            </div>

            <div class="d-flex flex-row" runat="server">

            <div class="student-details-div" runat="server">

                <div class="flex-row" runat="server">
                    <asp:Label ID="StudentLabel" runat="server" CssClass="d-flex" Font-Names="Verdana" Font-Size="X-Large" ForeColor="Blue" Text="All Student Details"></asp:Label>
                    <asp:Button ID="AddStudentButton" runat="server" CssClass="btn btn-light" Text="Add Student" OnClick="Show_Panel" CausesValidation="False" />
                </div>

                    <asp:Panel ID="AddStudentPanel" runat="server">
                        <div class="input-div" runat="server">
                            <div class="d-flex flex-row">
                                <asp:Label class="d d-flex" ID="InputIdLabel" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Large" Text="Id"></asp:Label>
                                <asp:TextBox CssClass="d-flex input-tag" ID="InputNewId" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InputIdValidator" runat="server" ErrorMessage="Field is required!" Font-Names="Verdana" Font-Size="Large" ForeColor="Red" ControlToValidate="InputNewId"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="input-div" runat="server">
                            <div class="d-flex flex-row">
                                <asp:Label class="d d-flex" ID="InputNameLabel" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Large" Text="Name"></asp:Label>
                                <asp:TextBox CssClass="d-flex input-tag" ID="InputNewName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required!" Font-Names="Verdana" Font-Size="Large" ForeColor="Red" ControlToValidate="InputNewName"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="input-div" runat="server">
                            <div class="d-flex flex-row">
                                <asp:Label class="d d-flex" ID="InputLabelBranch" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Large" Text="Branch"></asp:Label>
                                <asp:TextBox CssClass="d-flex input-tag" ID="InputNewBranch" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is required!" Font-Names="Verdana" Font-Size="Large" ForeColor="Red" ControlToValidate="InputNewBranch"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="input-div" runat="server">
                            <div class="d-flex flex-row">
                                <asp:Label class="d d-flex" ID="InputPasswordLabel" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Large" Text="Password"></asp:Label>
                                <asp:TextBox CssClass="d-flex input-tag" ID="InputNewPassword" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InputPasswordValidator" runat="server" ErrorMessage="Field is required!" ControlToValidate="InputNewPassword" Font-Names="Verdana" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <asp:Button CssClass="btn btn-success" ID="AddNewStudentButton" runat="server" OnClick="addNewStudent" Text="Add" />
                    </asp:Panel>

                <asp:GridView ID="StudentGridView" CssClass="m-4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="StudentDetails" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
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
                <asp:SqlDataSource ID="StudentDetails" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" SelectCommand="SELECT * FROM [Student] ORDER BY [Id]" DeleteCommand="DELETE FROM [Student] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Student] ([Id], [Name], [Password]) VALUES (@Id, @Name, @Password)" UpdateCommand="UPDATE [Student] SET [Name] = @Name, [Password] = @Password WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Id" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <div class="student-details-div" runat="server">

                <div class="flex-row" runat="server">
                    <asp:Label ID="Label1" runat="server" CssClass="d-flex" Font-Names="Verdana" Font-Size="X-Large" ForeColor="Blue" Text="All Student Details"></asp:Label>
                </div>

                <asp:GridView ID="GridView1" CssClass="m-4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="StudentTestDetails" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                        <asp:BoundField DataField="TestId" HeaderText="TestId" SortExpression="TestId" />
                        <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
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
                <asp:SqlDataSource ID="StudentTestDetails" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" SelectCommand="SELECT s.[Id], s.[Name], s.[Branch], t.[TestId], t.[Score] FROM [Student] as s inner join [test] as t on s.[Id] = t.[StudentId]" DeleteCommand="DELETE FROM [Student] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Student] ([Id], [Name], [Password]) VALUES (@Id, @Name, @Password)" UpdateCommand="UPDATE [Student] SET [Name] = @Name, [Password] = @Password WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Id" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            </div>
        </form>
</body>
</html>
