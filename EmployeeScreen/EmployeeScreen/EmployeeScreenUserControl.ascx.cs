using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.Utilities;

namespace EmployeeScreen.EmployeeScreen
{
    public partial class EmployeeScreenUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    var Deplist = SPContext.Current.Web.Lists.TryGetList(Utilities.Department);

                    if (Deplist != null)
                    {
                        DdlDep.Items.Clear();
                        DdlDep.Items.Add("--Select--");
                        var collection = Deplist.GetItems();
                        foreach (SPListItem item in collection)
                        {
                            DdlDep.Items.Add(item["Department"].ToString());


                        }
                    }
                    var Desiglist = SPContext.Current.Web.Lists.TryGetList(Utilities.Designation);

                    if (Desiglist != null)
                    {
                        DdlDesignation.Items.Clear();
                        DdlDesignation.Items.Add("--Select--");
                        var collection = Desiglist.GetItems();
                        foreach (SPListItem item in collection)
                        {
                            DdlDesignation.Items.Add(item["Designation"].ToString());


                        }
                    }
                    var Leavetypelist = SPContext.Current.Web.Lists.TryGetList(Utilities.EmployeeType);

                    if (Leavetypelist != null)
                    {
                        DdlEmptype.Items.Clear();
                        DdlEmptype.Items.Add("--Select--");
                        var collection = Leavetypelist.GetItems();
                        foreach (SPListItem item in collection)
                        {
                            DdlEmptype.Items.Add(item["Title"].ToString());


                        }
                    }



                }
                catch (Exception ex)
                {
                    LblError.Text = ex.Message;

                }
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (SPContext.Current != null)
            {
                if (DdlDep.SelectedIndex < 1) 
                { 
                    LblError.Text = "Please select department fields.";
                    LblError.Text += "<br/>"; 
                    return;
                }
                if (DdlDesignation.SelectedIndex < 1)
                {
                    LblError.Text = "Please select designation fields.";
                    LblError.Text += "<br/>";
                    return;
                }
                if (DdlEmptype.SelectedIndex < 1)
                {
                    LblError.Text = "Please select employee type fields.";
                    LblError.Text += "<br/>";
                    return;
                }

               

                using (var site = new SPSite(SPContext.Current.Site.Url))
                {
                    using (var web = site.OpenWeb())
                    {



                        var list = web.Lists.TryGetList(Utilities.EmployeeScreen);

                        
                        web.AllowUnsafeUpdates = true;
                        var newItem = list.Items.Add();
                        var empdupID = txtempid.Text;
                        var query = new SPQuery()
                                        {
                                           Query = @"<Where>
                                                            <Eq>
                                                        <FieldRef Name='Title' />
                                                                     <Value Type='Text'>" + empdupID + @"</Value>
                                                            </Eq>
                                                     </Where>"

                                        };
                        var collection = list.GetItems(query);
                        if (collection.Count == 0)
                        {
                            newItem[Utilities.EmployeeID] = txtempid.Text;
                            newItem[Utilities.EmployeeName] = web.AllUsers[peoplepickeremp.Accounts[0].ToString()];
                            newItem[Utilities.FirstName] = txtfristname.Text;
                            newItem[Utilities.LastName] = txtlastname.Text;
                            newItem["Employee Type"] = DdlEmptype.SelectedValue;
                            newItem["Department"] = DdlDep.SelectedValue;
                            newItem["Designation"] = DdlDesignation.SelectedValue;
                            newItem[Utilities.Email] = Txtmail.Text;
                            newItem[Utilities.Mobile] = TxtContact.Text;
                            newItem[Utilities.DateofJoin] = DtDoj.SelectedDate;
                            newItem[Utilities.DOB] = DtDOB.SelectedDate;


                            newItem.Update();

                      //      SPListItem item = properties.ListItem;
                        //    var createdByLeaveRequest = new SPFieldUserValue(properties.Web, item["Created By"].ToString());

                            var leavelist = web.Lists.TryGetList(Utilities.LeaveDays);
                            var field = leavelist.Fields["Employee Type"];
                            var leaveDaysQuery = new SPQuery()
                            {
                                Query = @"<Where>
                                                            <Eq>
                                                        <FieldRef Name='" + field.InternalName + @"' />
                                                                     <Value Type='Lookup'>" + DdlEmptype.SelectedItem.Text + @"</Value>
                                                            </Eq>
                                                     </Where>"

                            };
                            var leaveDayscollection = leavelist.GetItems(leaveDaysQuery);

                            foreach (SPListItem leaveType in leaveDayscollection)
                            
                            {


                                var empLeavelist = web.Lists.TryGetList(Utilities.EmployeeLeaves);
                                var empLeaveItem = empLeavelist.Items.Add();

                                empLeaveItem["Employee ID"] = txtempid.Text;
                                empLeaveItem[Utilities.EmployeeName] = web.AllUsers[peoplepickeremp.Accounts[0].ToString()];
                                empLeaveItem["Leave Type"] = leaveType["Leave Type"].ToString();
                                empLeaveItem["Leave Balance"] = leaveType["Leave Days"].ToString();
                                empLeaveItem["Leave utilized"] = 0;
                                empLeaveItem["Leave Requested"] = 0;

                                empLeaveItem.Update();


                            }
                            Response.Redirect(SPContext.Current.Web.Url);
                
                            web.AllowUnsafeUpdates = false;

                        }

                        else
                        {
                            LblError.Text = "user is exist in this list.";
                            LblError.Text += "<br/>";
                            return;
                        }

                        
                    }
                }
            
            }

        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            txtempid.Text = "";
            txtfristname.Text = "";
            txtlastname.Text = "";
            //DdlEmptype.SelectedValue = "";
            //DdlDep.SelectedValue = "";
            //DdlDesignation.SelectedValue = "";
            Txtmail.Text = "";
            TxtContact.Text = "";


        }
    }
}
