<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Fruits.aspx.cs" Inherits="WebShop.User.Fruits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">ФРУКТЫ И ЯГОДЫ</span></h2>
        </div>
        </div>
   <div class="filters_menu">
                    <div class="row grid">
    <asp:Repeater ID="rFruits" runat="server" OnItemCommand="rFruits_ItemCommand">
                            <ItemTemplate>
                                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" width="250"  src="<%# WebShop.Utils.getImageUrl( Eval("ProductImageUrl")) %>" alt="" />
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6><%# Eval("ProductName") %></h6>
                                <div class="d-flex justify-content-center">
                                     <h6><%# Eval("Price") %></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                 <asp:LinkButton ID="getInformation" CssClass="btn btn-sm text-dark p-0" runat="server" CommandName="getInform" Text="Посмотреть подробнее" CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                            <asp:LinkButton ID="lbAddToCart" runat="server" CssClass="btn btn-sm text-dark p-0" CommandName="addToCart" Text="Добавить в корзину"  CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                                
                            </div>
                        </div>
                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
        </div>

</asp:Content>
