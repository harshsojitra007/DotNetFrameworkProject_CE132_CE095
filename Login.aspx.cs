using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetProject1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void handleLogin(object sender, EventArgs e)
        {
            string id = InputId.Text, password = InputPassword.Text;
            
            string connectionString = WebConfigurationManager.ConnectionStrings["userConnection"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            
            sqlConnection.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlConnection;
            cmd.CommandText = $"SELECT * FROM STUDENT WHERE ID=@id";
            cmd.Parameters.Add(new SqlParameter("id", id));

            try
            {
                using (sqlConnection)
                {

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        string originalPass = reader["password"].ToString();
                        if(originalPass == password)
                        {
                            Session.Add("logInState", id);
                            Session.Add("userName", reader["name"]);
                            
                            if(id == "admin@project")
                            {
                                Response.Redirect("/Admin.aspx");
                            }
                            else
                            {
                                Session.Add("Branch", reader["branch"]);
                                Response.Redirect("/Home.aspx");
                            }
                        }
                        else
                        {
                            Response.Write("Invalid Password");
                        }
                    }
                }
            }catch(Exception ex)
            {
                Response.Write($"Invalid Credentials");
            }

        }
    }
}