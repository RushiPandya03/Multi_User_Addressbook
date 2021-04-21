using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_AdminPanel_ContactCategory_ContactCategoryAddEdit : System.Web.UI.Page
{
    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Check Valid User

        if (Session["UserID"] == null)
        {
            Response.Redirect("~/Content/AdminPanel/Login.aspx");
        }
        #endregion
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ContactCategoryID"] == null)
            {
                lblPageHeader.Text = "ContactCategory Add";
            }
            else
            {
                lblPageHeader.Text = "ContactCategory Edit";
                FillContactCategoryForm(Convert.ToInt32(Request.QueryString["ContactCategoryID"].ToString().Trim()));
            }
        }
    }
    #endregion

    #region Fill ContactCategory Form
    private void FillContactCategoryForm(SqlInt32 ContactCategoryID)
    {
        string strConnection = ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString;

        using (SqlConnection objConn = new SqlConnection(strConnection))
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                    objConn.Open();

                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "PR_ContactCategory_SelectByPKUserID";

                    objCmd.Parameters.Add("@ContactCategoryID", SqlDbType.Int).Value = ContactCategoryID;
                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if (objSDR.HasRows)
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["ContactCategoryName"].Equals(DBNull.Value))
                                    txtContactCategoryName.Text = objSDR["ContactCategoryName"].ToString().Trim();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State == ConnectionState.Open)
                    objConn.Close();
            }
        }
    }
    #endregion

    #region Button: Cancel ContactCategory
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Content/AdminPanel/ContactCategory/ContactCategoryList.aspx");
    }
    #endregion

    #region Button: Ssave ContactCategory
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Vairable
        string strConnection = ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString;
        string strError = "";
        SqlString ContactCategoryName = SqlString.Null;
        SqlString ContactCategoryCode = SqlString.Null;
        SqlInt32 UserID = SqlInt32.Null;
        #endregion

        #region Server Validation
        if (txtContactCategoryName.Text.Trim() == "")
            strError += "Enter ContactCategory Name+</br>";

        if (strError.Trim() != "")
        {
            lblErrorMessage.Text = strError;
            return;
        }
        #endregion

        #region Assign Value
        if (txtContactCategoryName.Text.Trim() != "")
            ContactCategoryName = txtContactCategoryName.Text.Trim();

        if (Session["UserID"] != null)
            UserID = Convert.ToInt32(Session["UserID"]);
        #endregion

        using (SqlConnection objConn = new SqlConnection(strConnection))
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                    objConn.Open();

                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    objCmd.CommandType = CommandType.StoredProcedure;

                    if (Request.QueryString["ContactCategoryID"] == null)
                    {
                        objCmd.CommandText = "PR_ContactCategory_InsertByUserID";
                    }
                    else
                    {
                        objCmd.CommandText = "PR_ContactCategory_UpdateByPKUserID";
                        objCmd.Parameters.Add("@ContactCategoryID", SqlDbType.Int).Value = Request.QueryString["ContactCategoryID"].ToString().Trim();
                    }

                    objCmd.Parameters.Add("@ContactCategoryName", SqlDbType.VarChar).Value = ContactCategoryName;
                    objCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;

                    objCmd.ExecuteNonQuery();

                    if (Request.QueryString["ContactCategoryID"] == null)
                    {
                        lblSuccess.Text = "Data Insert Successfully";
                        txtContactCategoryName.Text = "";
                        txtContactCategoryName.Focus();
                    }
                    else
                    {
                        Response.Redirect("~/Content/AdminPanel/ContactCategory/ContactCategoryList.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State == ConnectionState.Open)
                    objConn.Close();
            }
        }
    }
    #endregion
}