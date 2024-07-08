<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebShop.Admin.Users" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>

      <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">
                   <h4 class="card-title">Роль пользователя</h4>
                    
                     
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="lblUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    <hr />

                    <div class="form-body">

                        <lable>Роль</lable>
                        <div>
                            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control"
                                DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id"
                                AppendDataBoundItems="true">
                                     <asp:ListItem Value="0">Выберите статус</asp:ListItem>
                                </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  
                                        ErrorMessage="Выберите роль" ForeColor="Red" Display="Dynamic" 
                                        SetFocusOnError="true" ControlToValidate="ddlRole" InitialValue="0">
                                       </asp:RequiredFieldValidator>--%>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [Id], [Name] FROM [AspNetRoles]"></asp:SqlDataSource>

                           
                            </div>
                      </div>
                     </div>

                     <div class="form-actiona pb-5">
                            <div class="text-left">
                                <asp:Button ID="btnAddOrUpdate" runat="server" CssClass="btn btn-info" Text="Изменить" OnClick="btnAddOrUpdate_Click"/>
                            </div>
                        </div>

                   
               </div>

           </div>
   

         <div class="col-sm-12 col-md-8">
         
            <div class="card">

                <div class="card-body">
                    
                    <div class="table-responsive">
                        <div class="text-center mb-4">
                        <asp:Repeater ID="rUsers" runat="server" OnItemCommand="rUsers_ItemCommand">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th class="table-plus">Логин пользователя</th>                                            
                                            <th>Роль</th>
                                            <th>Изменить роль</th>
                                           <%-- <th class="datatable-nosort">Действия</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="table-plus"> <%# Eval("UserName") %> </td>
                                    <td><%# Eval("Name") %></td>
                                    <td>
                                       <%-- <asp:LinkButton ID="lbEdit" runat="server" CssClass="badge badge-primary"
                                            CommandArgument='<%# Eval("Id") %>' CommandName="edit" CausesValidation="false" >
                                            <i class="fas fa-edit"></i>
                                        </asp:LinkButton>--%>
                                       
                                         <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-edit"
                                             CommandArgument='<%# Eval("Id") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                    </td>
                                    <%--<td><%# Eval("Mobile") %></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("Address") %></td>
                                     <td><%# Eval("CreatedDate") %></td>--%>
                                    
                                      
                                    <%--</td>--%>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                  </tbody>
                                  </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
                 </div> 
   </div>
           
</asp:Content>
