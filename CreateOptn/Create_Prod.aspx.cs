using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace CRUD_webform
{
    public partial class Create_Prod : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.ConnectionStrings["DbTrial1ConString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btn1Insert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                try
                {
                    if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && DropDownList1.SelectedIndex != 0)
                    {
                        SqlCommand cmdIns = new SqlCommand("InsertVals", con);
                        cmdIns.CommandType = CommandType.StoredProcedure;
                        cmdIns.Parameters.AddWithValue("@Name", TextBox1.Text);
                        cmdIns.Parameters.AddWithValue("@Date", TextBox2.Text);
                        cmdIns.Parameters.AddWithValue("@Category", DropDownList1.Text);
                        cmdIns.Parameters.AddWithValue("@Price", TextBox3.Text);

                        con.Open();
                        cmdIns.ExecuteNonQuery();

                        Label1.Text = "New product "+ TextBox1.Text + " inserted";
                        Label1.ForeColor = System.Drawing.Color.Green;
                        ResetFields();

                    }
                    else
                    {
                        Label1.Text = "Enter valid values";
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch(Exception ex)
                {
                    Label1.Text = "Error occurred: " + ex.Message;
                    Label1.ForeColor = System.Drawing.Color.DarkRed;
                }
                finally
                {
                    con.Close();
                }
            }
        }
        
        protected void ResetFields()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            DropDownList1.SelectedIndex = 0;
        }

        protected void Btn2Read_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReadOptn.aspx");
        }
    }
}
