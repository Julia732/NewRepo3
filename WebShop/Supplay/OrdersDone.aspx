<%@ Page Title="" Language="C#" MasterPageFile="~/Supplay/Orders.Master" AutoEventWireup="true" CodeBehind="OrdersDone.aspx.cs" Inherits="WebShop.Supplay.OrdersDone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="table-responsive">
                                <asp:Repeater ID="rOrder3" runat="server" >
                    <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                             <th scope="col">Номер заказа</th>
                                            <th scope="col">Адрес</th>
                                            <th scope="col">Квартира</th>
                                            <th scope="col">Номер телефона</th>
                                            <%--<th scope="col">Статус </th>
                                            <th scope="col"></th>--%>
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
                                            <%--<td>
                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass="fas fa-check"
                                             CommandArgument='<%# Eval("@OrderID") %>' CommandName="delete" >                                          
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

</asp:Content>
