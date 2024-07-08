<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebShop.Admin.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-12">
                        <div class="card">

                            <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="container">
                                    <div class="form-group col-md-4">
                                        <label>Период с</label>
                                        <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ForeColor="Red" ErrorMessage="*"
                                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtFromDate"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>По</label>
                                        <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ForeColor="Red" ErrorMessage="*"
                                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:Button ID="btnSearch" runat="server" Text="Найти" CssClass="btn btn-primary mt-md-4" OnClick="btnSearch_Click" />
                                    </div>
                                </div>
                            </div>
                           

                            <div class="col-sm-12 col-md-8">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Отчетность</h4>
                    <hr />
                    <div class="table-responsive">

                                                 <asp:Repeater ID="rReporter" runat="server" OnItemCommand="rReporter_ItemCommand">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <%--<th class="table-plus">Номер заказа</th>--%>
                                            <th>Товар</th>
                                             <th>Количество</th>
                                             <th>Итого</th>
                                            <th>Дата заказа</th>
                                           <%-- <th>Активность</th>
                                            <th>Дата создания</th>
                                            <th class="datatable-nosort">Действия</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                   <%-- <td class="table-plus"> <%# Eval("OrderNo") %> </td>--%>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%# Eval("TotPrice") %></td>
                                     <td><%# Eval("OrderDate") %></td>
                                    
                                  
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
                    </div>
                </div>
            </div>
        </div>

                            </div>
        </div>

</asp:Content>
