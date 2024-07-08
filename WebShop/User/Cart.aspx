<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebShop.User.Cart"  EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->--%>
     <div class="container-fluid">
        
        <div class="text-center mb-4">
           
             <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server" Visible ="False"></asp:Label>
    </div>
        </div>
        </div>

    <!-- Cart Start -->
     

    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <asp:Repeater ID="rCart" runat="server" OnItemCommand="rCart_ItemCommand" OnItemDataBound="rCart_ItemDataBound">
                    <HeaderTemplate>
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>                           
                            <th class="table-plus">Товары</th>
                            <th>Изображение</th>
                            <th>Цена</th>
                            <th>Количество</th>
                            <th>Итоговая стоимость</th>
                             <th></th>
                            <%--<th class="datatable-nosort">Удалить</th>--%>
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
                            <td><asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>₽
                                <%--<asp:HiddenField ID="hdnProductId" runat="server" Value='<%# Eval("ProductId") %>' />
                                <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Qty") %>' />
                                <asp:HiddenField ID="hdnPrdQuantity" runat="server" Value='<%# Eval("PrdQty") %>' />--%>
                            </td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                       <asp:LinkButton ID="lbMinus" runat="server" CssClass="btn btn-sm btn-primary btn-minus"
                                            CommandArgument='<%# Eval("ProductId") %>' CommandName="minus" CausesValidation="false" >
                                            <i class="fa fa-minus"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <%--<input type="text" class="form-control form-control-sm bg-secondary text-center" value='<%# Eval("Qty") %>'>--%>
                                    <asp:Label ID="lblQuant" runat="server" Cssclass="form-control form-control-sm bg-secondary text-center" Text='<%# Eval("Qty")%>'></asp:Label>
                                    <div class="input-group-btn">
                                        <asp:LinkButton ID="lbPlus" runat="server" CssClass="btn btn-sm btn-primary btn-plus"
                                             CommandArgument='<%# Eval("ProductId") %>' CommandName="plus"  >
                                            <i class="fa fa-plus"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </td>
                             <td>
                                <asp:Label ID="lblTotQuant" runat="server" Text='<%# Eval("TotPrice") %>'></asp:Label>₽
                            </td>
                             <td> 
                                <asp:LinkButton ID="lbDelete" Text="Delete" runat="server" CssClass="badge badge-danger"
                                             CommandArgument='<%# Eval("ProductId") %>' CommandName="delete"  >
                                            <i class="fas fa-trash-alt"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                       <%-- <tr>
                            <td class="table-plus"> <%# Eval("ProductName") %> </td>
                            <td> 
                                 <img width="50" src="<%# WebShop.Utils.getImageUrl( Eval("ProductImageUrl")) %>" alt="image" />
                            </td>
                            <td><%# Eval("Price") %></td>
                            <td>
                                <asp:LinkButton ID="lbMinus" runat="server" CssClass="btn btn-sm btn-primary btn-minus"
                                            CommandArgument='<%# Eval("ProductId") %>' CommandName="minus" CausesValidation="false" >
                                            <i class="fa fa-minus"></i>
                                        </asp:LinkButton>
                                <%# Eval("Qty") %>
                                        <asp:LinkButton ID="lbPlus" runat="server" CssClass="btn btn-sm btn-primary btn-plus"
                                             CommandArgument='<%# Eval("ProductId") %>' CommandName="plus"  >
                                            <i class="fa fa-plus"></i>
                                        </asp:LinkButton>
                            </td>
                            <td><%# Eval("Qty") %></td>
                            <td> 
                                <asp:LinkButton ID="lbDelete" Text="Delete" runat="server" CssClass="badge badge-danger"
                                             CommandArgument='<%# Eval("ProductId") %>' CommandName="delete"  >
                                            <i class="fas fa-trash-alt"></i>
                                </asp:LinkButton>
                            </td>
                          </tr>--%>
                    
                        </ItemTemplate>
                    <FooterTemplate>
                                  </tbody>
                                  </table>
                            </FooterTemplate>
            <%--    </table>--%>
              
              </asp:Repeater>
            </div>
            <div class="col-lg-4">
               <%-- <forms class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Купон">
                        <div class="input-group-append">
                           <asp:Button ID="btnCupon" runat="server" CssClass="btn btn-block btn-primary my-3 py-3" OnClick="btnCupon_Click"></asp:Button>                         

                        </div>
                    </div>
                </forms>          --%>    
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Заказ</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Цена</h6>  
                            <h6 class="font-weight-medium">
                                 <asp:Label ID="lblSum" runat="server"></asp:Label>₽
                            </h6>
                           
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Доставка</h6>
                            <h6 class="font-weight-medium">
                                 <asp:Label ID="lblDelPrice" runat="server" Text="99"></asp:Label>₽
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Общая стоимость</h5>
                            <h5 class="font-weight-bold">
                                <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>₽
                            </h5>
                        </div>
                        <a href="Checkout.aspx" class="btn btn-block btn-primary my-3 py-3">Оформить заказ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->

</asp:Content>
