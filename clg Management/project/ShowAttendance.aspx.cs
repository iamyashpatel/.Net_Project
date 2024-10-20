using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class ShowAttendance : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // Fetch selected values
            string selectedProgramme = DropDownList1.SelectedValue;
            string selectedClass = DropDownList2.SelectedValue;
            string selectedSemester = DropDownListSemester.SelectedValue;
            string registrationNo = TxtBoxRegNo.Text;

            // Construct the SQL query
            string query = "SELECT * FROM AttendanceTable WHERE Program = @Program AND Class = @Class AND Semester = @Semester AND RegNo = @RegNo";

            // Establish connection and command
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CollegeDBConnectionString"].ConnectionString;
            // Replace with your actual connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters
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

            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Fetch selected values
            string selectedProgramme = DropDownList1.SelectedValue;
            string selectedClass = DropDownList2.SelectedValue;
            string selectedSemester = DropDownListSemester.SelectedValue;
            string registrationNo = TxtBoxRegNo.Text;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CollegeDBConnectionString"].ConnectionString;


            string query ="SELECT FIRSTNAME, LASTNAME, COUNT(CASE WHEN Status = 'P' THEN 1 END) AS TotalPresent, COUNT(CASE WHEN Status = 'A' THEN 1 END) AS TotalAbsent, " +
                "STR(ROUND((COUNT(CASE WHEN Status = 'P' THEN 1 END) * 100.0) / COUNT(*), 2), 10, 2) AS Percentage " +
                "FROM AttendanceTable " +
                "WHERE Program = @Program AND Class = @Class AND Semester = @Semester " +
                "GROUP BY FIRSTNAME, LASTNAME";

            // Establish connection and command
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters
                    command.Parameters.AddWithValue("@Program", selectedProgramme);
                    command.Parameters.AddWithValue("@Class", selectedClass);
                    command.Parameters.AddWithValue("@Semester", selectedSemester);

                    // Create a DataTable to hold the results
                    DataTable dtAllStudents = new DataTable();

                    // Execute the query
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Load data into the DataTable
                    dtAllStudents.Load(reader);

                    // Close the reader and connection
                    reader.Close();
                    connection.Close();

                    // Bind the DataTable to the GridView
                    GridView2.DataSource = dtAllStudents;
                    GridView2.DataBind();
                }
            }
        }
    }
        
}