using System.Data.SqlClient;
using System.Data;
using System;

namespace project
{
    public partial class StudentShowAattendance : System.Web.UI.Page
    {
        private string Username; // Declare username at the class level

        private void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["username"] != null)
                {
                    string username = Session["username"].ToString();
                    // Fetch attendance records for the logged-in student
                    Label1.Text = username;
                    Username = username;
                }

            }
        }


        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
                // Fetch attendance records for the logged-in student
                Label1.Text = username;
                Username = username;
            }
            // Fetch selected values
            string selectedProgramme = DropDownList1.SelectedValue;
            string selectedClass = DropDownList2.SelectedValue;
            string selectedSemester = DropDownListSemester.SelectedValue;
            string registrationNo = TxtBoxRegNo.Text;


            // Construct the SQL query
            string query = "SELECT * FROM AttendanceTable WHERE FIRSTNAME = @FIRSTNAME AND Program = @Program AND Class = @Class AND Semester = @Semester AND RegNo = @RegNo";

            // Establish connection and command
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CollegeDBConnectionString"].ConnectionString;
            // Replace with your actual connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters
                    command.Parameters.AddWithValue("@FIRSTNAME", Username); // Add FIRSTNAME parameter
                    command.Parameters.AddWithValue("@Program", selectedProgramme);
                    command.Parameters.AddWithValue("@Class", selectedClass);
                    command.Parameters.AddWithValue("@Semester", selectedSemester);
                    command.Parameters.AddWithValue("@RegNo", registrationNo);


                    // Create a DataTable to hold the results
                    DataTable dt = new DataTable();

                    // Execute the query
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Load data into the DataTable
                    dt.Load(reader);

                    // Close the reader and connection
                    reader.Close();
                    connection.Close();

                    // Bind the DataTable to the GridView
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    // Count statuses "P" (Present) and "A" (Absent)
                    int presentCount = 0;
                    int absentCount = 0;

                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["Status"].ToString() == "P") // Assuming 'Status' is the column indicating the attendance status
                            presentCount++;
                        else if (row["Status"].ToString() == "A")
                            absentCount++;
                    }
                    double PercentageCount = 0.0;
                    if (presentCount + absentCount > 0)
                    {
                        PercentageCount = ((double)presentCount * 100) / (presentCount + absentCount);
                        PercentageCount = Math.Round(PercentageCount, 2);
                    }
                    else
                    {
                        // If total attendance is zero, display a message
                        LblPercentage.Text = "Attendance is 0%";
                    }

                    LblTotalPresent.Text = "Total Present: " + presentCount;
                    LblTotalAbsent.Text = "Total Absent: " + absentCount;
                    LblPercentage.Text = "Total Percentage: " + PercentageCount;


                }

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your event handler code here
        }
    }
}
