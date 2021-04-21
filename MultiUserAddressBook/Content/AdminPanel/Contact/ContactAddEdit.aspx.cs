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

public partial class Content_AdminPanel_Contact_ContactAddEdit : System.Web.UI.Page
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
            FillBloodGroupDropDownList();
            FillContactCategoryCheckBoxList();

            if (Request.QueryString["ContactID"] == null)
            {
                lblPageHeader.Text = "Contact Add";
            }
            else
            {
                lblPageHeader.Text = "Contact Edit";
                FillContactForm(Convert.ToInt32(Request.QueryString["ContactID"].ToString().Trim()));
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

                        ddlCountry.Items.Insert(0, new ListItem("-- Select Country --", "-1"));
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

    #region ddlCountry - Selected Index Changed

    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCountry.SelectedIndex>0)
        {
            FillStateDropDownListByCountryID(Convert.ToInt32(ddlCountry.SelectedValue));
        }
        else
        {
            ddlState.Items.Clear();
            ddlState.Items.Insert(0, new ListItem("-- Select State --", "-1"));

            ddlCity.Items.Clear();
            ddlCity.Items.Insert(0, new ListItem("-- Select City --", "-1"));
        }
    }
    #endregion

    #region Fill StateDropDownListByCountryID
    private void FillStateDropDownListByCountryID(SqlInt32 CountryID)
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
                    objCmd.CommandText = "PR_State_SelectForDropDownListByCountryIDUserID";

                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];
                    objCmd.Parameters.Add("CountryID", SqlDbType.Int).Value = CountryID;

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if (objSDR.HasRows)
                        {
                            ddlState.DataValueField = "StateID";
                            ddlState.DataTextField = "StateName";
                            ddlState.DataSource = objSDR;
                            ddlState.DataBind();
                            ddlState.Items.Insert(0, new ListItem("-- Select State --", "-1"));
                        }
                        else
                        {
                            ddlState.Items.Clear();
                            ddlState.Items.Insert(0, new ListItem("-- Select State --", "-1"));

                            ddlCity.Items.Clear();
                            ddlCity.Items.Insert(0, new ListItem("-- Select City --", "-1"));
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

    #region ddlState - Selected Index Changed

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlState.SelectedIndex > 0)
        {
            FillCityeDropDownListByStateID(Convert.ToInt32(ddlState.SelectedValue));
        }
        else
        {
            ddlCity.Items.Clear();
            ddlCity.Items.Insert(0, new ListItem("-- Select City --", "-1"));
        }
    }
    #endregion

    #region Fill CityDropDownListByStateID
    private void FillCityeDropDownListByStateID(SqlInt32 StateID)
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
                    objCmd.CommandText = "PR_City_SelectForDropDownListByStateIDUserID";

                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];
                    objCmd.Parameters.Add("StateID", SqlDbType.Int).Value = StateID;

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if(objSDR.HasRows)
                        {
                            ddlCity.DataValueField = "CityID";
                            ddlCity.DataTextField = "CityName";
                            ddlCity.DataSource = objSDR;
                            ddlCity.DataBind();
                            ddlCity.Items.Insert(0, new ListItem("-- Select City --", "-1"));
                        }
                        else
                        {
                            ddlCity.Items.Clear();
                            ddlCity.Items.Insert(0, new ListItem("-- Select City --", "-1"));
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

    #region Fill City Drop Down List
    private void FillCityDropDownList()
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
                    objCmd.CommandText = "PR_City_SelectForDropDownListByUserID";

                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"]; 

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        ddlCity.DataValueField = "CityID";
                        ddlCity.DataTextField = "CityName";

                        ddlCity.DataSource = objSDR;
                        ddlCity.DataBind();

                        ddlCity.Items.Insert(0, new ListItem("-- Select City --", "-1"));
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

    #region Fill BloodGroup Drop Down List
    private void FillBloodGroupDropDownList()
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
                    objCmd.CommandText = "PR_BloodGroup_SelectForDropDownListByUserID";

                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"]; 

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        ddlBloodGroup.DataValueField = "BloodGroupID";
                        ddlBloodGroup.DataTextField = "BloodGroupName";

                        ddlBloodGroup.DataSource = objSDR;
                        ddlBloodGroup.DataBind();

                        ddlBloodGroup.Items.Insert(0, new ListItem("-- Select BloodGroup --", "-1"));
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

    #region Fill ContactCategory Checkbox List
    private void FillContactCategoryCheckBoxList()
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
                    objCmd.CommandText = "PR_ContactCategory_SelectForDropDownListByUserID";

                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        cblContactCategory.DataValueField = "ContactCategoryID";
                        cblContactCategory.DataTextField = "ContactCategoryName";

                        cblContactCategory.DataSource = objSDR;
                        cblContactCategory.DataBind();
                        
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

    #region Fill Contact Form
    private void FillContactForm(SqlInt32 ContactID)
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
                    objCmd.CommandText = "PR_Contact_SelectByPKUserID";

                    objCmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = ContactID;
                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if (objSDR.HasRows)
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["ContactName"].Equals(DBNull.Value))
                                    txtContactName.Text = objSDR["ContactName"].ToString().Trim();

                                if (!objSDR["Address"].Equals(DBNull.Value))
                                    txtAddress.Text = objSDR["Address"].ToString().Trim();

                                if (!objSDR["MobileNo"].Equals(DBNull.Value))
                                    txtMobileNo.Text = objSDR["MobileNo"].ToString().Trim();

                                if (!objSDR["Gender"].Equals(DBNull.Value))
                                {
                                    if (objSDR["Gender"].ToString().Trim() == "Male")
                                        btnMale.Checked = true;
                                    if (objSDR["Gender"].ToString().Trim() == "Female")
                                        btnFemale.Checked = true;
                                }
                                  
                                if (!objSDR["Profession"].Equals(DBNull.Value))
                                    txtProfession.Text = objSDR["Profession"].ToString().Trim();

                                if (!objSDR["PhoneNo"].Equals(DBNull.Value))
                                    txtPhoneNo.Text = objSDR["PhoneNo"].ToString().Trim();

                                if (!objSDR["Email"].Equals(DBNull.Value))
                                    txtEmail.Text = objSDR["Email"].ToString().Trim();

                                if (!objSDR["BirthDate"].Equals(DBNull.Value))
                                    txtBirthDate.Text = objSDR["BirthDate"].ToString().Trim();

                                if (!objSDR["CityID"].Equals(DBNull.Value))
                                    ddlCity.SelectedValue = objSDR["CityID"].ToString().Trim();


                                if (!objSDR["StateID"].Equals(DBNull.Value))
                                {
                                    ddlState.SelectedValue = objSDR["StateID"].ToString().Trim();
                                    ddlState_SelectedIndexChanged(null, null);
                                }

                                if (!objSDR["CountryID"].Equals(DBNull.Value))
                                {
                                    ddlCountry.SelectedValue = objSDR["CountryID"].ToString().Trim();
                                    ddlCountry_SelectedIndexChanged(null, null);
                                }
                                    
                                

                                if (!objSDR["BloodGroupID"].Equals(DBNull.Value))
                                    ddlBloodGroup.SelectedValue = objSDR["BloodGroupID"].ToString().Trim();
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
        FillContactWiseContactCategory();
    }
    #endregion

    #region Button: Cancel Contact
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Content/AdminPanel/Contact/ContactList.aspx");
    }
    #endregion

    #region Button: Save Contact
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Vairable
        string strConnection = ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString;
        string strError = "";
        int ContactID = 0;
        SqlInt32 CountryID = SqlInt32.Null;
        SqlInt32 StateID = SqlInt32.Null;
        SqlInt32 BloodGroupID = SqlInt32.Null;
        SqlInt32 ContactCategoryID = SqlInt32.Null;
        SqlInt32 CityID = SqlInt32.Null;
        SqlString ContactName = SqlString.Null;
        SqlString Address = SqlString.Null;
        SqlString MobileNo = SqlString.Null;
        SqlString PhoneNo = SqlString.Null;
        SqlString Email = SqlString.Null;
        SqlString Gender = SqlString.Null;
        SqlString BirthDate = SqlString.Null;
        SqlString Profession = SqlString.Null;
        SqlInt32 UserID = SqlInt32.Null;
        #endregion

        #region Server Validation
        if (txtContactName.Text.Trim() == "")
            strError += "Enter Contact +</br>";

        if (txtAddress.Text.Trim() == "")
            strError += "Enter Address +</br>";

        if (txtMobileNo.Text.Trim() == "")
            strError += "Enter MobileNo +</br>";

        if (btnMale.Checked == false && btnFemale.Checked==false)
            strError += "Enter Gender +</br>";

        if (txtProfession.Text.Trim() == "")
            strError += "Enter Profession +</br>";
       
        if (strError.Trim() != "")
        {
            lblErrorMessage.Text = strError;
            return;
        }
        #endregion

        #region Assign Value
        if (txtContactName.Text.Trim() != "")
            ContactName = txtContactName.Text.Trim();

        if (txtAddress.Text.Trim() != "")
            Address = txtAddress.Text.Trim();

        if (txtMobileNo.Text.Trim() != "")
            MobileNo = txtMobileNo.Text.Trim();

        if (btnMale.Checked != false)
            Gender = btnMale.Text.Trim();

        if (btnFemale.Checked != false)
            Gender = btnFemale.Text.Trim();

        if (txtProfession.Text.Trim() != "")
            Profession = txtProfession.Text.Trim();
        
        if (txtPhoneNo.Text.Trim() != "")
            PhoneNo = txtPhoneNo.Text.Trim();

        if (txtEmail.Text.Trim() != "")
            Email = txtEmail.Text.Trim();

        if (txtBirthDate.Text.Trim() != "")
            BirthDate = txtBirthDate.Text.Trim();

        if (txtProfession.Text.Trim() != "")
            Profession = txtProfession.Text.Trim();

        if (ddlCity.SelectedIndex == -1)
            CityID = SqlInt32.Null;
        else if (ddlCity.SelectedIndex != 0)
            CityID = Convert.ToInt32(ddlCity.SelectedValue);
        
        if (ddlState.SelectedIndex == -1)
            StateID = SqlInt32.Null;
        else if(ddlState.SelectedIndex != 0)
            StateID = Convert.ToInt32(ddlState.SelectedValue);

        if (ddlCountry.SelectedIndex != 0)
            CountryID = Convert.ToInt32(ddlCountry.SelectedValue);

        if (ddlBloodGroup.SelectedIndex != 0)
            BloodGroupID = Convert.ToInt32(ddlBloodGroup.SelectedValue);
        
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

                    if (Request.QueryString["ContactID"] == null)
                    {
                        objCmd.CommandText = "PR_Contact_InsertByUserID";
                        objCmd.Parameters.Add("@ContactID", SqlDbType.Int).Direction = ParameterDirection.Output;
                    }
                    else
                    {
                        objCmd.CommandText = "PR_Contact_UpdateByPKUserID";
                        objCmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = Request.QueryString["ContactID"].ToString().Trim();
                    }

                    objCmd.Parameters.Add("@ContactName", SqlDbType.VarChar).Value = ContactName;
                    objCmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = MobileNo;
                    objCmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar).Value = PhoneNo;
                    objCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                    objCmd.Parameters.Add("@CityID", SqlDbType.Int).Value = CityID;
                    objCmd.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID;
                    objCmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID;
                    objCmd.Parameters.Add("@BloodGroupID", SqlDbType.Int).Value = BloodGroupID;
                    objCmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = Address;
                    objCmd.Parameters.Add("@BirthDate", SqlDbType.VarChar).Value = BirthDate;
                    objCmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = Gender;
                    objCmd.Parameters.Add("@Profession", SqlDbType.VarChar).Value = Profession;
                    objCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;
                    
                    objCmd.ExecuteNonQuery();

                    if (Request.QueryString["@ContactID"] == null)
                        ContactID = int.Parse(objCmd.Parameters["@ContactID"].Value.ToString());
                    else
                        ContactID = Convert.ToInt32(Request.QueryString["ContactID"].ToString().Trim());

                    AddUpdateDatainContactWiseContactCategory(ContactID);
                    
                    if (Request.QueryString["ContactID"] == null)
                    {
                        lblSuccess.Text = "Data Insert Successfully";
                        txtContactName.Text = "";
                        txtMobileNo.Text = "";
                        txtPhoneNo.Text = "";
                        txtEmail.Text = "";
                        ddlCity.SelectedIndex = -1;
                        ddlState.SelectedIndex = -1;
                        ddlCountry.SelectedIndex = 0;
                        ddlBloodGroup.SelectedIndex = 0;
                        cblContactCategory.ClearSelection();
                        txtAddress.Text = "";
                        txtBirthDate.Text = "";
                        btnFemale.Checked = false;
                        txtProfession.Text = "";
                        txtContactName.Focus();
                    }
                    else
                    {
                        Response.Redirect("~/Content/AdminPanel/Contact/ContactList.aspx");
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

    #region Fill Data in ContactWiseContactCategory 
    private void FillContactWiseContactCategory()
    {
        string Connectionstring = ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString;

        using (SqlConnection objConn = new SqlConnection(Connectionstring))
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                    objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "PR_ContactWiseContactCategory_SelectByUserIDContactID";
                    if(Request.QueryString["ContactID"]!=null)
                        objCmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["ContactID"].ToString());
                    objCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Convert.ToInt32(Session["UserID"].ToString());

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if (objSDR.HasRows)
                        {
                            while (objSDR.Read())
                            {
                                if (objSDR["ContactCategoryID"] != null)
                                {
                                    foreach (ListItem listitem in cblContactCategory.Items)
                                    {
                                        if (listitem.Value == objSDR["ContactCategoryID"].ToString())
                                            listitem.Selected = true;
                                    }
                                }
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

    #region AddUpdate data in ContactWiseContactCategory Table 
    private void AddUpdateDatainContactWiseContactCategory(SqlInt32 ContactID)
    {
        string Connectionstring = ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString;

        if (Request.QueryString["ContactID"] != null)
        {
            #region Delete old reccord from table

            using (SqlConnection objConn = new SqlConnection(Connectionstring))
            {
                try
                {
                    if (objConn.State != ConnectionState.Open)
                        objConn.Open();
                    using (SqlCommand objCmd = objConn.CreateCommand())
                    {
                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_ContactWiseContactCategory_DeleteByUserIDContactID";
                        objCmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = ContactID;
                        objCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Convert.ToInt32(Session["UserID"].ToString());
                        objCmd.ExecuteNonQuery();
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
            #endregion
        }
        #region AddUpdate data in table 

        using (SqlConnection objConn = new SqlConnection(Connectionstring))
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                    objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "PR_ContactWiseContactCategory_InsertByUserIDContactIDContactCategoryID";

                    foreach (ListItem list in cblContactCategory.Items)
                    {
                        if (list.Selected == true)
                        {
                            objCmd.Parameters.Add("@ContactID", SqlDbType.Int).Value = ContactID;
                            objCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Convert.ToInt32(Session["UserID"].ToString());
                            objCmd.Parameters.Add("@ContactCategoryID", SqlDbType.Int).Value = Convert.ToInt32(list.Value);
                            objCmd.ExecuteNonQuery();
                            objCmd.Parameters.Clear();
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
        #endregion
    }
    #endregion
}