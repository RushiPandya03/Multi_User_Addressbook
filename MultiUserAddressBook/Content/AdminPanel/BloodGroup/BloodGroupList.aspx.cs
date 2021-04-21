﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_AdminPanel_BloodGroup_BloodGroupList : System.Web.UI.Page
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
            FillGridViewBloodGroup();
        }
    }
    #endregion

    #region Fill BloodGroup Grid View
    private void FillGridViewBloodGroup()
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
                    objCmd.CommandText = "PR_BloodGroup_SelectAllByUserID";

                    if (Session["UserID"] != null)
                        objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

                    using (SqlDataReader objSDR = objCmd.ExecuteReader())
                    {
                        if (objSDR.HasRows)
                        {
                            gvBloodGroup.DataSource = objSDR;
                            gvBloodGroup.DataBind();
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

    #region Button: Add BloodGroup
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Content/AdminPanel/BloodGroup/BloodGroupAddEdit.aspx");
    }
    #endregion

    #region Button: Delete Contact Category 
    private void DeleteBloodGroup(SqlInt32 BloodGroupID)
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
                    objCmd.CommandText = "PR_BloodGroup_DeleteByPKUserID";

                    objCmd.Parameters.Add("@BloodGroupID", SqlDbType.Int).Value = BloodGroupID;
                    objCmd.Parameters.Add("UserID", SqlDbType.Int).Value = Session["UserID"];

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
    }
    #endregion

    #region Button: Delete Edit Record
    protected void gvBloodGroup_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            if (e.CommandArgument != null)
            {
                DeleteBloodGroup(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
                FillGridViewBloodGroup();
            }
        }
        else if (e.CommandName == "EditRecord")
        {
            if (e.CommandArgument != null)
            {
                Response.Redirect(e.CommandArgument.ToString().Trim());
            }
        }
    }
    #endregion
}