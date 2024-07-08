<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebShop.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    


             <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Заказы</h4>                                
                            </div>

                             <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Все</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Новый заказ</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Заказ в сборке</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-4">Ищем курьера</a>
                     <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-5">Передан курьеру</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-6">Доставлен</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">

                          <div class="table-responsive">
                                <asp:Repeater ID="rOrders" runat="server" OnItemCommand="rOrders_ItemCommand">
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Номер заказа</th>
                                            <th scope="col">Номер телефона</th>
                                            <th scope="col">Дата заказа</th>
                                            <th scope="col">Статус </th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>

                                <ItemTemplate>
                                        <tr>
                                            <th> <%# Eval("OrderNo") %></th>
                                             <th> <%# Eval("PhoneNumber") %></th>
                                            <td><%# Eval("OrderDate") %></td>
                                            <td><%# Eval("StstusName") %></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-eye"
                                             CommandArgument='<%# Eval("OrderNo") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                            </td>
                                        </tr>    
                                     </ItemTemplate>
                    <FooterTemplate>
                                    </tbody>
                                </table>
                        </FooterTemplate>                    
              
              </asp:Repeater>
                            </div>
                           <%-- <h4 id="mdo"></h4>--%>
                            

                        </div>
                     <div class="tab-pane fade" id="tab-pane-2">
                           <div class="table-responsive">
                                <asp:Repeater ID="rOrder2" runat="server" OnItemCommand="rOrder2_ItemCommand">
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Номер заказа</th>
                                            <th scope="col">Номер телефона</th>
                                            <th scope="col">Дата заказа</th>
                                            <th scope="col">Статус </th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>

                                <ItemTemplate>
                                        <tr>
                                            <th> <%# Eval("OrderNo") %></th>
                                             <th> <%# Eval("PhoneNumber") %></th>
                                            <td><%# Eval("OrderDate") %></td>
                                            <td><%# Eval("StstusName") %></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-eye"
                                             CommandArgument='<%# Eval("OrderNo") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                            </td>
                                        </tr>    
                                     </ItemTemplate>
                    <FooterTemplate>
                                    </tbody>
                                </table>
                        </FooterTemplate>                    
              
              </asp:Repeater>
                            </div>
                         </div>

                    <div class="tab-pane fade" id="tab-pane-3">
                         <div class="table-responsive">
                                <asp:Repeater ID="rOrder3" runat="server" OnItemCommand="rOrder3_ItemCommand">
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Номер заказа</th>
                                            <th scope="col">Номер телефона</th>
                                            <th scope="col">Дата заказа</th>
                                            <th scope="col">Статус </th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>

                                <ItemTemplate>
                                        <tr>
                                            <th> <%# Eval("OrderNo") %></th>
                                             <th> <%# Eval("PhoneNumber") %></th>
                                            <td><%# Eval("OrderDate") %></td>
                                            <td><%# Eval("StstusName") %></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-eye"
                                             CommandArgument='<%# Eval("OrderNo") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                            </td>
                                        </tr>    
                                     </ItemTemplate>
                    <FooterTemplate>
                                    </tbody>
                                </table>
                        </FooterTemplate>                    
              
              </asp:Repeater>
                            </div>
                        </div>

                    <div class="tab-pane fade" id="tab-pane-4">
                         <div class="table-responsive">
                                <asp:Repeater ID="rOrder4" runat="server" OnItemCommand="rOrder4_ItemCommand">
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Номер заказа</th>
                                            <th scope="col">Номер телефона</th>
                                            <th scope="col">Дата заказа</th>
                                            <th scope="col">Статус </th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>

                                <ItemTemplate>
                                        <tr>
                                            <th> <%# Eval("OrderNo") %></th>
                                             <th> <%# Eval("PhoneNumber") %></th>
                                            <td><%# Eval("OrderDate") %></td>
                                            <td><%# Eval("StstusName") %></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-eye"
                                             CommandArgument='<%# Eval("OrderNo") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                            </td>
                                        </tr>    
                                     </ItemTemplate>
                    <FooterTemplate>
                                    </tbody>
                                </table>
                        </FooterTemplate>                    
              
              </asp:Repeater>
                            </div>
                    </div>

                    <div class="tab-pane fade" id="tab-pane-5">
                          <div class="table-responsive">
                                <asp:Repeater ID="rOrder5" runat="server" OnItemCommand="rOrder5_ItemCommand">
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Номер заказа</th>
                                            <th scope="col">Номер телефона</th>
                                            <th scope="col">Дата заказа</th>
                                            <th scope="col">Статус </th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>

                                <ItemTemplate>
                                        <tr>
                                            <th> <%# Eval("OrderNo") %></th>
                                             <th> <%# Eval("PhoneNumber") %></th>
                                            <td><%# Eval("OrderDate") %></td>
                                            <td><%# Eval("StstusName") %></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit"  runat="server" CssClass="fas fa-eye"
                                             CommandArgument='<%# Eval("OrderNo") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                            </td>
                                        </tr>    
                                     </ItemTemplate>
                    <FooterTemplate>
                                    </tbody>
                                </table>
                        </FooterTemplate>                    
              
              </asp:Repeater>
                            </div>
                    </div>

                    <div class="tab-pane fade" id="tab-pane-6">
                          <div class="table-responsive">
                                <asp:Repeater ID="rOrder6" runat="server" OnItemCommand="rOrder6_ItemCommand">
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Номер заказа</th>
                                            <th scope="col">Номер телефона</th>
                                            <th scope="col">Дата заказа</th>
                                            <th scope="col">Статус </th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>

                                <ItemTemplate>
                                        <tr>
                                            <th> <%# Eval("OrderNo") %></th>
                                            <th> <%# Eval("PhoneNumber") %></th>
                                            <td><%# Eval("OrderDate") %></td>
                                            <td><%# Eval("StstusName") %></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-eye"
                                             CommandArgument='<%# Eval("OrderNo") %>' CommandName="delete" >                                          
                                                 </asp:LinkButton>
                                            </td>
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
