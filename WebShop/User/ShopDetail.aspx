<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ShopDetail.aspx.cs" Inherits="WebShop.User.ShopDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">
        
        <div class="text-center mb-4">
            
            <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server" Visible ="False"></asp:Label>
    </div>
        </div>
        </div>

    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <asp:Image ID="ProductImg" runat="server" CssClass="w-100 h-100" alt="Image" />
                <%--<img class="w-100 h-100" --%>
               <%-- <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="../UserTemplate/img/product-1.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="../UserTemplate/img/product-2.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="../UserTemplate/img/product-3.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="../UserTemplate/img/product-4.jpg" alt="Image">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>--%>
            </div>

            <div class="col-lg-7 pb-5">
                <h3>
                        <asp:Label ID="Name" runat="server" CssClass="font-weight-semi-bold"></asp:Label>
                    </h3>
              
                <h3>
                    <asp:Label ID="Price" runat="server" CssClass="font-weight-semi-bold mb-4">₽</asp:Label>₽
                </h3>
                <%--<h3 class="font-weight-semi-bold mb-4">$150.00</h3>--%>
                <h3>
                     <asp:Label ID="Company" runat="server" CssClass="font-weight-semi-bold" Text="Производитель:"></asp:Label>
                    <asp:Label ID="CompanyName" runat="server" CssClass="font-weight-semi-bold"></asp:Label>
                </h3>
               <%-- <p class="mb-4">Volup erat ipsum diam elitr rebum et dolor. Est nonumy elitr erat diam stet sit clita ea. Sanc invidunt ipsum et, labore clita lorem magna lorem ut. Erat lorem duo dolor no sea nonumy. Accus labore stet, est lorem sit diam sea et justo, amet at lorem et eirmod ipsum diam et rebum kasd rebum.</p>--%>
             
<%--                <div class="d-flex align-items-center mb-4 pt-2">--%>
                <div class="d-flex align-items-center mb-4 pt-2">
                   
                    <asp:Button ID="AddToCart" runat="server" CssClass="btn btn-primary px-3" OnClick="AddToCart_Click" Text="Добавить в корзину" />

                </div>

                 <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Описание</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Энергетическая ценность</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                     
                        <p>
                            <asp:Label ID="Description" runat="server" CssClass="mb-4"></asp:Label>
                        </p>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">На 100 грамм:</h4>
                       <p>
                            <asp:Label ID="EnergyValue" runat="server" CssClass="mb-4"></asp:Label>
                        </p>
                    </div>                   
                </div>
            </div>
        </div>
                    <%--<div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                       <asp:LinkButton ID="lbMinus" runat="server" CssClass="btn btn-sm btn-primary btn-minus"
                                            OnClick="lbMinus_Click" CommandName="minus" CausesValidation="false" >
                                            <i class="fa fa-minus"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <%--<input type="text" class="form-control form-control-sm bg-secondary text-center" value='<%# Eval("Qty") %>'>--%>
                                    <%--<asp:Label ID="lblQuant" runat="server" Cssclass="form-control form-control-sm bg-secondary text-center" Text='<%# Eval("Qty")%>'></asp:Label>
                                    <div class="input-group-btn">
                                        <asp:LinkButton ID="lbPlus" runat="server" CssClass="btn btn-sm btn-primary btn-plus"
                                             OnClick="lbPlus_Click" CommandName="plus"  >
                                            <i class="fa fa-plus"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>--%>
                   <%--</div>--%>
                     
                    <%--<asp:Button ID="AddToCart" runat="server" CssClass="btn btn-primary px-3" OnClick="AddToCart_Click" Text="Добавить в корзину" />--%>
                </div>
              </div>
                    
            </div>
        </div>
        <%--<div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Описание</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Энергетическая ценность</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                     
                        <p>
                            <asp:Label ID="Description" runat="server" CssClass="mb-4"></asp:Label>
                        </p>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">На 100 грамм:</h4>
                       <p>
                            <asp:Label ID="EnergyValue" runat="server" CssClass="mb-4"></asp:Label>
                        </p>
                    </div>                   
                </div>
            </div>
        </div>--%>
<%--    </div>--%>
    <!-- Shop Detail End -->


   <%-- <!-- Products Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../UserTemplate/img/product-1.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../UserTemplate/img/product-2.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../UserTemplate/img/product-3.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../UserTemplate/img/product-4.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="../UserTemplate/img/product-5.jpg" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->--%>

</asp:Content>
