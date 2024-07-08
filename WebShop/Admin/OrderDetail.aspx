<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="WebShop.Admin.OrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">
                   <h4 class="card-title">Статус заказа</h4>
                    <hr />

                    <div class="form-body">

                        <%--  <lable>Вес товара</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtProductSize" runat="server" CssClass="form-control" plaseholder="Введите вес товара"></asp:TextBox>                                   
                                </div>
                            </div>
                        </div>

                     <lable>Стоимость</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" plaseholder="Введите стоимость"></asp:TextBox>                                   
                                </div>
                            </div>
                        </div>--%>

                        <asp:DropDownList ID="ddlCompany" runat="server" CssClass="form-control"
                        DataSourceID="SqlDataSource2" DataTextField="StstusName" DataValueField="Id"
                        AppendDataBoundItems="true">
                                     <asp:ListItem Value="0">Выберите статус</asp:ListItem>
                                </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  
                                        ErrorMessage="Выберите статус" ForeColor="Red" Display="Dynamic" 
                                        SetFocusOnError="true" ControlToValidate="ddlCompany" InitialValue="0">
                                       </asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [Id], [StstusName] FROM [Status]"></asp:SqlDataSource>
                        </div>
                     </div>
                   
                    <div class="form-actiona pb-5">
                            <div class="text-left">
                                <asp:Button ID="btnAddOrUpdate" runat="server" CssClass="btn btn-info" Text="Сохранить изменения" OnClick="btnAddOrUpdate_Click"/>                              
                            </div>
                       
                    </div>
                    </div>
            </div>

     <div class="col-sm-12 col-md-8">
         
            <div class="card">

                <div class="card-body">
                    
                    <div class="table-responsive">
                        <div class="text-center mb-4">
           <%-- <h2 class="section-title px-5"><span class="px-2">РЕДАКТИРОВАНИЕ ПРОФИЛЯ</span></h2>--%>
                     <asp:Label ID="lblForText" runat="server" Visible="false" CssClass="card-title"></asp:Label>
           
        </div>
                      <asp:Repeater ID="rDetail" runat="server" OnItemCommand="rDetail_ItemCommand" >
                    <HeaderTemplate>
                       
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>  
                            <th>Наименование</th>
                             <th></th>
                            <th>Вес</th>
                            <th>Количесво</th>
                            <th>Цена</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                  </HeaderTemplate>

                                <ItemTemplate>
                    <tbody class="align-middle">
                        <tr>
                                                    
                            <td>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                            </td>
                             <td> 
                                 <img width="50" src="<%# WebShop.Utils.getImageUrl( Eval("ProductImageUrl")) %>" alt="image" />
                            </td>
                            <td>
                                <asp:Label ID="lblSize" runat="server"  Text='<%# Eval("Size")%>'></asp:Label>
                                   
                            </td>
                            <td>
                                <asp:Label ID="lblQuant" runat="server"  Text='<%# Eval("Quantity")%>'></asp:Label>
                                   
                            </td>
                            <td><asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>₽
                                
                            </td>
                            <%-- <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-edit"
                                             CommandArgument='<%# Eval("OrderDetailID") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                            </td>--%>

                            
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

</asp:Content>
