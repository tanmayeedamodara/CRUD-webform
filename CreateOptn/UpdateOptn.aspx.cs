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
    public partial class UpdateOptn : System.Web.UI.Page
    {
        private string conString;
        private string id;

        public UpdateOptn()
        {
            conString = ConfigurationManager.ConnectionStrings["DbTrial1ConString"].ConnectionString;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if(!IsPostBack)
            {
                id = Request.QueryString["id"];
                ViewState["id"] = id;
            }
            else
            {
                id = ViewState["id"] as string;
            }*/

        }

        protected void Button_Update_Data(object sender, EventArgs e)
        {
            //id = ViewState["id"] as string;
            id = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(id))
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    try
                    {
                        if (!string.IsNullOrEmpty(tbName.Text) && !string.IsNullOrEmpty(tbDate.Text) &&
                            ddlCategory.SelectedIndex != 0 && !string.IsNullOrEmpty(tbPrice.Text))
                        {
                            int prodId;
                            if (int.TryParse(id, out prodId))
                            {
                                SqlCommand command = new SqlCommand("AlterProductTable", con);
                                con.Open();
                                command.CommandType = CommandType.StoredProcedure;
                                command.Parameters.AddWithValue("@ProdID", prodId);
                                command.Parameters.AddWithValue("@ProdName", tbName.Text);
                                command.Parameters.AddWithValue("@ProdDate", tbDate.Text);
                                command.Parameters.AddWithValue("@ProdCat", ddlCategory.SelectedValue.ToString());
                                command.Parameters.AddWithValue("@ProdPrice", tbPrice.Text);

                                Label1.Text = (string)id;
                                command.ExecuteNonQuery();

                                Label1.Text = "Product is updated";
                                Label1.ForeColor = System.Drawing.Color.Green;

                                ResetFields();
                            }
                        }
                        else
                        {
                            Label1.Text = "Enter all values";
                            Label1.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "Error occured: " + ex.Message + " prodid" + id.ToString();
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            else
            {
                Label1.Text = "Ivalid Product id";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ResetFields()
        {
            tbName.Text = "";
            tbDate.Text = "";
            ddlCategory.SelectedIndex = 0;
            tbPrice.Text = "";
        }

        protected void Back_to_read_click(object sender, EventArgs e)
        {
            if (!Page.IsValid || Page.IsValid)
            {
                Response.Redirect("ReadOptn.aspx");
            }
        }
    }
}