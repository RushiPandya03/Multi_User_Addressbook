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

public partial class Content_AdminPanel_Login : System.Web.UI.Page
{
    #region Load Page
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Button: Login
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        #region Local Variables
        SqlString strUserName = SqlString.Null;
        SqlString strPassword = SqlString.Null;
        string strError = "";
        #endregion

        #region Server Side Validation
        if (txtUserName.Text.Trim() == "")
            strError += "Enter UserName </br>";

        if (txtPassword.Text.Trim() == "")
            strError += "Enter Password </br>";

        if (strError.Trim() != "")
        {
            lblErrorMessage.Text = strError;
            return;
        }
        #endregion

        #region Read Form Value
        if (txtUserName.Text.Trim() != "")
            strUserName = txtUserName.Text.Trim();
        if (txtPassword.Text.Trim() != "")
            strPassword = txtPassword.Text.Trim();
        #endregion

        #region Fill Login Form
        using (SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConectionString"].ConnectionString))
        {
            try
            {
                if (objConn.State != ConnectionState.Open)
                {
                    objConn.Open();
                }

                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "[PR_User_SelectByUserNamePassword]";

                    objCmd.Parameters.Add("@UserName",SqlDbType.VarChar).Value = strUserName;
                    objCmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = strPassword;

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if(objSDR.HasRows)
                        {
                            //lblErrorMessage.Text = "Valid";
                            while(objSDR.Read())
                            {
                                if (!objSDR["UserID"].Equals(DBNull.Value))
                                    Session["UserID"] = objSDR["UserID"].ToString().Trim();

                                if (!objSDR["DisplayName"].Equals(DBNull.Value))
                                    Session["DisplayName"] = objSDR["DisplayName"].ToString().Trim();

                                Response.Redirect("~/Content/AdminPanel/Country/CountryList.aspx");
                            }
                        }
                        else
                        {
                            lblErrorMessage.Text = "Either UserName or Password is InValid Please Try Again";
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
            finally
            {
                if(objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
            }
        }
        #endregion

    }
    #endregion
}