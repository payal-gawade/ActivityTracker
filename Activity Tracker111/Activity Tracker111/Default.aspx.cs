using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Activity_Tracker111
{

    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindActivityGrid();
            }
        }

        protected void SubmitActivity(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ActivityTrackerDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ActivityRecords (Name, Weight, Height, Gender, WakeUpTime, Gym, Meditation, MeditationMinutes, Reading, ReadingPages, ActivityDate) " +
                               "VALUES (@Name, @Weight, @Height, @Gender, @WakeUpTime, @Gym, @Meditation, @MeditationMinutes, @Reading, @ReadingPages, @ActivityDate)";

                SqlCommand cmd = new SqlCommand(query, con);

                // Set parameter values from the form inputs
                cmd.Parameters.AddWithValue("@Name", name.Value);
                cmd.Parameters.AddWithValue("@Weight", Convert.ToDecimal(weight.Value));
                cmd.Parameters.AddWithValue("@Height", Convert.ToDecimal(height.Value));
                cmd.Parameters.AddWithValue("@Gender", gender.Value);
                cmd.Parameters.AddWithValue("@WakeUpTime", wakeUpTime.Value);
                cmd.Parameters.AddWithValue("@Gym", gym.Checked);
                cmd.Parameters.AddWithValue("@Meditation", meditation.Checked);
                cmd.Parameters.AddWithValue("@MeditationMinutes", Convert.ToInt32(meditationMinutes.Value));
                cmd.Parameters.AddWithValue("@Reading", reading.Checked);
                cmd.Parameters.AddWithValue("@ReadingPages", Convert.ToInt32(readingPages.Value));
                cmd.Parameters.AddWithValue("@ActivityDate", Convert.ToDateTime(date.Value));

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                BindActivityGrid(); // Refresh the grid after submission
            }
        }

        private void BindActivityGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ActivityTrackerDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ID, Name, Weight, Height, Gender, WakeUpTime, Gym, Meditation, MeditationMinutes, Reading, ReadingPages, ActivityDate " +
                               "FROM ActivityRecords ORDER BY ActivityDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                activityGridView.DataSource = dt;

            }
        }
    }
}
