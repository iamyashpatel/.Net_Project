using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class UploadAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the GridView with data from the database
                BindGridView();
            }
        }

        protected void BindGridView()
        {
            // Connection string to your database
            // Assuming your database connection string is stored in web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CollegeDBConnectionString"].ConnectionString;

            // Query to retrieve data from your database
            string query = "SELECT REGNO, FIRSTNAME, LASTNAME FROM StudentInfo";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Open the database connection
                    con.Open();

                    // Execute the query and fetch data into a DataTable
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Bind the DataTable to the GridView
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    // Close the database connection
                    con.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string Status, Authorized;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CollegeDBConnectionString"].ConnectionString);
            try
            {
                
                CheckBox ChckBoxStatus, ChckBoxAuthorized;
                foreach (GridViewRow row in GridView1.Rows)
                {
                    //Status = "1";                 
                    //Authorized = "1";                                 
                    ChckBoxStatus = (CheckBox)row.FindControl("ChckBoxStatus");
                    if (ChckBoxStatus.Checked)
                    {
                        Status = "P";
                    }
                    else
                    {
                        Status = "A";

                    }
                    string selectedValue = DropDownList1.SelectedValue;
                    string selectedValue1 = DropDownList2.SelectedValue;
                    String SelectedValue2 = DropDownListSemester.SelectedValue;

                    conn.Open();
                    SqlCommand cmd = conn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into AttendanceTable values('" + selectedValue + "', '" + selectedValue1 + "','" + SelectedValue2 + "','" + row.Cells[0].Text + "', '" + row.Cells[1].Text + "', '" + row.Cells[2].Text + "', '" + TxtBoxWork.Text + "', '" + TxtBoxDate.Text + "',  '" + Status + "')";
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("Record Added Successfully!");
                }
            }

            catch (Exception Ex)
            {
                Response.Write("Error:" + Ex.ToString());
            }
        }

        protected void BtnView_Click(object sender, EventArgs e)
        {
            // Code to handle the view button click event
            // You can retrieve data from the GridView and perform necessary actions here
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your event handling code here
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // Get the selected date from the Calendar control
            DateTime selectedDate = Calendar1.SelectedDate;

            // Display the selected date in the TextBox
            TxtBoxDate.Text = selectedDate.ToString("yyyy-MM-dd");
        }


    }
}
