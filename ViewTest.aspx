<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTest.aspx.cs" Inherits="DotNetProject1.ViewTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Page</title>
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
        .flex-column{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            row-gap: 1rem;
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
        .auto-style1 {
            margin-left: 41280px;
        }
    </style>
</head>
<body>
    <form id="form" runat="server">
        <div class="auto-style1">
            <asp:Label ID="TestResult" runat="server" Font-Names="Verdana" Font-Size="XX-Large" ForeColor="Green"></asp:Label>
            <asp:ListView ID="ListViewQuestions" runat="server" DataSourceID="TestDataSource">
                <EditItemTemplate>
                    <li style="background-color: #999999;">QuestionString:
                        <asp:TextBox ID="QuestionStringTextBox" runat="server" Text='<%# Bind("QuestionString") %>' />
                        <br />
                        Option1:
                        <asp:TextBox ID="Option1TextBox" runat="server" Text='<%# Bind("Option1") %>' />
                        <br />
                        Option2:
                        <asp:TextBox ID="Option2TextBox" runat="server" Text='<%# Bind("Option2") %>' />
                        <br />
                        Option3:
                        <asp:TextBox ID="Option3TextBox" runat="server" Text='<%# Bind("Option3") %>' />
                        <br />
                        Option4:
                        <asp:TextBox ID="Option4TextBox" runat="server" Text='<%# Bind("Option4") %>' />
                        <br />
                        CorrectAnswer:
                        <asp:TextBox ID="CorrectAnswerTextBox" runat="server" Text='<%# Bind("CorrectAnswer") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </li>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">QuestionString:
                        <asp:TextBox ID="QuestionStringTextBox" runat="server" Text='<%# Bind("QuestionString") %>' />
                        <br />Option1:
                        <asp:TextBox ID="Option1TextBox" runat="server" Text='<%# Bind("Option1") %>' />
                        <br />Option2:
                        <asp:TextBox ID="Option2TextBox" runat="server" Text='<%# Bind("Option2") %>' />
                        <br />Option3:
                        <asp:TextBox ID="Option3TextBox" runat="server" Text='<%# Bind("Option3") %>' />
                        <br />Option4:
                        <asp:TextBox ID="Option4TextBox" runat="server" Text='<%# Bind("Option4") %>' />
                        <br />
                        CorrectAnswer:
                        <asp:TextBox ID="CorrectAnswerTextBox" runat="server" Text='<%# Bind("CorrectAnswer") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </li>
                </InsertItemTemplate>
                <ItemSeparatorTemplate>
<br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li style="background-color: #E0FFFF; color: #333333;">QuestionString:
                        <asp:Label ID="QuestionStringLabel" runat="server" Text='<%# Eval("QuestionString") %>' />
                        <br />
                        Option1:
                        <asp:RadioButton GroupName="SelectAnswer" ID="A" runat="server" Text='<%# Eval("Option1") %>' />
                        <br />
                        Option2:
                        <asp:RadioButton GroupName="SelectAnswer" ID="B" runat="server" Text='<%# Eval("Option2") %>' />
                        <br />
                        Option3:
                        <asp:RadioButton GroupName="SelectAnswer" ID="C" runat="server" Text='<%# Eval("Option3") %>' />
                        <br />
                        Option4:
                        <asp:RadioButton GroupName="SelectAnswer" ID="D" runat="server" Text='<%# Eval("Option4") %>' />
                        <br />
                        <asp:Label ID="CorrectAnswerLabel" runat="server" Text='<%# Eval("CorrectAnswer") %>' Visible="false" />
                        <br />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="text-align: center;background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="TestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnectionString %>" SelectCommand="SELECT QuestionString, Option1, Option2, Option3, Option4, CorrectAnswer from Questions where Branch = @Branch and testId = @testId">
                <SelectParameters>
                    <asp:SessionParameter Name="Branch" SessionField="Branch" />
                    <asp:SessionParameter Name="testId" SessionField="testId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:Button CssClass="d-flex" ID="SubmitTestButton" runat="server" Text="Submit Test" OnClick="SubmitTest" />
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to home</asp:HyperLink>
        
    </form>
</body>
</html>
