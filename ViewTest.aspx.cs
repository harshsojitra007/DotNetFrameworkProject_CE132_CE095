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
    public partial class ViewTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["testid"] == null)
            {
                if (Session["logInState"] == null)
                {
                    Response.Redirect("/Login.aspx");
                }
                else
                {
                    Response.Redirect("/Home.aspx");
                }
            }
            Session.Add("testId", Request["testid"].ToString());
        }

        protected void SubmitTest(object sender, EventArgs e)
        {
            int marks = 0;

            foreach(ListViewDataItem item in ListViewQuestions.Items)
            {
                RadioButton opt1 = (RadioButton)(item.FindControl("A")),
                    opt2 = (RadioButton)(item.FindControl("B")),
                    opt3 = (RadioButton)(item.FindControl("C")),
                    opt4 = (RadioButton)(item.FindControl("D"));
                Label correctAnswer = (Label)(item.FindControl("CorrectAnswerLabel"));
                string correctAnswerStr = correctAnswer.Text;

                if((opt1.Checked == true) && correctAnswerStr.Equals(opt1.ID))
                {
                    ++marks;
                }else if((opt2.Checked == true) && correctAnswerStr.Equals(opt2.ID))
                {
                    ++marks;
                }else if(opt3.Checked == true && correctAnswerStr.Equals(opt3.ID))
                {
                    ++marks;
                }else if(opt4.Checked == true && correctAnswerStr.Equals(opt4.ID))
                {
                    ++marks;
                }
            }
            string connectionString = WebConfigurationManager.ConnectionStrings["userConnection"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            string query = "UPDATE Test SET Score = @newScore WHERE TestId = @testId and StudentId = @studentId";

            try
            {
                sqlConnection.Open();
                using (sqlConnection)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM TEST WHERE TESTID = @testId and STUDENTID = @studentId", sqlConnection);
                    cmd.Parameters.Add(new SqlParameter("testId", Session["testId"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("studentId", Session["logInState"]));

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        marks = Math.Max(marks, int.Parse(reader["score"].ToString()));
                    }
                    cmd.Dispose();
                    reader.Close();
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    adapter.UpdateCommand = new SqlCommand(query, sqlConnection);
                    adapter.UpdateCommand.Parameters.Add(new SqlParameter("newScore", marks));
                    adapter.UpdateCommand.Parameters.Add(new SqlParameter("testId", Session["testId"]));
                    adapter.UpdateCommand.Parameters.Add(new SqlParameter("studentId", Session["logInState"]));
                    adapter.UpdateCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                }
                TestResult.Text = $"You scored {marks} in exam";
            }catch(Exception ex)
            {
                TestResult.Text = $"Some Error has Occurred while updating your marks {ex.Message}";
            }
        }
    }
}