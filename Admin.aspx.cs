using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Data;

namespace DotNetProject1
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logInState"]?.ToString() != "admin@project")
            {
                Response.Redirect("/Login.aspx");
            }
            AddStudentPanel.Visible = false;
        }

        protected void Show_Panel(object sender, EventArgs e)
        {
            if (AddStudentPanel.Visible.Equals(true))
                Response.Redirect("/Admin.aspx");
            else
                AddStudentPanel.Visible = true;
        }

        protected void addNewStudent(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["userConnection"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlConnection;
            //cmd.CommandText = "SELECT * FROM STUDENT";
            cmd.CommandText = "INSERT INTO STUDENT (Id, Name, Branch, Password) Values (@Id, @Name, @Branch, @Password)";
            cmd.Parameters.AddWithValue("Id", InputNewId.Text);
            cmd.Parameters.AddWithValue("Name", InputNewName.Text);
            cmd.Parameters.AddWithValue("Branch", InputNewBranch.Text);
            cmd.Parameters.AddWithValue("Password", InputNewPassword.Text);

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            try
            {
                using (sqlConnection)
                {
                    sqlConnection.Open();
                    adapter.InsertCommand = cmd;
                    adapter.InsertCommand.ExecuteNonQuery();
                    //adapter.Fill(dataSet, "Student");
                    //DataTable table = dataSet.Tables["Student"];
                    //DataRow row = table.NewRow();

                    //row["Id"] = InputNewId.Text;
                    //row["Name"] = InputNewName.Text;
                    //row["Branch"] = InputNewBranch.Text;
                    //row["Password"] = InputNewPassword.Text;

                    //table.Rows.Add(row);
                    //adapter.Update(dataSet, "Student");

                    sqlConnection.Close();
                }
            }catch(Exception ex)
            {
                Response.Write("Internal Error Occurred!!");
            }
            cmd.Dispose();
            adapter.Dispose();
            dataSet.Dispose();

            cmd = new SqlCommand();
            cmd.Connection = sqlConnection;
            cmd.CommandText = "SELECT * FROM TEST";

            adapter = new SqlDataAdapter(cmd);
            dataSet = new DataSet();

            try
            {
                using (sqlConnection)
                {
                    sqlConnection.Open();
                    adapter.Fill(dataSet, "Test");
                    DataTable table = dataSet.Tables["Test"];
                    DataRow row = table.NewRow();

                    row["Branch"] = InputNewBranch.Text;
                    row["StudentId"] = InputNewId.Text;

                    table.Rows.Add(row);
                    adapter.Update(dataSet, "Test");
                }
            }catch(Exception ex)
            {
                Response.Write("Internal Error Occurred!!");
            }
            Response.Redirect("/Admin.aspx");
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("logInState");
            Session.Remove("userName");
            Response.Redirect("/Login.aspx");
        }
    }
}