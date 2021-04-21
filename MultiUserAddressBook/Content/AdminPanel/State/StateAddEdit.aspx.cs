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

public partial class Content_AdminPanel_State_StateAddEdit : System.Web.UI.Page
{
    #region Load Page
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
            FillCountryDropDownList();
            if (Request.QueryString["StateID"] == null)
            {
                lblPageHeader.Text = "State Add";
            }
            else
            {
                lblPageHeader.Text = "State Edit";
                FillStateForm(Convert.ToInt32(Request.QueryString["StateID"].ToString().Trim()));
            }
        }
    }
    #endregion

    #region Fill Country Drop Down List
    private void FillCountryDropDownList()
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
                    objCmd.CommandText = "PR_Country_SelectForDropDownListByUserID";

                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        ddlCountry.DataValueField = "CountryID";
                        ddlCountry.DataTextField = "CountryName";

                        ddlCountry.DataSource = objSDR;
                        ddlCountry.DataBind();

                        ddlCountry.Items.Insert(0, new ListItem("-- Select State --", "-1"));
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

    #region Fill State Form
    private void FillStateForm(SqlInt32 StateID)
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
                    objCmd.CommandText = "PR_State_SelectByPKUserID";

                    objCmd.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID;
                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if (objSDR.HasRows)
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["StateName"].Equals(DBNull.Value))
                                    txtStateName.Text = objSDR["StateName"].ToString().Trim();

                                if (!objSDR["CountryID"].Equals(DBNull.Value))
                                    ddlCountry.SelectedValue = objSDR["CountryID"].ToString().Trim();
                                
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

    #region Button: Cancel State
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Content/AdminPanel/State/StateList.aspx");
    }
    #endregion

    #region Button: Save State
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Vairable
        string strConnection = ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString;
        string strError = "";
        SqlInt32 CountryID = SqlInt32.Null;
        SqlString StateName = SqlString.Null;
        SqlInt32 UserID = SqlInt32.Null;

        #endregion

        #region Server Validation
        if (txtStateName.Text.Trim() == "")
            strError += "Enter State +</br>";

        if (ddlCountry.SelectedIndex == 0)
            strError += "Select Country";

        if (strError.Trim() != "")
        {
            lblErrorMessage.Text = strError;
            return;
        }
        #endregion

        #region Assign Value
        if (txtStateName.Text.Trim() != "")
            StateName = txtStateName.Text.Trim();

        if (ddlCountry.SelectedIndex > 0)
            CountryID = Convert.ToInt32(ddlCountry.SelectedValue);

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

                    if (Request.QueryString["StateID"] == null)
                    {
                        objCmd.CommandText = "PR_State_InsertByUserID";
                    }
                    else
                    {
                        objCmd.CommandText = "PR_State_UpdateByPKUserID";
                        objCmd.Parameters.Add("@StateID", SqlDbType.Int).Value = Request.QueryString["StateID"].ToString().Trim();
                    }

                    objCmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID;
                    objCmd.Parameters.Add("@StateName", SqlDbType.VarChar).Value = StateName;
                    objCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;

                    objCmd.ExecuteNonQuery();

                    if (Request.QueryString["StateID"] == null)
                    {
                        lblSuccess.Text = "Data Insert Successfully";
                        txtStateName.Text = "";
                        ddlCountry.SelectedIndex = 0;
                        txtStateName.Focus();
                    }
                    else
                    {
                        Response.Redirect("~/Content/AdminPanel/State/StateList.aspx");
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



