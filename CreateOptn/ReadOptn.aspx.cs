using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CRUD_webform
{
    public partial class ReadOptn : System.Web.UI.Page
    {
        private string conString;
        public ReadOptn()
        {
            conString = ConfigurationManager.ConnectionStrings["DbTrial1ConString"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Click any button";
            Label1.ForeColor = System.Drawing.Color.Gray;
            GvBindData();
        }

        public void GvBindData()
        {
            using(SqlConnection con = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Product_Test", con);
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
        protected void GridView1_Edit(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "getID")
            {
                int prodID = Convert.ToInt32(e.CommandArgument);

                string id = prodID.ToString();
                string queryString = $"id={id}";
                Response.Redirect($"UpdateOptn.aspx?{queryString}");
            }
        }
        protected void GridView1_Delete(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "getName")
            {
                string prodName = e.CommandArgument.ToString();

                using(SqlConnection con = new SqlConnection(conString))
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("DeleteProduct", con);
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProdName", prodName);
                        cmd.ExecuteNonQuery();

                        GvBindData();
                        Label1.Text = "The slected product is deleted";
                        Label1.ForeColor = System.Drawing.Color.Green;
                    }
                    catch(Exception ex)
                    {
                        Label1.Text = "Error occurred: " + ex.Message;
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
        protected void Back_to_insert_click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Prod.aspx");
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(conString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SearchProds", con);
                    /*cmd.CommandText = "SearchProds";
                    cmd.Connection = con;*/

                    con.Open();

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@test", TextBox1.Text);
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }

                catch(Exception ex)
                {
                    Response.Write("Error occurred : " + ex.Message);
                }
            }
        }
    }
}