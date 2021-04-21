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

public partial class Content_AdminPanel_City_CityAddEdit : System.Web.UI.Page
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
            FillStateDropDownList();
            if (Request.QueryString["CityID"] == null)
            {
                lblPageHeader.Text = "City Add";
            }
            else
            {
                lblPageHeader.Text = "City Edit";
                FillCityForm(Convert.ToInt32(Request.QueryString["CityID"].ToString().Trim()));
            }
        }
    }
    #endregion

    #region Fill State Drop Down List
    private void FillStateDropDownList()
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
                    objCmd.CommandText = "PR_State_SelectForDropDownListByUserID";

                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        ddlState.DataValueField = "StateID";
                        ddlState.DataTextField = "StateName";

                        ddlState.DataSource = objSDR;
                        ddlState.DataBind();

                        ddlState.Items.Insert(0, new ListItem("-- Select State --", "-1"));
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

    #region Fill City Form
    private void FillCityForm(SqlInt32 CityID)
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
                    objCmd.CommandText = "PR_City_SelectByPKUserID";

                    objCmd.Parameters.Add("@CityID", SqlDbType.Int).Value = CityID;
                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if (objSDR.HasRows)
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["CityName"].Equals(DBNull.Value))
                                    txtCityName.Text = objSDR["CityName"].ToString().Trim();

                                if (!objSDR["StateID"].Equals(DBNull.Value))
                                    ddlState.SelectedValue = objSDR["StateID"].ToString().Trim();

                                if (!objSDR["PinCode"].Equals(DBNull.Value))
                                    txtPinCode.Text = objSDR["PinCode"].ToString().Trim();

                                if (!objSDR["STDCode"].Equals(DBNull.Value))
                                    txtSTDCode.Text = objSDR["STDCode"].ToString().Trim();
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

    #region Button: Cancel City
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Content/AdminPanel/City/CityList.aspx");
    }
    #endregion

    #region Button: Save City
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Vairable
        string strConnection = ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString;
        string strError = "";
        SqlInt32 StateID = SqlInt32.Null;
        SqlString CityName = SqlString.Null;
        SqlString PinCode = SqlString.Null;
        SqlString STDCode = SqlString.Null;
        SqlInt32 UserID = SqlInt32.Null;
        #endregion

        #region Server Validation
        if (txtCityName.Text.Trim() == "")
            strError += "Enter City +</br>";

        if (ddlState.SelectedIndex == 0)
            strError += "Select State";

        if (Session["UserID"] != null)
            UserID = Convert.ToInt32(Session["UserID"]);

        if (strError.Trim() != "")
        {
            lblErrorMessage.Text = strError;
            return;
        }
        #endregion

        #region Assign Value
        if (txtCityName.Text.Trim() != "")
            CityName = txtCityName.Text.Trim();

        if (ddlState.SelectedIndex > 0)
            StateID = Convert.ToInt32(ddlState.SelectedValue);

        if (txtPinCode.Text.Trim() != "")
            PinCode = txtPinCode.Text.Trim();

        if (txtSTDCode.Text.Trim() != "")
            STDCode = txtSTDCode.Text.Trim();

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

                    if (Request.QueryString["CityID"] == null)
                    {
                        objCmd.CommandText = "PR_City_InsertByUserID";
                    }
                    else
                    {
                        objCmd.CommandText = "PR_City_UpdateByPKUserID";
                        objCmd.Parameters.Add("@CityID", SqlDbType.Int).Value = Request.QueryString["CityID"].ToString().Trim();
                    }

                    objCmd.Parameters.Add("@CityName", SqlDbType.VarChar).Value = CityName;
                    objCmd.Parameters.Add("@PinCode", SqlDbType.VarChar).Value = PinCode;
                    objCmd.Parameters.Add("@STDCode", SqlDbType.VarChar).Value = STDCode;
                    objCmd.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID;
                    objCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;

                    objCmd.ExecuteNonQuery();

                    if (Request.QueryString["CityID"] == null)
                    {
                        lblSuccess.Text = "Data Insert Successfully";
                        txtCityName.Text = "";
                        txtPinCode.Text = "";
                        txtSTDCode.Text = ""; 
                        ddlState.SelectedIndex = 0;
                        txtCityName.Focus();
                    }
                    else
                    {
                        Response.Redirect("~/Content/AdminPanel/City/CityList.aspx");
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



