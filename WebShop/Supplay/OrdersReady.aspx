<%@ Page Title="" Language="C#" MasterPageFile="~/Supplay/Orders.Master" AutoEventWireup="true" CodeBehind="OrdersReady.aspx.cs" Inherits="WebShop.Supplay.OrdersReady" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Заказы</h4>                                
                            </div>

                            

                          <div class="table-responsive">
                                <asp:Repeater ID="rOrders" runat="server" OnItemCommand="rOrders_ItemCommand">
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Номер заказа</th>
                                            <th scope="col">Адрес</th>
                                            <th scope="col">Квартира</th>
                                            <th scope="col">Номер телефона</th>
                                            <th scope="col">Статус </th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>

                                <ItemTemplate>
                                        <tr>
                                            <th> <%# Eval("OrderNo") %></th>
                                            <td><%# Eval("Street") %></td>
                                            <td><%# Eval("Apartment") %></td>
                                            <td><%# Eval("PhoneNumber") %></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-check"
                                             CommandArgument='<%# Eval("OrderID") %>' CommandName="delete" >                                          
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

                    
                    </div>


</asp:Content>
